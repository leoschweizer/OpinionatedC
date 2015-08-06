#import <Foundation/Foundation.h>


@interface OCAssociationEnumerator : NSEnumerator

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


@interface OCCharacterEnumerator : NSEnumerator

- (instancetype)initWithString:(NSString *)string;

@end


@interface OCNullEnumerator : NSEnumerator

@end
