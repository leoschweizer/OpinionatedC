#import <Foundation/Foundation.h>
#import "OCSelectorPrefix.h"


@interface OCAssociation : NSObject

@property (nonatomic, readonly) id key;
@property (nonatomic, readonly) id value;

- (instancetype)initWithKey:(id)key value:(id)value;

@end


@interface NSObject (OCAssociationSupport)

- (OCAssociation *)OC_PREFIXED(asAssociationWithKey):(id)key;
- (OCAssociation *)OC_PREFIXED(asAssociationWithValue):(id)value;

@end
