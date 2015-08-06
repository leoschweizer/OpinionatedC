#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface ObjectExtensionTests : XCTestCase

@end


@implementation ObjectExtensionTests

- (void)testIsNull {
	XCTAssertFalse([@5 isNull]);
	XCTAssertTrue([[NSNull null] isNull]);
}

- (void)testIsNotNull {
	XCTAssertTrue([@5 isNotNull]);
	XCTAssertFalse([[NSNull null] isNotNull]);
}

@end
