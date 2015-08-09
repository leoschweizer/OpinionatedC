#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface MappingTests : XCTestCase

@end


@implementation MappingTests

- (void)testMapOnObject {
	id result = [@NO map:^id(id each) {
		return @YES;
	}];
	XCTAssertEqualObjects(result, @YES);
}

- (void)testMapOnArray {
	NSArray *result = [@[@1, @2] map:^id(id each) {
		return @([each unsignedIntegerValue] * 2);
	}];
	XCTAssertTrue([result isKindOfClass:NSArray.class]);
	XCTAssertEqual(result.count, 2);
	XCTAssertTrue([result containsObject:@2]);
	XCTAssertTrue([result containsObject:@4]);
}

- (void)testMapOnMutableArray {
	id result = [[NSMutableArray array] map:^id(id each) {
		return @0;
	}];
	XCTAssertTrue([result isKindOfClass:NSMutableArray.class]);
}

- (void)testMapOnDictionary {
	NSDictionary *result = [@{ @0 : @"foo", @1 : @"bar" } map:^id(OCAssociation *each) {
		XCTAssertTrue([each isKindOfClass:OCAssociation.class]);
		return [each.value asAssociationWithKey:@([each.key unsignedIntegerValue] * 2)];
	}];
	XCTAssertTrue([result isKindOfClass:NSDictionary.class]);
	XCTAssertEqual(result.count, 2);
	XCTAssertEqualObjects([result objectForKey:@0], @"foo");
	XCTAssertEqualObjects([result objectForKey:@2], @"bar");
}

- (void)testMapOnMutableDictionary {
	id result = [[NSMutableDictionary dictionary] map:^id(id each) {
		return [@YES asAssociationWithKey:@0];
	}];
	XCTAssertTrue([result isKindOfClass:NSMutableDictionary.class]);
}

- (void)testMapOnSet {
	NSSet *result = [[NSSet setWithObjects:@1, @2, nil] map:^id(id each) {
		return @YES;
	}];
	XCTAssertTrue([result isKindOfClass:NSSet.class]);
	XCTAssertEqual(result.count, 1);
	XCTAssertTrue([result containsObject:@YES]);
}

- (void)testMapOnMutableSet {
	id result = [[NSMutableSet set] map:^id(id each) {
		return @0;
	}];
	XCTAssertTrue([result isKindOfClass:NSMutableSet.class]);
}

- (void)testMapOnString {
	NSString *result = [@"abc" map:^id(id each) {
		return [each capitalizedString];
	}];
	XCTAssertEqualObjects(result, @"ABC");
}

- (void)testInjectIntoOnArray {
	id result = [@[@1, @2, @3] inject:@0 into:^id(id running, id each) {
		return @([running integerValue] + [each integerValue]);
	}];
	XCTAssertEqualObjects(result, @6);
}

- (void)testInjectIntoOnEmptyArray {
	id result = [@[] inject:@"foo" into:^id(id running, id each) {
		return nil;
	}];
	XCTAssertEqualObjects(result, @"foo");
}

- (void)testInjectIntoOnObject {
	id result = [@3 inject:@5 into:^id(id running, id each) {
		return @([running integerValue] * [each integerValue]);
	}];
	XCTAssertEqualObjects(result, @15);
}

- (void)testReduceOnObject {
	id result = [@5 reduce:^id(id running, id each) {
		return running;
	}];
	XCTAssertNil(result);
}

- (void)testReduceOnString {
	NSString *result = [[NSString stringWithUTF8String:"abc"] reduce:^id(id running, id each) {
		return each;
	}];
	XCTAssertEqualObjects(result, @"c");
}

- (void)testCollectAlias {
	NSArray *result = [@[@1, @"foo", @YES, @[]] collect:^id(id each) {
		return @([each isEmpty]);
	}];
	XCTAssertEqual(result.count, 4);
	XCTAssertEqual([result firstObject], @NO);
	XCTAssertEqual([result lastObject], @YES);
}

@end
