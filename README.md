# OpinionatedC
[![Build Status](https://travis-ci.org/leoschweizer/OpinionatedC.svg)](https://travis-ci.org/leoschweizer/OpinionatedC)
[![Coverage Status](https://coveralls.io/repos/leoschweizer/OpinionatedC/badge.svg?branch=master&service=github)](https://coveralls.io/github/leoschweizer/OpinionatedC?branch=master)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/OpinionatedC.svg)](https://cocoapods.org/pods/OpinionatedC)
[![License](https://img.shields.io/cocoapods/l/OpinionatedC.svg)](https://cocoapods.org/pods/OpinionatedC)
[![Platforms](https://img.shields.io/cocoapods/p/OpinionatedC.svg)](https://cocoapods.org/pods/OpinionatedC)



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
Most of the collection extensions are implemented on the `NSObject` level, with refined behavior for different 
collection types. Non-collection objects thereby behave like collections with a single element, and `[NSNull null]`
bahaves like an empty collection.

OpinionatedC tries it's best to preserve the types you are operating on. Calling `select:` on an (immutable) `NSArray`
will yield an instance of `NSArray`. Likewise, doing the same on an `NSMutableArray` instance will yield a mutable
array. However, this behavior is limited by the type system of Objective-C (for instance, this does not work
at all with `NSString`s).

* **Enumeration**
* **Mapping**
  * [`map:`](https://github.com/leoschweizer/OpinionatedC#Mapping)
  * [`inject:into:`](https://github.com/leoschweizer/OpinionatedC#Mapping) / [`reduce`](https://github.com/leoschweizer/OpinionatedC#Mapping)
* **Subsetting**
  * [`allSatisfy:`](https://github.com/leoschweizer/OpinionatedC#Subsetting) / [`anySatisfy:`](https://github.com/leoschweizer/OpinionatedC#Subsetting) 
  * [`first`](https://github.com/leoschweizer/OpinionatedC#Subsetting) / [`first:`](https://github.com/leoschweizer/OpinionatedC#Subsetting)
  * [`detect:`](https://github.com/leoschweizer/OpinionatedC#Subsetting) / [`reject:`](https://github.com/leoschweizer/OpinionatedC#Subsetting) / [`select:`](https://github.com/leoschweizer/OpinionatedC#Subsetting)


### Enumeration


### Mapping
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

### Subsetting
```objectivec
[@[@1, @2, @3, @4] allSatisfy:^BOOL(NSNumber *each) {
    return [each integerValue] % 2 == 0;
}];
// => false

[@"abcdef" anySatisfy:^BOOL(NSString *each) { 
    return [each isEqualToString:@"f"];
}];
// => true

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
