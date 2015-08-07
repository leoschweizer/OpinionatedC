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
Import the umbrella header everywhere you want to use the sweetness of OpinionatedC:
```objectivec
#import <OpinionatedC/OpinionatedC.h>
```

## Features
* [**Collections**](https://github.com/leoschweizer/OpinionatedC#collections)
  * [Enumerating](https://github.com/leoschweizer/OpinionatedC#enumerating)
    * [`each:`](https://github.com/leoschweizer/OpinionatedC#enumerating) / [`eachWithIndex:`](https://github.com/leoschweizer/OpinionatedC#enumerating)
    * [`each:separatedBy:`](https://github.com/leoschweizer/OpinionatedC#enumerating) / [`eachWithIndex:separatedBy:`](https://github.com/leoschweizer/OpinionatedC#enumerating)
    * [`isEmpty`](https://github.com/leoschweizer/OpinionatedC#enumerating) / [`isNotEmpty`](https://github.com/leoschweizer/OpinionatedC#enumerating)
  * [Mapping](https://github.com/leoschweizer/OpinionatedC#mapping)
    * [`map:`](https://github.com/leoschweizer/OpinionatedC#mapping)
    * [`inject:into:`](https://github.com/leoschweizer/OpinionatedC#mapping) / [`reduce:`](https://github.com/leoschweizer/OpinionatedC#mapping)
  * [Subsetting](https://github.com/leoschweizer/OpinionatedC#subsetting)
    * [`allSatisfy:`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`anySatisfy:`](https://github.com/leoschweizer/OpinionatedC#subsetting) 
    * [`count:`](https://github.com/leoschweizer/OpinionatedC#subsetting)
	* [`first`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`first:`](https://github.com/leoschweizer/OpinionatedC#subsetting)
    * [`detect:`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`reject:`](https://github.com/leoschweizer/OpinionatedC#subsetting) / [`select:`](https://github.com/leoschweizer/OpinionatedC#subsetting)
* [**Error Handling**](https://github.com/leoschweizer/OpinionatedC#error-handling)
  * [`SubclassResponsibility`](https://github.com/leoschweizer/OpinionatedC#error-handling)
  * [`UnsupportedOperation`](https://github.com/leoschweizer/OpinionatedC#error-handling) / [`ShouldNotOccur`](https://github.com/leoschweizer/OpinionatedC#error-handling)
  * [`NotYetImplemented`](https://github.com/leoschweizer/OpinionatedC#error-handling)
  * [`Error()`](https://github.com/leoschweizer/OpinionatedC#error-handling)
* [*NSNumber Extensions**](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions)
  * [`atRandom`](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions)
  * [`timesRepeat:`](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions) / [`timesRepeatWithIndex:`](https://github.com/leoschweizer/OpinionatedC#nsnumber-extensions)

#### Collections
Most of the collection extensions are implemented on the `NSObject` level, with refined behavior for different 
collection types. Non-collection objects thereby behave like collections with a single element, and `[NSNull null]`
bahaves like an empty collection.

OpinionatedC tries it's best to preserve the types you are operating on. Calling `select:` on an (immutable) `NSArray`
will yield an instance of `NSArray`. Likewise, doing the same on an `NSMutableArray` instance will yield a mutable
array. However, this behavior is limited by the type system of Objective-C (for instance, this does not work
at all with `NSString`s).

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

[@[@"a", @5, @YES, @"b"] count:^BOOL(id each) {
    return [each isKindOfClass:NSString.class];
}];
// => 2

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
```
