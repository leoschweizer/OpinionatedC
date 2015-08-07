#import <Foundation/Foundation.h>


@class OCInterval;


typedef void (^OCRepeatBlock)(void);
typedef void (^OCRepeatWithIndexBlock)(NSUInteger idx);


@interface NSNumber (OpinionatedExtensions)

/**
 * Answer a random integer from 0 to self (excluded).
 */
- (NSNumber *)atRandom;

/**
 * Evaluate repeatBlock the number of times represented by the receiver.
 */
- (void)timesRepeat:(OCRepeatBlock)repeatBlock;

/**
 * Evaluate repeatBlock the numer of times represented by the receiver,
 * passing the number of the current repetition as argument.
 */
- (void)timesRepeatWithIndex:(OCRepeatWithIndexBlock)repeatBlock;

/**
 * Answer an Interval from the receiver up to other, with each next element 
 * computed by incrementing the previous one by 1
 */
- (OCInterval *)to:(NSNumber *)other;

/**
 * Answer an Interval from the receiver up to other, with each next element
 * computed by incrementing the previous one by stepSize
 */
- (OCInterval *)to:(NSNumber *)other by:(NSNumber *)stepSize;

@end
