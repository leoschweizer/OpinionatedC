#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface EachTest : XCTestCase

@end


@implementation EachTest

- (void)testEachOnObject {
	__block NSMutableArray *probeArray = [NSMutableArray array];
	XCTAssertTrue(probeArray.count == 0);
	[@12 each:^(id each) {
		[probeArray addObject:each];
	}];
	XCTAssertTrue(probeArray.count == 1);
	XCTAssertEqualObjects([probeArray firstObject], @12);
}

- (void)testEachOnArray {
	__block NSMutableArray *probeArray = [NSMutableArray array];
	XCTAssertTrue(probeArray.count == 0);
	[@[@0, @1, @2] each:^(id each) {
		[probeArray addObject:each];
	}];
	XCTAssertTrue(probeArray.count == 3);
	XCTAssertEqualObjects([probeArray firstObject], @0);
	XCTAssertEqualObjects([probeArray lastObject], @2);
}

- (void)testEachOnEmptyArray {
	__block NSMutableArray *probeArray = [NSMutableArray array];
	XCTAssertTrue(probeArray.count == 0);
	[@[] each:^(id each) {
		[probeArray addObject:each];
	}];
	XCTAssertTrue(probeArray.count == 0);
}

- (void)testEachOnDictionary {
	__block NSMutableArray *keyProbes = [NSMutableArray array];
	__block NSMutableArray *valueProbes = [NSMutableArray array];
	XCTAssertTrue(keyProbes.count == 0);
	XCTAssertTrue(valueProbes.count == 0);
	NSDictionary *sut = @{
		@0: @YES,
		@1: @NO
	};
	[sut each:^(OCAssociation *each) {
		XCTAssertEqual(each.class, OCAssociation.class);
		[keyProbes addObject:each.key];
		[valueProbes addObject:each.value];
	}];
	XCTAssertTrue(keyProbes.count == 2);
	XCTAssertEqual(keyProbes.count, valueProbes.count);
	XCTAssertTrue([keyProbes containsObject:@0]);
	XCTAssertTrue([keyProbes containsObject:@1]);
	XCTAssertTrue([valueProbes containsObject:@YES]);
	XCTAssertTrue([valueProbes containsObject:@NO]);
}

- (void)testEachOnEmptyDictionary {
	__block NSMutableArray *probeArray = [NSMutableArray array];
	XCTAssertTrue(probeArray.count == 0);
	[@{} each:^(id each) {
		[probeArray addObject:each];
	}];
	XCTAssertTrue(probeArray.count == 0);
}

@end
