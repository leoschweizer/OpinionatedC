#import <Foundation/Foundation.h>


@interface OCAssociationEnumerator : NSObject <NSFastEnumeration>

+ (instancetype)enumerateDictionary:(NSDictionary *)dictionary;

@end
