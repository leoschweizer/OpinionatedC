#import <Foundation/Foundation.h>


typedef BOOL (^OCFilterBlock)(id each);


@interface NSObject (OpinionatedSubsetting)

/**
 * Answer true if satisfyBlock answers true for all elements of the receiver.
 * An empty collection answers true.
 */
- (BOOL)allSatisfy:(OCFilterBlock)satisfyBlock;

/**
 * Answer true if satisfyBlock answers true for any element of the receiver.
 * An empty collection answers false.
 */
- (BOOL)anySatisfy:(OCFilterBlock)satisfyBlock;

/**
 * Evaluate detectBlock with each of the receiver's elements as the argument.
 * Answer the first element for which aBlock evaluates to true.
 */
- (id)detect:(OCFilterBlock)detectBlock;

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
 * Evaluate rejectBlock with each of the receiver's elements as the argument.
 * Collect into a new collection like the receiver, only those elements for which
 * rejectBlock evaluates to false. Answer the new collection.
 */
- (id)reject:(OCFilterBlock)rejectBlock;

/**
 * Evaluate selectBlock with each of the receiver's elements as the argument.
 * Collect into a new collection like the receiver, only those elements for which
 * selectBlock evaluates to true. Answer the new collection.
 */
- (id)select:(OCFilterBlock)selectBlock;

/**
 * Evaluate whileBlock with each of the receiver's elements as the argument
 * until it answers NO. Answer a collection with all of the elements that
 * evaluated to YES.
 */
- (id)takeWhile:(OCFilterBlock)whileBlock;

@end
