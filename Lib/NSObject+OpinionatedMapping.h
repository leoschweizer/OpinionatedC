#import <Foundation/Foundation.h>


typedef id (^OCMapBlock)(id each);


@interface NSObject (OpinionatedMapping)

/**
 * Evaluate mapblock with each of the values of the receiver as the
 * argument.  Collect the resulting values into a collection that is like
 * the receiver. Answer the new collection.
 */
- (id)map:(OCMapBlock)mapBlock;

@end
