#import <Foundation/Foundation.h>


typedef void (^EachBlock)(id each);
typedef void (^EachWithIndexBlock)(id each, NSUInteger idx);
typedef void (^EachSeparatorBlock)(void);


@interface NSObject (OpinionatedEach)

- (void)each:(EachBlock)eachBlock;
- (void)eachWithIndex:(EachWithIndexBlock)eachBlock;
- (void)each:(EachBlock)eachBlock separatedBy:(EachSeparatorBlock)separatorBlock;

@end
