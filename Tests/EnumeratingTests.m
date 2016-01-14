#import <XCTest/XCTest.h>
#import "NSObject+OpinionatedEnumerating.h"
#import "OCEnumerableMockCollection.h"
#import "OCAssociation.h"


@interface EnumeratingTests : XCTestCase

@end


@implementation EnumeratingTests

- (void)testEachOnObject {
	__block NSMutableArray *probeArray = [NSMutableArray array];
	XCTAssertTrue(probeArray.count == 0);
	[@12 each:^(id each) {
		[probeArray addObject:each];
	}];
	XCTAssertTrue(probeArray.count == 1);
	XCTAssertEqualObjects([probeArray firstObject], @12);
}

- (void)testEachWithIndexOnObject {
	__block NSUInteger count = 0;
	id probe = [[NSObject alloc] init];
	[probe eachWithIndex:^(id each, NSUInteger idx) {
		XCTAssertEqualObjects(each, probe);
		XCTAssertEqual(idx, 0);
		count++;
	}];
	XCTAssertEqual(count, 1);
}

- (void)testEachSeparatedByOnObject {
	__block NSUInteger eachCount = 0;
	__block NSUInteger separatorCount = 0;
	[self
		each:^(id each) {
			XCTAssertEqualObjects(each, self);
			eachCount++;
		}
		separatedBy:^{
			separatorCount++;
		}
	];
	XCTAssertEqual(eachCount, 1);
	XCTAssertEqual(separatorCount, 0);
}

- (void)testEachWithIndexSeparatedByOnObject {
	__block NSUInteger eachCount = 0;
	__block NSUInteger separatorCount = 0;
	[@YES
		eachWithIndex:^(id each, NSUInteger idx) {
			XCTAssertEqualObjects(each, @YES);
			XCTAssertEqual(idx, 0);
			eachCount++;
		}
		separatedBy:^{
			separatorCount++;
		}
	];
	XCTAssertEqual(eachCount, 1);
	XCTAssertEqual(separatorCount, 0);
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

- (void)testEachWithIndexSeparatedByOnArray {
	__block NSUInteger eachCount = 0;
	__block NSUInteger separatorCount = 0;
	__block NSMutableArray *probeArray = [NSMutableArray array];
	[@[@1, @2, @3]
		eachWithIndex:^(id each, NSUInteger idx) {
			[probeArray addObject:@(idx)];
			eachCount++;
		}
		separatedBy:^{
			[probeArray addObject:@NO];
			separatorCount++;
		}
	];
	XCTAssertEqual(eachCount, 3);
	XCTAssertEqual(separatorCount, 2);
	XCTAssertEqualObjects(probeArray, (@[@0, @NO, @1, @NO, @2]));
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

- (void)testEachWithIndexSeparatedByOnDictionary {
	__block NSUInteger eachCount = 0;
	__block NSUInteger separatorCount = 0;
	NSDictionary *sut = @{
		@0 : @"foo",
		@1 : @"bar"
	};
	[sut
		eachWithIndex:^(OCAssociation *each, NSUInteger idx) {
			XCTAssertTrue([each isKindOfClass:OCAssociation.class]);
			eachCount++;
		}
		separatedBy:^{
			separatorCount++;
		}
	];
	XCTAssertEqual(eachCount, sut.count);
	XCTAssertEqual(separatorCount, sut.count - 1);
}

- (void)testIsEmptyOnObject {
	XCTAssertFalse([@5 isEmpty]);
	XCTAssertTrue([@5 isNotEmpty]);
}

- (void)testIsEmptyOnArray {
	XCTAssertTrue([@[] isEmpty]);
	XCTAssertFalse([@[] isNotEmpty]);
	XCTAssertFalse([@[@5] isEmpty]);
	XCTAssertTrue([@[@5] isNotEmpty]);
}

- (void)testIsEmptyOnData {
	XCTAssertTrue([[NSData data] isEmpty]);
	XCTAssertFalse([[[NSData alloc] initWithBase64EncodedString:@"ab" options:NSDataBase64DecodingIgnoreUnknownCharacters] isEmpty]);
}

- (void)testIsEmptyOnDictionary {
	XCTAssertTrue([@{} isEmpty]);
	XCTAssertFalse([@{} isNotEmpty]);
	XCTAssertFalse([@{ @1 : @"" } isEmpty]);
	XCTAssertTrue([@{ @1 : @"" } isNotEmpty]);
}

- (void)testIsEmptyOnString {
	XCTAssertTrue([@"" isEmpty]);
	XCTAssertFalse([@"a" isEmpty]);
}

- (void)testIsEmptyOnNull {
	XCTAssertTrue([[NSNull null] isEmpty]);
	XCTAssertFalse([[NSNull null] isNotEmpty]);
}

- (void)testIsEmptyOnMockCollection {
	XCTAssertFalse([[[OCEnumerableMockCollection alloc] init] isEmpty]);
}

@end
