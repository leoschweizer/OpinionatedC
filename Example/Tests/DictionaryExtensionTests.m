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

- (void)testAdd {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	[dict add:[@"hello world" asAssociationWithKey:@1]];
	XCTAssertEqualObjects([dict objectForKey:@1], @"hello world");
}

- (void)testAtIfAbsent {
	NSDictionary *dict = @{ @1 : @"w00t" };
	id r1 = [dict at:@1 ifAbsent:^id{
		return @42;
	}];
	XCTAssertEqualObjects(r1, @"w00t");
	id r2 = [dict at:@2 ifAbsent:^id{
		return @42;
	}];
	XCTAssertEqualObjects(r2, @42);
}

- (void)testAtIfPresent {
	NSDictionary *dict = @{ @1 : @"w00t" };
	id r1 = [dict at:@1 ifPresent:^id(id element) {
		return [NSString stringWithFormat:@"%@ %@", element, element];
	}];
	XCTAssertEqualObjects(r1, @"w00t w00t");
	id r2 = [dict at:@2 ifPresent:^id(id element) {
		return element;
	}];
	XCTAssertNil(r2);
}

- (void)testAtPut {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	[dict at:@1 put:@"foo"];
	XCTAssertEqualObjects([dict objectForKey:@1], @"foo");
}

- (void)testAtIfAbsentPutAbsent {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	[dict at:@1 put:@"foo"];
	id r = [dict at:@2 ifAbsentPut:^id{
		return @"bar";
	}];
	XCTAssertEqualObjects(r, @"bar");
	XCTAssertEqualObjects([dict objectForKey:@2], @"bar");
}

- (void)testAtIfAbsentPutPresent {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	[dict at:@1 put:@"foo"];
	id r = [dict at:@1 ifAbsentPut:^id{
		return @42;
	}];
	XCTAssertEqualObjects(r, @"foo");
	XCTAssertEqualObjects([dict objectForKey:@1], @"foo");
}

- (void)testIncludesKey {
	NSDictionary *sut = @{
		@1 : @""
	};
	XCTAssertTrue([sut includesKey:@1]);
	XCTAssertFalse([sut includesKey:@2]);
}

- (void)testIncludesValue {
	NSDictionary *sut = @{
		@1: @"hello world"
	};
	XCTAssertTrue([sut includesValue:@"hello world"]);
	XCTAssertFalse([sut includesValue:@"foo"]);
}

@end
