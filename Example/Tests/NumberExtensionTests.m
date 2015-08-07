#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface NumberExtensionTests : XCTestCase

@end


@implementation NumberExtensionTests

- (void)testAtRandom {
	[@1000 timesRepeat:^{
		NSNumber *result = [@10 atRandom];
		XCTAssertTrue([result integerValue] >= 0);
		XCTAssertTrue([result integerValue] < 10);
	}];
}

- (void)testNegativeAtRandom {
	[@1000 timesRepeat:^{
		NSNumber *result = [@-10 atRandom];
		XCTAssertTrue([result integerValue] > -10);
		XCTAssertTrue([result integerValue] <= 0);
	}];
}

- (void)test0AtRandom {
	[@1000 timesRepeat:^{
		NSNumber *result = [@0 atRandom];
		XCTAssertEqualObjects(result, @0);
	}];
}

- (void)testRepeat {
	__block NSMutableArray *probeArray = [NSMutableArray array];
	[@10 timesRepeat:^{
		[probeArray addObject:@1];
	}];
	XCTAssertEqual(probeArray.count, 10);
}

- (void)testRepeat0 {
	[@0 timesRepeat:^{
		XCTFail();
	}];
}

- (void)testRepeatWithIndex {
	__block NSMutableArray *probeArray = [NSMutableArray array];
	[@10 timesRepeatWithIndex:^(NSUInteger idx) {
		[probeArray addObject:@(idx)];
	}];
	XCTAssertEqual(probeArray.count, 10);
	XCTAssertEqualObjects([probeArray first], @1);
	XCTAssertEqualObjects([probeArray lastObject], @10);
}

- (void)testTo {
	OCInterval *interval = [@1 to:@10];
	XCTAssertEqual(interval.from, 1);
	XCTAssertEqual(interval.to, 10);
	XCTAssertEqual(interval.by, 1);
}

- (void)testToHigherOrder {
	NSArray *result = [[@5 to: @7] map:^id(NSNumber *each) {
		return @([each integerValue] * 2);
	}];
	XCTAssertTrue([result isKindOfClass:NSArray.class]);
	XCTAssertEqual(result.count, 3);
	XCTAssertEqualObjects([result first], @10);
	XCTAssertEqualObjects([result lastObject], @14);
}

- (void)testToBy {
	OCInterval *interval = [@1 to:@-10 by:@-5];
	XCTAssertEqual(interval.from, 1);
	XCTAssertEqual(interval.to, -10);
	XCTAssertEqual(interval.by, -5);
}

@end
