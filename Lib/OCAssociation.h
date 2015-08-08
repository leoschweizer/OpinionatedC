#import <Foundation/Foundation.h>


@interface OCAssociation : NSObject

@property (nonatomic, readonly) id key;
@property (nonatomic, readonly) id value;

- (instancetype)initWithKey:(id)key value:(id)value;

@end


@interface NSObject (OCAssociationSupport)

/**
 * Answer a new OCAssociation with the receiver as the value and the argument as the key.
 */
- (OCAssociation *)asAssociationWithKey:(id)key;

/**
 * Answer a new OCAssociation with the receiver as the key and the argument as the value.
 */
- (OCAssociation *)asAssociationWithValue:(id)value;

@end
