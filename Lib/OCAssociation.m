#import "OCAssociation.h"


@implementation OCAssociation

- (instancetype)initWithKey:(id)key value:(id)value {
	if (self = [super init]) {
		_key = key;
		_value = value;
	}
	return self;
}

@end


@implementation NSObject (OCAssociationSupport)

- (OCAssociation *)asAssociationWithKey:(id)key {
	return [[OCAssociation alloc] initWithKey:key value:self];
}

- (OCAssociation *)asAssociationWithValue:(id)value {
	return [[OCAssociation alloc] initWithKey:self value:value];
}

@end
