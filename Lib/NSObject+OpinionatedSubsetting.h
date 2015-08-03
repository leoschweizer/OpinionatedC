#import <Foundation/Foundation.h>


@interface NSObject (OpinionatedSubsetting)

- (id)first;
- (id<NSFastEnumeration>)first:(NSUInteger)count;

@end
