#import <Foundation/Foundation.h>


@interface OCAssociation : NSObject

@property (nonatomic, readonly) id key;
@property (nonatomic, readonly) id value;

- (instancetype)initWithKey:(id)key value:(id)value;

@end
