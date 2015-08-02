#import <Foundation/Foundation.h>


typedef void (^EachBlock)(id each);
typedef void (^EachWithIndexBlock)(id each, NSUInteger idx);
typedef void (^EachSeparatorBlock)(void);


@interface NSObject (OpinionatedEach)

/**
 * Evaluate eachBlock with each of the receiver's elements as the argument.
 */
- (void)each:(EachBlock)eachBlock;

/**
 * Evaluate eachBlock with each of the receiver's elements as the first argument
 * and it's index as the second.
 */
- (void)eachWithIndex:(EachWithIndexBlock)eachBlock;

/**
 * Evaluate eachBlock for each element in the collection. Between each pair of 
 * elements, but not before the first or after the last, evaluate the separatorBlock.
 */
- (void)each:(EachBlock)eachBlock separatedBy:(EachSeparatorBlock)separatorBlock;

@end
