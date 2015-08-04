#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <OpinionatedC/OpinionatedC.h>


@interface DictionaryExtensionTests : XCTestCase

@end


@implementation DictionaryExtensionTests

- (void)testAssociationEnumeration {
	
	NSMutableDictionary *sut = [NSMutableDictionary dictionary];
	for (NSUInteger i = 0; i < 10000; i++) {
		[sut setObject:@"foo bar" forKey:@(i)];
	}
	NSMutableDictionary *probes = [NSMutableDictionary dictionary];
	
	for (OCAssociation *each in [sut associationEnumerator]) {
		XCTAssertTrue([each isKindOfClass:OCAssociation.class]);
		[probes setObject:each.value forKey:each.key];
	}
	XCTAssertEqualObjects(sut, probes);
	
}

@end
