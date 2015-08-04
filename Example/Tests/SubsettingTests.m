#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface SubsettingTests : XCTestCase

@end


@implementation SubsettingTests

- (void)testFirstOnObject {
	XCTAssertEqualObjects([self first], self);
}

- (void)testFirstNOnObject {
	XCTAssertEqualObjects([self first:0], @[]);
	XCTAssertEqualObjects([self first:1], @[self]);
	XCTAssertEqualObjects([self first:2], @[self]);
}

- (void)testFirstOnArray {
	XCTAssertEqualObjects(([@[@1, @2, @3] first]), @1);
	XCTAssertNil([@[] first]);
}

- (void)testFirstNOnArray {
	XCTAssertEqualObjects(([@[@1, @2] first:0]), @[]);
	XCTAssertEqualObjects(([@[@1, @2] first:1]), @[@1]);
	XCTAssertEqualObjects(([@[@1, @2] first:4]), (@[@1, @2]));
}

- (void)testFirstOnString {
	XCTAssertEqualObjects([@"abc" first], @"a");
	XCTAssertEqualObjects([@"" first], @"");
}

- (void)testFirstNOnString {
	XCTAssertEqualObjects([@"abc" first:2], @"ab");
	XCTAssertEqualObjects([@"abc" first:4], @"abc");
	XCTAssertEqualObjects([@"" first:1], @"");
}

- (void)testSelectOnObject {
	id result = [@YES select:^BOOL(id each) {
		return [each boolValue];
	}];
	XCTAssertEqualObjects(result, @YES);
	result = [@NO select:^BOOL(id each) {
		return [each boolValue];
	}];
	XCTAssertNil(result);
}

- (void)testSelectOnArray {
	NSArray *result = [@[@1, @2, @3, @4] select:^BOOL(id each) {
		return [each unsignedIntegerValue] % 2 == 0;
	}];
	XCTAssertTrue([result isKindOfClass:NSArray.class]);
	XCTAssertEqual(result.count, 2);
	XCTAssertTrue([result containsObject:@2]);
	XCTAssertTrue([result containsObject:@4]);
}

- (void)testSelectOnEmptyArray {
	NSArray *result = [@[] select:^BOOL(id each) {
		return YES;
	}];
	XCTAssertTrue([result isKindOfClass:NSArray.class]);
	XCTAssertEqual(result.count, 0);
}

- (void)testSelectOnMutableArray {
	id result = [[NSMutableArray array] select:^BOOL(id each) {
		return YES;
	}];
	XCTAssertTrue([result isKindOfClass:NSMutableArray.class]);
}

- (void)testSelectOnDictionary {
	NSDictionary *sut = @{
		@1 : @"1",
		@2 : @"2",
		@3 : @"3",
		@4 : @"4"
	};
	NSDictionary *result = [sut select:^BOOL(OCAssociation *each) {
		XCTAssertTrue([each isKindOfClass:OCAssociation.class]);
		return [each.key unsignedIntegerValue] % 2 == 1;
	}];
	XCTAssertTrue([result isKindOfClass:NSDictionary.class]);
	XCTAssertEqual(result.count, 2);
	XCTAssertEqualObjects([result objectForKey:@1], @"1");
	XCTAssertEqualObjects([result objectForKey:@3], @"3");
}

- (void)testSelectOnEmptyDictionary {
	NSDictionary *result = [@{} select:^BOOL(id each) {
		return YES;
	}];
	XCTAssertEqual(result.count, 0);
}

- (void)testSelectOnMutableDictionary {
	id result = [[NSMutableDictionary dictionary] select:^BOOL(id each) {
		return YES;
	}];
	XCTAssertTrue([result isKindOfClass:NSMutableDictionary.class]);
}

- (void)testSelectOnSet {
	NSSet *sut = [NSSet setWithObjects:@1, @2, @3, @4, nil];
	NSSet *result = [sut select:^BOOL(id each) {
		return [each unsignedIntegerValue] == 3;
	}];
	XCTAssertTrue([result isKindOfClass:sut.class]);
	XCTAssertEqual(result.count, 1);
	XCTAssertTrue([result containsObject:@3]);
}

- (void)testSelectOnEmptySet {
	NSSet *result = [[NSSet set] select:^BOOL(id each) {
		return YES;
	}];
	XCTAssertEqual(result.count, 0);
}

- (void)testSelectOnMutableSet {
	id result = [[NSMutableSet set] select:^BOOL(id each) {
		return NO;
	}];
	XCTAssertTrue([result isKindOfClass:NSMutableSet.class]);
}

@end