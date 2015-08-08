#import <Foundation/Foundation.h>


/**
 * An Association is a pair of a key and a value.
 * It can serve as an entry in a dictionary.
 */
@interface OCAssociation : NSObject

/**
 * Answer the lookup key of the receiver.
 */
@property (nonatomic, readonly) id key;

/**
 * Answer the value of the receiver.
 */
@property (nonatomic, readonly) id value;

/**
 * Answer a new instance of the receiver with the arguments as the key and
 * value of the association.
 */
- (instancetype)initWithKey:(id)key value:(id)value;

@end


/**
 * The category OCAssociationSupport offers convenience initializers for
 * OCAssociation instances. These should be used in favor of the OCAssociation
 * initializer.
 */
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
