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

@end
