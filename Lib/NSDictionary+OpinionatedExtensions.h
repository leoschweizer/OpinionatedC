#import <Foundation/Foundation.h>


@class OCAssociation;


typedef id (^OCAbsentBlock)(void);
typedef id (^OCPresentBlock)(id element);


@interface NSDictionary (OpinionatedExtensions)

/**
 * Answers an enumerator which enumerates the receiver's key-value-pairs
 * as OCAssociation instances.
 */
- (NSEnumerator *)associationEnumerator;

/**
 * Answer the value at aKey. If aKey is not found, answer the
 * result of evaluating aBlock.
 */
- (id)at:(id)aKey ifAbsent:(OCAbsentBlock)aBlock;

/**
 * Answer the value at aKey. If a value is found, answer the result of evaluating
 * aBlock with the corresponding value.
 */
- (id)at:(id)aKey ifPresent:(OCPresentBlock)aBlock;

/**
 * Answer whether the receiver has a key equal to aKey.
 */
- (BOOL)includesKey:(id)aKey;

/**
 * Answer whether the receiver has a value equal to aValue.
 */
- (BOOL)includesValue:(id)aValue;

@end


@interface NSMutableDictionary (OpinionatedExtensions)

/**
 * Include anAssociation as one of the receiver's elements. Answer
 * anAssociation.
 */
- (OCAssociation *)add:(OCAssociation *)anAssociation;

/**
 * Set the value at aKey to be aValue. Answer aValue.
 */
- (id)at:(id)aKey put:(id)aValue;

/**
 * Answer the value at aKey. If aKey is not found, set its value to the result
 * of evaluating aBlock, and answer that value.
 */
- (id)at:(id)aKey ifAbsentPut:(OCAbsentBlock)aBlock;

@end
