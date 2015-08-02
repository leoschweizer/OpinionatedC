#import <Foundation/Foundation.h>


@interface NSObject (OpinionatedDo)

- (void)each:(void(^)(id element))eachBlock separatedBy:(void(^)(void))separatorBlock;

@end
