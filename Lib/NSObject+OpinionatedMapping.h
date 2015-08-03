#import <Foundation/Foundation.h>


typedef id (^OCMapBlock)(id each);


@interface NSObject (OpinionatedMapping)

- (id)map:(OCMapBlock)mapBlock;

@end
