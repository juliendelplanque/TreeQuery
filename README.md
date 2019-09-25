# TreeQuery
[![Build Status](https://travis-ci.org/juliendelplanque/TreeQuery.svg?branch=master)](https://travis-ci.org/juliendelplanque/TreeQuery)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A framework allowing to manipulate tree data structures easily in Pharo.

## Install
Execute the following script in a Pharo image to install this project.

```Smalltalk
Metacello new
    repository: 'github://JulienDelplanque/TreeQuery/src';
    baseline: 'TreeQuery';
    load
```

## Use as dependency
To use this project as a dependency, add the following code in your baseline:
```Smalltalk
[...]
spec baseline: 'TreeQuery' with: [ 
	spec
		repository: 'github://juliendelplanque/TreeQuery/src' ]
[...]
```

## Usage
In the future this section will contain a small tutorial.
The following examples allow to query the tree below (which is a list of list).

```Smalltalk
tree := #(1 
		(2 
			(2)
		)
		(4
			(5
				(6
					(3)
				)
			)
			(4)
		)
	).
```

In this tree, data can be accessed using `#first` and children of a node can be accessed using `#allButFirst`.
For example, the root of the tree has 3 children whose data are `2`, `4` and `4`.

### Getting started

As a first example, we will write a predicate matching a node for which its data is an odd number and has *at least* 2 children for which their data are even number. Such predicate can be written as:

```Smalltalk
predicate := [ :n | n first odd ] asTQPredicate children: {
		[ :n | n first even ] asTQPredicate.
		[ :n | n first even ] asTQPredicate }.
```

We can now use `TreeQuery` to query the `tree` using the predicate:

```Smalltalk
TreeQuery breadthFirst
	matchTree;
	predicate: predicate;
	runOn: tree childrenBlock: #allButFirst. "true"
```

The first line creates a new `TreeQuery` that will use a breadth-first iterator to walk the tree. The second line specifies that the purpose of the query is to determinate if the predicate matches the tree or not (return true or false). The third line specify the predicate to use. The last line execute the query on a particular tree and specify how to access, for a given node, its children.

> Note: It is also possible to walk the tree depth-first, it might impact performance depending on the tree walked.

> Note 2: It is possible to configure the query for other purpose (line 2). This is called the search strategy of the query. For now, the following strategies are available:
> - `#matchTree` returning true if the predicate matched the tree at root,
> - `#matchAnywhere` returning true if the predicate matched any node of the tree,
> - `#matchEverywhere` returning true if the predicate matched all nodes of the tree,
> - `#collectMatches` returning all the nodes that were matched by the predicate.


### Strict children

The previous predicate allows to match a node for which its data is an odd number and has *at least* 2 children for which their data are even number. It is also possible to require exactly 2 children with even number as data. To do that use the following predicate:

```Smalltalk
predicate := [ :n | n first odd ] asTQPredicate strictChildren: {
		[ :n | n first even ] asTQPredicate.
		[ :n | n first even ] asTQPredicate }.
```

Using this new predicate the previous tree still matches because the root has exactly 2 even children. However the tree below does not match anymore:

```Smalltalk
notMatchingTree := #(1 (2) (2) (2) ).

TreeQuery breadthFirst
	matchTree;
	predicate: predicate;
	runOn: notMatchingTree childrenBlock: #allButFirst. "false"
```

### Paths

It is common that you are just searching for a path in the tree. There are facilities available to build such query.
For example, the following predicate allows to find paths in the tree with odd number / even number / odd number:

```Smalltalk
predicate := [ :n | n first odd ] asTQPredicate /
		[ :n | n first even ] asTQPredicate /
			[ :n | n first odd ] asTQPredicate.
```

Collecting matches of this predicate leads to the following result:
```Smalltalk
TreeQuery breadthFirst
	collectMatches;
	predicate: predicate;
	runOn: tree childrenBlock: #allButFirst. "#(#(1 #(2 #(2)) #(4 #(5 #(6 #(3))) #(4))) #(5 #(6 #(3))))"
```

### Various examples:

Search all `SystemWindow` morphs in world that hold a Calypso browser:
```Smalltalk
TreeQuery breadthFirst collectMatches
	predicate: [ :m | m class = SystemWindow ] asTQPredicate / [ :m | m isKindOf: ClyBrowserMorph ] asTQPredicate;
	runOn: World childrenBlock: #submorphs.
```

Is there an abstract class in Pharo that has at least one subclass for which the name begins with `'A'` and one subclass for which the name begins with `'Z'`:

```Smalltalk
TreeQuery breadthFirst matchTree
	predicate: #isAbstract asTQPredicate
			children: { 
				[ :class | class name beginsWith: 'A' ] asTQPredicate.
				[ :class | class name beginsWith: 'Z' ] asTQPredicate
			};
	runOn: Object childrenBlock: #subclasses.
```

Get all items from the world menu that have a name (i.e. return value of `#name` is not nil) and the name begins with `T`.
```Smalltalk
TreeQuery breadthFirst collectMatches
	predicate: ([ :menuItem | menuItem name isNotNil and: [ menuItem name beginsWith: 'T' ] ] asTQPredicate);
	runOn: WorldState new menuBuilder
	childrenBlock: [ :menuItem | menuItem itemList ifNil: [ #() ] ]. "an Array(a MenuRegistration ( #Tools )  a MenuRegistration ( #'Test Runner' )  a MenuRegistration ( #Transcript )  a MenuRegistration ( #'Time Profiler' )  a MenuRegistration ( #'Toggle full screen mode' ) )"
```
