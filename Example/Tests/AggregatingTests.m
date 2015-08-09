#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface AggregatingTests : XCTestCase

@end


@implementation AggregatingTests

- (void)testAverageOnObject {
	XCTAssertEqualObjects([@5 average], @5);
}

- (void)testAverageOnArray {
	NSNumber *result = [@[@"helo", @"world", @"foo"] average:^NSNumber *(id each) {
		return @([each length]);
	}];
	XCTAssertEqualObjects(result, @4);
}

- (void)testAverageOnEmptyArray {
	XCTAssertNil([@[] average]);
}

- (void)testCountOnArray {
	NSUInteger count = [@[@"a", @5, @YES, @"b"] count:^BOOL(id each) {
		return [each isKindOfClass:NSString.class];
	}];
	XCTAssertEqual(count, 2);
}

- (void)testCountOnEmptyString {
	NSUInteger count = [@"" count:^BOOL(id each) {
		return YES;
	}];
	XCTAssertEqual(count, 0);
}

- (void)testMaxOnObject {
	id result = [@YES max:^NSNumber *(id each) {
		return @0;
	}];
	XCTAssertEqualObjects(result, @YES);
}

- (void)testMaxOnArray {
	XCTAssertEqualObjects(([@[@1, @5] max]), @5);
}

- (void)testMaxBlockOnArray {
	id result = [@[@"hello", @"world!"] max:^NSNumber *(id each) {
		return @([each length]);
	}];
	XCTAssertEqualObjects(result, @"world!");
}

- (void)testMaxOnEmptyArray {
	XCTAssertNil([@[] max]);
	XCTAssertNil([@[] max:^NSNumber *(id each) { return @5; }]);
}

- (void)testMinOnObject {
	id result = [@5 min:^NSNumber *(id each) {
		return @0;
	}];
	XCTAssertEqualObjects(result, @5);
}

- (void)testMinOnArray {
	XCTAssertEqualObjects(([@[@1, @5] min]), @1);
}

- (void)testMinBlockOnArray {
	id result = [@[@"hello", @"world!", @""] min:^NSNumber *(id each) {
		return @([each length]);
	}];
	XCTAssertEqualObjects(result, @"");
}

- (void)testMinOnEmptyArray {
	XCTAssertNil([@[] min]);
	XCTAssertNil([@[] min:^NSNumber *(id each) { return @0; }]);
}

- (void)testSumOnObject {
	XCTAssertEqualObjects([@12 sum], @12);
}

- (void)testSumOnArray {
	NSNumber *result = [@[@"the", @"quick", @"brown", @"fox"] sum:^NSNumber *(id each) {
		return @([each length]);
	}];
	XCTAssertEqualObjects(result, @16);
}

- (void)testSumOnEmptyArray {
	XCTAssertEqualObjects([@[] sum], @0);
}

@end
