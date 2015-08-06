#import <Foundation/Foundation.h>


@interface NSObject (OpinionatedExtensions)

/**
 * Coerce [NSNull null] to true and everything else to false.
 */
- (BOOL)isNull;

/**
 * Coerce [NSNull null] to false and everything else to true.
 */
- (BOOL)isNotNull;

@end
