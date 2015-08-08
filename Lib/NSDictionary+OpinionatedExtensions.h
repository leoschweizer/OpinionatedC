#import <Foundation/Foundation.h>


@class OCAssociation;


@interface NSDictionary (OpinionatedExtensions)

/**
 * Answers an enumerator which enumerates the receiver's key-value-pairs
 * as OCAssociation instances.
 */
- (NSEnumerator *)associationEnumerator;

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

@end
