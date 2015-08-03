#import <Foundation/Foundation.h>


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

@end
