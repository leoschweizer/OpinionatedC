#import <Foundation/Foundation.h>


typedef BOOL (^OCFilterBlock)(id each);


@interface NSObject (OpinionatedSubsetting)

/**
 * Answer the first element. If the receiver is empty, answer nil.
 */
- (id)first;

/**
 * Answer the first count elements as a collection that is like the receiver. 
 * If the receiver contains less than count elements, answer all of the
 * receiver's elements.
 */
- (id)first:(NSUInteger)count;

/**
 * Evaluate selectBlock with each of the receiver's elements as the argument.
 * Collect into a new collection like the receiver, only those elements for which
 * selectBlock evaluates to true. Answer the new collection.
 */
- (id)select:(OCFilterBlock)selectBlock;

@end
