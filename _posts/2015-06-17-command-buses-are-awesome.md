---
layout: post
title: Command Buses are awesome
tags: [PHP, Design Patterns]
---

I'm not sure if that is really a design pattern. But I find that simple and it
helps to make code intent very clear. It goes along with DDD principles.

## The Command

The command is only a value object. There should be no logic inside it, only
the necessary information that will be used by the command handler to do its job.

It should implement a very simple interface, empty even, just as to to enforce
that command handlers deal with value objects rather than a primitive value,
such an array. It should be immutable to prevent side effects.

{% highlight php %}
<?php

namespace App\Command;

interface CommandInterface  {
}
{% endhighlight %}

A command should have a descriptive name to reveal intent, such as
DeleteUserById, ClearCache, or... well, I hope you got the point for I am
running out of ideas right now.

## The Command Handler

The command handler is the responsible class for executing (or handling) the command.
Think of it as a "action", or service if you will. As such, it should be immutable.

It also has a very simple interface.

{% highlight php %}
<?php

namespace App\Command;

interface CommandHandlerInterface  {
    public function handle(CommandInterface $command);
}
{% endhighlight %}

## Usage example

Every command should have a respective command handler. The relationship should
be one-to-one. Suppose we want to delete a user by id.


We would name our command according to what we want to do. So ```DeleteUserById```
would be a super awesome name.

{% highlight php %}
<?php

namespace App\Command;

class DeleteUserById implements CommandInterface
{
    private $userId;

    public function __construct($userId)
    {
        $this->userId = (int) $userId;
    }


    public function getUserId()
    {
        return $this->userId;
    }
}
{% endhighlight %}

The handler could be named ```DeleteUserByIdHandler```, revealing intent. Also
it is supper easy to understand what is the command it handles.

{% highlight php %}
<?php

namespace App\Command;

use App\Repository\UserRepository;

class DeleteUserByIdHandler implements CommandHandlerInterface
{
    private $repository;

    public function __construct(UserRepository $repository)
    {
        $this->repository = $repository;
    }


    public function handle(CommandInterface $command)
    {
        $this->repository->deleteById($command->getUserId());
    }
}
{% endhighlight %}

Now, note that the implementation of this command is very simple. But even if
the implementation was hell, it would be very simple to understand what that
class is about. It deletes user by id! I am not arguing that if should
carefully choose a name and not to care about the implementation, but you get
the point.

Also, the handler can be easily tested. You can mock dependencies and so on.

## One step further

The next step is called `CommandBus`. You can think of command bus as the
common handler for all your commands. It will delegate the command to the
correct command handler.

{% highlight php %}
<?php

namespace App\Command;

use Nurse\Container;

class CommandBus implements CommandHandlerInterface
{
    private $dependencyContainer;

    public function __construct(Container $container)
    {
        $this->dependencyContainer = $container;
    }


    public function handle(CommandInterface $command)
    {
        $handler = $this->getHandler($command);

        return $handler->handle($command);
    }

    private getHandler(CommandInterface $command)
    {
        $handlerClass = get_class($command) . 'Handler';

        return $this->dependencyContainer->get($handlerClass);
    }
}
{% endhighlight %}

Your dependency container could be something like follows:

{% highlight php %}
<?php

use App\Command\DeleteUserByIdHandler;
use App\Repository\UserRepository;
use PDO;

$container = new Nurse\Container();

$container->set('App\Command\DeleteUserByIdHandler', function ($container) {
    $repository = $container->get('App\Repository\UserRepository');

    return new DeleteUserByIdHandler($repository);
});

$container->set('App\Repository\UserRepository', function ($container) {
    $connection = $container->get('PDO');

    return new UserRepository($connection);
});

$container->set('PDO', function ($container) {
    return new PDO('connection_string');
});
{% endhighlight %}

Now that you have this set up, you can use the command bus inside your
framework. You can easily change framework if you want.

{% highlight php %}
<?php

namespace App\Controller;

use App\Controller\BaseController;
use App\Command\DeleteUserById;

class UsersController extends BaseController
{
    public function deleteAction()
    {
        try {
            $id = $this->getRequest()->getParam('id');
            $command = new DeleteUserById($id);
            $this->getCommandBus()->handle($command);

            // redirects, show message
        } catch (\DomainException $e) {
            // deals with error
        }
    }
}
{% endhighlight %}


## Conclusion

I have not played around much with Command/CommandHandler/CommandBus. But so far
I think it is awesome and I can see a few benefits:

- Framework agnostic
- Reusable
- Reveals intent
- Testable

Some people use commands only for writing and not for reading. But it can be
used to read also. You could have a `GetProductsByCategoryId` command, for
example.

### Resources:

- [A wave of command buses](http://php-and-symfony.matthiasnoback.nl/2015/01/a-wave-of-command-buses/) - nice article about command buses.
- [Dev Discussions - The Command Bus](https://www.youtube.com/watch?v=fbSYZFZCFS0) - Discussion on command bus
- [Nurse](https://github.com/mjacobus/nurse) - a very simple dependency injection container.
- [Koine\CommandBus](https://github.com/koinephp/CommandBus) - interfaces and helpers for you to craft your command bus

I would love to hear your experiences and opinion on this subject.
