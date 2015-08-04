Não tenho certeza de que seja um Design Patter, mas eu achei muito simples e me ajudou
muito a deixar a intensão do código muito clara. Parece andar de mãos dadas com
DDD.

## O Command

O Command é apenas um Value Object. Não deve conter lógica alguma, apenas as informaćões
necessária que serão usadas pelo Command Handler.

O command deve implementar uma interface muito simples, até mesmo vazia, apenas
para forćar que os Command Handlers possam lidar com objetos e não com um array.
Além disto, os commandos devem ser imutáveis, para evitar efeitos colaterais.

```php
<?php

namespace App\Command;

interface CommandInterface  {
}
```

Um comando deve ter um nome descritivo e revelar a itenção por traz de sua existência.
```DeleteUserById```, ```ClearCache``` ou... entendeu né?

## O Command Handler

O handler é a classe responsável por executar (lidar com "handle") o comando.
Pense no handler como uma "ação", ou serviço. E como tal, também deve ser imutável.

O Handler também implementa uma interface muito simple.

```php
<?php

namespace App\Command;

interface CommandHandlerInterface  {
    public function handle(CommandInterface $command);
}
```

## Exemplo de uso

Todo o comando deve ter um respectivo handler. A relacão deve ser de um para um.
Imagine que agente queira excluir um usuário com um ID específico.

Nós queremos nomear o comando de acordo com o que agente quer fazer. Então
```DeleteUserById``` é um excelente nome.

```php
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
```

Note como é fácil de entender do que se trata apenas por ler o nome da do comando ```DeleteUserById```

O handler pode ser chamado então de ```DeleteUserByIdHandler```, revelando
assim sua intencão. Também fica fácil adivinhar qual o comando que ele executa.

```php
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
```

Now, note that the implementation of this command is very simple. But even if
the implementation was hell, it would be very simple to understand what that
class is about. It deletes user by id! I am not arguing that if should
carefully choose a name and not to care about the implementation, but you get
the point.

Agora note que a implementacão do comando é muito simples. Mas mesmo que a
implementacão fosse mais grotesca que um cão chupando manga, ainda seria fácil
de entender a responsabilidade da classe. Ela exclui um usuário por id, oras!

Não, eu não quero dizer que contanto que o nome da classe seja compreensível, sua
implementacão não importa.

Note também que o nosso handler pode ser facilmente testado. Suas dependências
podem ser mocadas e tudo.

## Command Bus - Um passo além

O próximo passo `CommandBus`. Você pode pensar no command bus como um handler
para todos os comandos. De fato, o ```CommandBus``` implementa a interface ```CommandHandler```.
O que ele faz é delegar o comando para o handler correto, tal qual um ```Router```
que resolve qual o controller e action que deve ser executado num framework MVC.

```php
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
```

O seu gerenciador de dependências poderia ser como segue:


```php
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
```

Agora que você tem esta parte configurada, você pode usar o ```CommandBus```
dentro do seu framwork favorito. E se quiser trocar de framework fica tudo bem fácil.

```php
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
```


## Conclusão

Na minha experiência com o ```CommandBus```, concluí que ele traz os seguintes benefícios.

- Independente de Framework
- Reutilizável
- Revela intencão do código
- Facilmente testado

Algumas pessoas usam comandos apenas para escrever e não para ler. Mas na minha
opinião ele tem servido muito bem para ler dados também.

Por que não ter um commando `GetProductsByCategoryId`, por exemplo?

Eu adoraria ouvir opiniões a respeito do artigo e do CommandBus.

### Referências:

- [Command Buses are Awesome](http://mjacobus.github.io/2015/06/17/command-buses-are-awesome.html) - O post original
- [A wave of command buses](http://php-and-symfony.matthiasnoback.nl/2015/01/a-wave-of-command-buses/) - ótimo artigo sobre command bus (em inglês)
- [Dev Discussions - The Command Bus](https://www.youtube.com/watch?v=fbSYZFZCFS0) - Discussion on command bus
- [Nurse](https://github.com/mjacobus/nurse) - a very simple dependency injection container.
- [Koine\CommandBus](https://github.com/koinephp/CommandBus) - interfaces and helpers for you to craft your command bus
- [Command Bus To Awesome Town](http://de.slideshare.net/rosstuck/command-bus-to-awesome-town)

