#import <Foundation/Foundation.h>


typedef id (^OCMapBlock)(id each);
typedef id (^OCReduceBlock)(id running, id each);


@interface NSObject (OpinionatedMapping)

/**
 * Accumulate a running value associated with evaluating the argument,
 * reduceBlock, with the current value and the receiver as block arguments.
 * The initial value is the value of the argument initialValue."
 * 
 * For example, to sum a collection, use:
 * [@[@1, @2, @3] inject:@0 into:^id(NSNumber *running, NSNumber *current) {
 *     return @([running integerValue] + [current integerValue]);
 * }];
 *
 */
- (id)inject:(id)initialValue into:(OCReduceBlock)reduceBlock;

/**
 * Evaluate mapblock with each of the values of the receiver as the
 * argument. Collect the resulting values into a collection that is like
 * the receiver. Answer the new collection.
 */
- (id)map:(OCMapBlock)mapBlock;

/**
 * Identical to inject:into: with an initialValue of nil.
 */
- (id)reduce:(OCReduceBlock)reduceBlock;

@end
