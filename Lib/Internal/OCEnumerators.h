#import <Foundation/Foundation.h>


@class OCInterval;


@interface OCAssociationEnumerator : NSEnumerator

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


@interface OCCharacterEnumerator : NSEnumerator

- (instancetype)initWithString:(NSString *)string;

@end


@interface OCIntervalEnumerator : NSEnumerator

- (instancetype)initWithInterval:(OCInterval *)interval;

@end


@interface OCMapTableEnumerator : NSEnumerator

- (instancetype)initWithMapTable:(NSMapTable *)mapTable;

@end


@interface OCNullEnumerator : NSEnumerator

@end
