---
layout: post
title: How to suppress specific phpmd warnings
tags: [PHP, PHPMD]
---

I was struggling to find the specific types of warnings to suppress. So here is a list of Warnings that can be suppressed:

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

Here are some NCSS related (not sure if they work), for by the time of this writting they were commented;

- NcssMethodCount
- NcssTypeCount
- NcssConstructorCount

The rules were extracted from [this file](https://github.com/DallasMuseumArt/DMA-Friends/blob/master/build/phpmd.xml)
