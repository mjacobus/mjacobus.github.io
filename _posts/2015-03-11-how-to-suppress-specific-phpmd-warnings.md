---
layout: post
title: How to suppress specific PHPMD warnings
tags: [PHP, PHPMD]
comments: true
---

I was struggling to find the specific types of warnings to suppress. So here is a list of Warnings that can be suppressed:

## Unused code:

- UnusedPrivateField
- UnusedLocalVariable
- UnusedPrivateMethod
- UnusedFormalParameter


## Naming:

- ShortVariable
- LongVariable
- ShortMethodName
- ConstructorWithNameAsEnclosingClass
- ConstantNamingConventions
- BooleanGetMethodName
- VariableNamingConventions
- MethodNamingConventions
- ClassNamingConventions
- AbstractNaming
- AvoidFieldNameMatchingTypeName
- AvoidFieldNameMatchingMethodName
- NoPackage
- MisleadingVariableName

## Design:

- ExitExpression
- EvalExpression
- GotoStatement
- NumberOfChildren
- DepthOfInheritance
- CouplingBetweenObjects
- DevelopmentCodeFragment

## Controversial:

- Superglobals
- CamelCaseClassName
- CamelCasePropertyName
- CamelCaseMethodName
- CamelCaseParameterName
- CamelCaseVariableName

## Code size:

- CyclomaticComplexity
- NPathComplexity
- ExcessiveMethodLength
- ExcessiveClassLength
- ExcessiveParameterList
- ExcessivePublicCount
- TooManyFields
- NcssMethodCount
- NcssTypeCount
- NcssConstructorCount
- TooManyMethods
- TooManyPublicMethods
- ExcessiveClassComplexity

## Clean code:

- BooleanArgumentFlag
- ElseExpression
- StaticAccess
- BooleanGetMethodName
- ConstantNamingConventions
- ConstructorWithNameAsEnclosingClass
- CouplingBetweenObjects
- CyclomaticComplexity
- DepthOfInheritance
- EvalExpression
- ExcessiveClassComplexity
- ExcessiveClassLength
- ExcessiveMethodLength
- ExcessiveParameterList
- ExcessivePublicCount
- GotoStatement
- LongVariable
- NPathComplexity
- NumberOfChildren
- ShortMethodName
- ShortVariable
- TooManyFields
- TooManyMethods
- UnusedLocalVariable
- UnusedPrivateMethod

Here are some NCSS related (not sure if they work), for by the time of this writing they were commented:

- NcssMethodCount
- NcssTypeCount
- NcssConstructorCount

## Example:

```php
<?php

namespace Acme;

/**
 * @SuppressWarnings(PHPMD)
 */
Class UnavoidableComplication
{
}
?>
```

```php
<?php

namespace Acme;

Class User
{
    /**
     * @SuppressWarnings(PHPMD.BooleanGetMethodName)
     * @return bool
     */
    public function getActive()
    {
        return $this->active;
    }
}
?>
```

The rules were extracted from [these files](https://github.com/phpmd/phpmd/blob/master/src/main/resources/rulesets/).
