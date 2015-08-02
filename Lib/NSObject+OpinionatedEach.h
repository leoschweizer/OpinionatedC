#import <Foundation/Foundation.h>


typedef void (^OCEachBlock)(id each);
typedef void (^OCEachWithIndexBlock)(id each, NSUInteger idx);
typedef void (^OCEachSeparatorBlock)(void);


@interface NSObject (OpinionatedEach)

/**
 * Evaluate eachBlock with each of the receiver's elements as the argument.
 */
- (void)each:(OCEachBlock)eachBlock;

/**
 * Evaluate eachBlock with each of the receiver's elements as the first argument
 * and it's index as the second.
 */
- (void)eachWithIndex:(OCEachWithIndexBlock)eachBlock;

/**
 * Evaluate eachBlock for each element in the collection. Between each pair of 
 * elements, but not before the first or after the last, evaluate the separatorBlock.
 */
- (void)each:(OCEachBlock)eachBlock separatedBy:(OCEachSeparatorBlock)separatorBlock;

@end
