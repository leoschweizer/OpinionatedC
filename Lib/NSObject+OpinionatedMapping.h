#import <Foundation/Foundation.h>


@interface NSObject (OpinionatedMapping)

- (id)map:(id (^)(id element))mapBlock;

@end
