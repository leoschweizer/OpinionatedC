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

- (void)testGroupedByOnObject {
	NSDictionary *result = [@42 groupedBy:^id(id each) {
		return @"bar";
	}];
	XCTAssertEqualObjects([result objectForKey:@"bar"], @42);
}

- (void)testGroupedByOnArray {
	NSDictionary *result = [@[@1, @2, @3, @4] groupedBy:^id(id each) {
		return @([each integerValue] % 2);
	}];
	XCTAssertNotNil([result objectForKey:@0]);
	XCTAssertNotNil([result objectForKey:@1]);
	XCTAssertEqualObjects([result objectForKey:@0], (@[@2, @4]));
	XCTAssertEqualObjects([result objectForKey:@1], (@[@1, @3]));
}

- (void)testGroupedByOnDictionary {
	NSDictionary *result = [@{ @1 : @"foo", @2 : @"bar"} groupedBy:^id(OCAssociation *each) {
		return @([each.value length]);
	}];
 	XCTAssertEqual(result.count, 1);
	XCTAssertNotNil([result objectForKey:@3]);
	id group = [result objectForKey:@3];
	XCTAssertTrue([group isKindOfClass:NSDictionary.class]);
	XCTAssertEqual([group count], 2);
	XCTAssertEqualObjects([group objectForKey:@1], @"foo");
	XCTAssertEqualObjects([group objectForKey:@2], @"bar");
}

- (void)testGroupedByOnSet {
	NSSet *sut = [NSSet setWithObjects:@"foo", @"bar", @"hello", @"world!", nil];
	NSDictionary *grouped = [sut groupedBy:^id(id each) {
		return @([each length]);
	}];
	XCTAssertEqual(grouped.count, 3);
	XCTAssertNotNil([grouped objectForKey:@3]);
	XCTAssertNotNil([grouped objectForKey:@5]);
	XCTAssertNotNil([grouped objectForKey:@6]);
	XCTAssertTrue([[grouped objectForKey:@3] isKindOfClass:NSSet.class]);
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
