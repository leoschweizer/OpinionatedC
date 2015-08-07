#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface PrefixedInclusionTests : XCTestCase

@end


@implementation PrefixedInclusionTests

- (void)testSelectors {
	XCTAssertTrue([NSObject instancesRespondToSelector:@selector(oc_asAssociationWithKey:)]);
	XCTAssertTrue([@5 oc_asAssociationWithValue:@5]);
}

@end
