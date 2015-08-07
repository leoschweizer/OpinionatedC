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

@end
