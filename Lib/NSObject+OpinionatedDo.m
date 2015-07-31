#import "NSObject+OpinionatedDo.h"


@implementation NSObject (OpinionatedDo)

@end


@implementation NSArray (OpinionatedDo)

- (void)each:(void (^)(id))eachBlock separatedBy:(void (^)(void))separatorBlock {
	BOOL isFirst = YES;
	for (id each in self) {
		if (isFirst) {
			isFirst = NO;
		} else {
			separatorBlock();
		}
		eachBlock(each);
	}
}

@end
