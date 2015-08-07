#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface NumberExtensionTests : XCTestCase

@end


@implementation NumberExtensionTests

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
