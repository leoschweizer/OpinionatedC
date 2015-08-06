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

/**
 * Evaluate eachBlock with each of the receiver's elements as the first argument
 * and it's index as the second. Between each pair of elements, but not before 
 * the first or after the last, evaluate the separatorBlock.
 */
- (void)eachWithIndex:(OCEachWithIndexBlock)eachBlock separatedBy:(OCEachSeparatorBlock)separatorBlock;

/**
 * Answer if the receiver contains no elements.
 */
- (BOOL)isEmpty;

/**
 * Answer if the receiver contains any elements.
 */
- (BOOL)isNotEmpty;

@end
