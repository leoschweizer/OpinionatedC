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
