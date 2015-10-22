#import <XCTest/XCTest.h>
#import "OCInterval.h"
#import "NSObject+OpinionatedSubsetting.h"
#import "NSObject+OpinionatedEnumerating.h"


@interface IntervalTests : XCTestCase

@end


@implementation IntervalTests

- (void)testIntervalEnumeration1 {
	OCInterval *interval = [[OCInterval alloc] initWithFrom:0 to:10 by:1];
	NSMutableArray *probeArray = [NSMutableArray array];
	for (NSNumber *each in [interval intervalEnumerator]) {
		[probeArray addObject:each];
	}
	XCTAssertEqual(probeArray.count, 11);
	XCTAssertEqualObjects([probeArray first], @0);
	XCTAssertEqualObjects([probeArray lastObject], @10);
}

- (void)testIntervalEnumeration2 {
	OCInterval *interval = [[OCInterval alloc] initWithFrom:3 to:27 by:7];
	NSMutableArray *probeArray = [NSMutableArray array];
	for (NSNumber *each in [interval intervalEnumerator]) {
		[probeArray addObject:each];
	}
	XCTAssertEqual(probeArray.count, 4);
	XCTAssertEqualObjects([probeArray first], @3);
	XCTAssertEqualObjects([probeArray lastObject], @24);
}

- (void)testIntervalEnumeration3 {
	OCInterval *interval = [[OCInterval alloc] initWithFrom:10 to:0 by:1];
	NSMutableArray *probeArray = [NSMutableArray array];
	for (NSNumber *each in [interval intervalEnumerator]) {
		[probeArray addObject:each];
	}
	XCTAssertEqual(probeArray.count, 0);
}

- (void)testIntervalEnumeration4 {
	OCInterval *interval = [[OCInterval alloc] initWithFrom:1 to:10 by:-1];
	NSMutableArray *probeArray = [NSMutableArray array];
	for (NSNumber *each in [interval intervalEnumerator]) {
		[probeArray addObject:each];
	}
	XCTAssertEqual(probeArray.count, 0);
}

- (void)testIntervalEnumeration5 {
	OCInterval *interval = [[OCInterval alloc] initWithFrom:3 to:-27 by:-7];
	NSMutableArray *probeArray = [NSMutableArray array];
	for (NSNumber *each in [interval intervalEnumerator]) {
		[probeArray addObject:each];
	}
	XCTAssertEqual(probeArray.count, 5);
	XCTAssertEqualObjects([probeArray first], @3);
	XCTAssertEqualObjects([probeArray lastObject], @-25);
}

- (void)testIntervalIsEmpty {
	XCTAssertTrue([[[OCInterval alloc] initWithFrom:0 to:0 by:0] isEmpty]);
	XCTAssertTrue([[[OCInterval alloc] initWithFrom:0 to:0 by:1] isNotEmpty]);
	XCTAssertTrue([[[OCInterval alloc] initWithFrom:0 to:10 by:-1] isEmpty]);
	XCTAssertTrue([[[OCInterval alloc] initWithFrom:0 to:5 by:1] isNotEmpty]);
	XCTAssertTrue([[[OCInterval alloc] initWithFrom:0 to:5 by:6] isNotEmpty]);
	XCTAssertTrue([[[OCInterval alloc] initWithFrom:5 to:-5 by:1] isEmpty]);
	XCTAssertTrue([[[OCInterval alloc] initWithFrom:5 to:-5 by:-3] isNotEmpty]);
}

@end
