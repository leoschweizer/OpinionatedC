#import <Foundation/Foundation.h>


@interface OCAssociation : NSObject

@property (nonatomic, readonly) id key;
@property (nonatomic, readonly) id value;

- (instancetype)initWithKey:(id)key value:(id)value;

@end


@interface NSObject (OCAssociationSupport)

- (OCAssociation *)asAssociationWithKey:(id)key;
- (OCAssociation *)asAssociationWithValue:(id)value;

@end
