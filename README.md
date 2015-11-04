# OpinionatedC
[![Build Status](https://travis-ci.org/leoschweizer/OpinionatedC.svg?branch=master)](https://travis-ci.org/leoschweizer/OpinionatedC)
[![Coverage Status](https://coveralls.io/repos/leoschweizer/OpinionatedC/badge.svg?branch=master&service=github)](https://coveralls.io/github/leoschweizer/OpinionatedC?branch=master)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/OpinionatedC.svg)](https://cocoapods.org/pods/OpinionatedC)
![License](https://img.shields.io/cocoapods/l/OpinionatedC.svg)
![Platforms](https://img.shields.io/cocoapods/p/OpinionatedC.svg)

Sometimes, Objective-C is just overly verbose. Life is too short to `enumerateObjectsUsingBlock` and who has the time to create sub-arrays with `filteredArrayUsingPredicate` anyway?

OpinionatedC is here to fix that. It offers a ton of **Smalltalk-style** convenience extension methods that make writing **concise, easily readable** Objective-C code a pleasure.

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
#### The **[complete list of features](http://opinionatedc.xyz)** is available on the [official OpinionatedC website](http://opinionatedc.xyz). 

Here is a small potpourri of what is possible with OpinionatedC:

```objectivec
[@[@"hello", @"world!"] average:^NSNumber*(id each) { 
    return @([each length]);
}]
// => @5.5

NSSet *set = [NSSet setWithObjects:@"foo", @"bar", @"hello", @"world!", nil];
[set groupedBy:^id(id each) {
    return @([each length]);
}]
// => @{
//        @3 : a NSSet(@"foo", @"bar"),
//        @5 : a NSSet(@"hello"),
//        @6 : a NSSet(@"world!")
//    }

[@[@"foo", @"bar"] each:^(NSString *each) {
    NSLog(@"%@", each);
}]
// => foo
// => bar

[@"abc" eachWithIndex:^(NSString *each, NSUInteger idx) {
    NSLog(@"%@ - %@", each, @(idx));
}]
// => a - 0
// => b - 1
// => c - 2

[@[@"a", @"b", @"c"] isEmpty]
// => NO

[@[@1, @2, @3] map:^id(NSNumber *each) {
    return @([each integerValue] * 2);
}]
// => @[@2, @4, @6]

[@[@1, @2, @3] inject:@0 into:^id(NSNumber *running, NSNumber *each) {
    return @([running integerValue] + [each integerValue]);
}]
// => @6

[@[@1, @2, @3, @4] allSatisfy:^BOOL(NSNumber *each) {
    return [each integerValue] % 2 == 0;
}]
// => NO

[@"abcdef" first:3]
// => @"abc"

[@{ @1 : @"foo", @2 : @"bar"} detect:^BOOL(OCAssociation *each) {
    return [each.key isEqualToNumber:@2];
}]
// => an OCAssociation(@2, @"bar")

[@{ @1 : @"foo", @2 : @"bar"} select:^BOOL(OCAssociation *each) {
    return [each.key isEqualToNumber:@2];
}]
// => @{ @2 : @"bar" }

[@{ @1 : @"foo", @2 : @"bar"} reject:^BOOL(OCAssociation *each) {
    return [each.key isEqualToNumber:@2];
}]
// => @{ @1 : @"foo" }

[@100 atRandom]
// => 77

[@3 timesRepeat:^{ 
   NSLog(@"hooray!"); 
}]
// => hooray
// => hooray
// => hooray

[[@1 to:@10] select:^id(NSNumber *each) {
    return [each integerValue] % 2 == 0;
}]
// => @[@2, @4, @6, @8, @10]
```

## Contributing
If you have any questions, remarks, ideas or suggestions for improvement, don't hesitate to [open an issue](https://github.com/leoschweizer/OpinionatedC/issues). If you are about to create a pull request, there are only a few things to consider:
* open an issue first if you are not sure if your idea will be appreciated
* indent with tabs, not spaces
* write unit tests, aim for 100% coverage

## Contributors
* [Leo Schweizer](https://github.com/leoschweizer)

## License
```
The MIT License (MIT)

Copyright (c) 2015 Leo Schweizer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/leoschweizer/opinionatedc/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

