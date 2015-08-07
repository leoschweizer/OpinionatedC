#import <Foundation/Foundation.h>


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

@end
