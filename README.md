# OpinionatedC
[![Build Status](https://travis-ci.org/leoschweizer/OpinionatedC.svg?branch=master)](https://travis-ci.org/leoschweizer/OpinionatedC)
[![Coverage Status](https://coveralls.io/repos/leoschweizer/OpinionatedC/badge.svg?branch=master&service=github)](https://coveralls.io/github/leoschweizer/OpinionatedC?branch=master)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/OpinionatedC.svg)](https://cocoapods.org/pods/OpinionatedC)
[![License](https://img.shields.io/cocoapods/l/OpinionatedC.svg)](https://cocoapods.org/pods/OpinionatedC)
[![Platforms](https://img.shields.io/cocoapods/p/OpinionatedC.svg)](https://cocoapods.org/pods/OpinionatedC)

Undoubtedly, Objective-C has been influenced significantly by Smalltalk. Unfortunately, the forefathers of 
Objective-C stopped inheriting concepts where stuff gets really interesting (and a pleasure to work with).

OpinionatedC is here to fix that.

Note: This library is pretty much a work in progress. However, it is well tested and already used in production
as well as in App Store submitted apps.

## Usage
The easiest way to include OpinionatedC into your project is through [CocoaPods](http://cocoapods.org/):
```
pod 'OpinionatedC'
```
Import the umbrella header everywhere you want to taste the sweetness of OpinionatedC:
```objectivec
#import <OpinionatedC/OpinionatedC.h>
```
#### A Note About Method Prefixes
There is no doubt that the best practice for extension methods in categories is to include a vendor prefix 
in the selector. Currently, OpinionatedC does not conform to that best practice, since having to write (and read)
stuff like `oc_each:` instead of a plain `each:` does not really seem to contribute to readability.

However, I'm currently looking for a method to allow optional, configurable method prefixes for users that
want (or need) them. Feel free to add to the discussion in [#1](https://github.com/leoschweizer/OpinionatedC/issues/1) if you have any ideas about this topic.

## Features
* [**Collections**](https://github.com/leoschweizer/OpinionatedC#collections) (`NSArray`, `NSDictionary`, `NSSet`, `NSString`, ...)
  * [Aggregating](https://github.com/leoschweizer/OpinionatedC#aggregating)
    * [`average`](https://github.com/leoschweizer/OpinionatedC#aggregating) / [`average:`](https://github.com/leoschweizer/OpinionatedC#aggregating)
    * [`count:`](https://github.com/leoschweizer/OpinionatedC#aggregating)
    * [`groupedBy:`](https://github.com/leoschweizer/OpinionatedC#aggregating)
	* [`max`](https://github.com/leoschweizer/OpinionatedC#aggregating) / [`max:`](https://github.com/leoschweizer/OpinionatedC#aggregating)
	* [`min`](https://github.com/leoschweizer/OpinionatedC#aggregating) / [`min:`](https://github.com/leoschweizer/OpinionatedC#aggregating)
	* [`sum`](https://github.com/leoschweizer/OpinionatedC#aggregating) / [`sum:`](https://github.com/leoschweizer/OpinionatedC#aggregating)
  * [Enumerating](https://github.com/leoschweizer/OpinionatedC#enumerating)
    * [`each:`](https://github.com/leoschweizer/OpinionatedC#enumerating) / [`eachWithIndex:`](https://github.com/leoschweizer/OpinionatedC#enumerating)
    * [`each:separatedBy:`](https://github.com/leoschweizer/OpinionatedC#enumerating) / [`eachWithIndex:separatedBy:`](https://github.com/leoschweizer/OpinionatedC#enumerating)
    * [`isEmpty`](https://github.com/leoschweizer/OpinionatedC#enumerating) / [`isNotEmpty`](https://github.com/leoschweizer/OpinionatedC#enumerating)
  * [Mapping](https://github.com/leoschweizer/OpinionatedC#mapping)
    * [`collect:`](https://github.com/leoschweizer/OpinionatedC#mapping) / [`map:`](https://github.com/leoschweizer/OpinionatedC#mapping)
    * [`inject:into:`](https://github.com/leoschweizer/OpinionatedC#mapping) / [`reduce:`](https://github.com/leoschweizer/OpinionatedC#mapping)
  * [Subsetting](https://github.com/leoschweizer/OpinionatedC#subsetting)
    * [`allSatisfy:`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`anySatisfy:`](https://github.com/leoschweizer/OpinionatedC#subsetting) 
	* [`first`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`first:`](https://github.com/leoschweizer/OpinionatedC#subsetting)
    * [`detect:`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`reject:`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`select:`](https://github.com/leoschweizer/OpinionatedC#subsetting)
	* [`dropWhile:`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`takeWhile:`](https://github.com/leoschweizer/OpinionatedC#subsetting)
* [**Error Handling**](https://github.com/leoschweizer/OpinionatedC#error-handling)
  * [`SubclassResponsibility`](https://github.com/leoschweizer/OpinionatedC#error-handling)
  * [`UnsupportedOperation`](https://github.com/leoschweizer/OpinionatedC#error-handling) / [`ShouldNotOccur`](https://github.com/leoschweizer/OpinionatedC#error-handling)
  * [`NotYetImplemented`](https://github.com/leoschweizer/OpinionatedC#error-handling)
  * [`Error()`](https://github.com/leoschweizer/OpinionatedC#error-handling)
* [**NSDictionary Extensions**](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions)
  * [`add:`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions) ¹
  * [`associationEnumerator`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions)
  * [`at:`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions) / [`at:ifAbsent:`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions) / [`at:ifPresent:`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions)
  * [`at:put:`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions) ¹ / [`at:ifAbsentPut:`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions) ¹
  * [`includesKey:`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions) / [`includesValue:`](https://github.com/leoschweizer/OpinionatedC#nsdictionary-extensions)
* [**NSNumber Extensions**](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions)
  * [`atRandom`](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions)
  * [`timesRepeat:`](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions) / [`timesRepeatWithIndex:`](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions)
  * [`to:`](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions) / [`to:by:`](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions)
* [**NSObject Extensions**](https://github.com/leoschweizer/OpinionatedC#nsobject-extensions)
  * [`asAssociationWithValue:`](https://github.com/leoschweizer/OpinionatedC#nsobject-extensions) / [`asAssociationWithKey:`](https://github.com/leoschweizer/OpinionatedC#nsobject-extensions)
  * [`isNull`](https://github.com/leoschweizer/OpinionatedC#nsobject-extensions) / [`isNotNull`](https://github.com/leoschweizer/OpinionatedC#nsobject-extensions)

¹ Extension is only available on mutable instances

#### Collections
Most of the collection extensions are implemented on the `NSObject` level, with refined behavior for different 
collection types. Non-collection objects thereby behave like collections with a single element, and `[NSNull null]`
behaves like an empty collection.

OpinionatedC tries it's best to preserve the types you are operating on. Calling `select:` on an (immutable) `NSArray`
will yield an instance of `NSArray`. Likewise, doing the same on an `NSMutableArray` instance will yield a mutable
array. However, this behavior is limited by the type system of Objective-C (for instance, this does not work
at all with `NSString`s).

##### Aggregating
```objectivec

[@[@2, @4] average]
// => @3

[@[@"hello", @"world!"] average:^NSNumber*(id each) { 
    return @([each length]);
}]
// => @5.5

[@[@"a", @5, @YES, @"b"] count:^BOOL(id each) {
    return [each isKindOfClass:NSString.class];
}];
// => 2

NSSet *set = [NSSet setWithObjects:@"foo", @"bar", @"hello", @"world!", nil];
[set groupedBy:^id(id each) {
    return @([each length]);
}];
// => @{
//        @3 : a NSSet(@"foo", @"bar"),
//        @5 : a NSSet(@"hello"),
//        @6 : a NSSet(@"world!")
//    }

[[@1, @2, @3] max]
// => @3

[@[@"hello", @"world!"] max:^NSNumber*(id each) { 
    return @([each length]);
}]
// => @"world!"

[@[@1, @2, @3] min]
// => @1

[@[@"hello", @"world!"] min:^NSNumber*(id each) { 
    return @([each length]);
}]
// => @"hello"

[@[@1, @2, @3] sum]
// => @6

[@[@"hello", @"world!"] sum:^NSNumber*(id each) { 
    return @([each length]);
}]
// => @11


```

##### Enumerating
```objectivec

[@[@"foo", @"bar"] each:^(NSString *each) {
    NSLog(@"%@", each);
}];
// => foo
// => bar

[@[@"foo", @"bar"] 
    each:^(NSString *each) {
        NSLog(@"%@", each);
    }
    separatedBy:^{
        NSLog(@"w00t");
    }];
// => foo
// => w00t
// => bar

[@"abc" eachWithIndex:^(NSString *each, NSUInteger idx) {
    NSLog(@"%@ - %@", each, @(idx));
}];
// => a - 0
// => b - 1
// => c - 2

[@[@"a", @"b", @"c"] isEmpty];
// => NO

[@"" isEmpty];
// => YES

```

##### Mapping
```objectivec
[@[@1, @2, @3] map:^id(NSNumber *each) {
    return @([each integerValue] * 2);
}];
// => @[@2, @4, @6]

[@"hello world" map:^id(NSString *each) { 
    return [each capitalizedString];
}];
// => @"HELLO WORLD"

[@{ @1 : @YES } map:^id(OCAssociation *each) { 
    return [each.key asAssociationWithValue:@NO];
}];
// => @{ @1 : @NO }

[@[@1, @2, @3] inject:@0 into:^id(NSNumber *running, NSNumber *each) {
    return @([running integerValue] + [each integerValue]);
}];
// => @6
```

##### Subsetting
```objectivec
[@[@1, @2, @3, @4] allSatisfy:^BOOL(NSNumber *each) {
    return [each integerValue] % 2 == 0;
}];
// => NO

[@"abcdef" anySatisfy:^BOOL(NSString *each) { 
    return [each isEqualToString:@"f"];
}];
// => YES

[@"abcdef" first:3]
// => @"abc"

[@{ @1 : @"foo", @2 : @"bar"} detect:^BOOL(OCAssociation *each) {
    return [each.key isEqualToNumber:@2];
}];
// => an OCAssociation(@2, @"bar")

[@{ @1 : @"foo", @2 : @"bar"} select:^BOOL(OCAssociation *each) {
    return [each.key isEqualToNumber:@2];
}];
// => @{ @2 : @"bar" }

[@{ @1 : @"foo", @2 : @"bar"} reject:^BOOL(OCAssociation *each) {
    return [each.key isEqualToNumber:@2];
}];
// => @{ @1 : @"foo" }

[@[@2, @4, @6, @8, @10, @11, @12] dropWhile:^BOOL(id each) {
    return [each integerValue] % 2 == 0;
}];
// => @[@11, @12]

[@[@1, @2, @3, @4, @5] takeWhile:^BOOL(id each) {
    return [each integerValue] <= 3;
}];
// => @[@1, @2, @3]

```

#### Error Handling
```objectivec
@implementation MyAbstractClass

- (NSString *)abstractMethod {
    SubclassResponsibility;
}

- (BOOL)methodThatShouldBeImplemented {
    NotYetImplemented;
}

- (void)unsupportedMethodFromSuperclass {
    UnsupportedOperation;
}

- (NSNumber *)methodWithArg:(NSUInteger)arg {
    
    switch (arg) {
        case 1: return @1;
        case 2: return @2;
    }
    
    ShouldNotOccur;
    
}

- (NSUInteger)method2WithArg:(NSUInteger)arg {
    if (arg < 10) {
        return 10;
    }
    if (arg < 20) {
        return 20;
    }
    Error(@"arg must be smaller than 20");
}

@end
```


#### NSDictionary Extensions
```objectivec
NSMutableDictionary *dict = [NSMutableDictionary dictionary];

[dict add:[@1 asAssociationWithValue:@"foo"]];
// => @{ @1 : @"foo" }

[dict at:@1 put:@"foo"];
// => @{ @1 : @"foo" }

[dict at:@2 ifAbsent:^id{
    return @"bar";
}];
// => @"bar"

[dict at:@1 ifPresent:^id(id element) {
    return @"bar";
}];
// => @"bar"

[dict at:@2 ifAbsentPut:^id{
    return @"hello world";
}];
// => @"hello world"

[dict includesKey:@2];
// => YES

[dict includesValue:@"bar"];
// => NO

for (OCAssociation *each in [dict associationEnumerator]) {
    NSLog(@"%@", each.value);
}
// => foo

```


#### NSNumber Extensions
```objectivec
[@100 atRandom];
// => 77

[@3 timesRepeat:^{ 
   NSLog(@"hooray!"); 
}];
// => hooray
// => hooray
// => hooray

__block NSMutableArray *array = [NSMutableArray array];
[@10 timesRepeatWithIndex:^(NSUInteger idx) {
    [array addObject:@(idx)];
}];
// => @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10]

[[@5 to:@7] map:^id(NSNumber *each) {
    return @([each integerValue] * 2);
}];
// => @[@10, @12, @14]

[[@1 to:@10] select:^id(NSNumber *each) {
    return [each integerValue] % 2 == 0;
}];
// => @[@2, @4, @6, @8, @10]
```


#### NSObject Extensions
```objectivec
[@"hello world" asAssociationWithKey:@1]
// => an OCAssociation(key:@1, value:@"hello world")

[@5 isNull]
// => NO

[[NSNull null] isNotNull]
// => NO
```
