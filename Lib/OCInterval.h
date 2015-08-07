#import <Foundation/Foundation.h>
#import "OCCollectionCapabilities.h"


@interface OCInterval : NSObject <OCMutableCollectionConstruction>

@property (nonatomic, readonly) NSInteger from;
@property (nonatomic, readonly) NSInteger to;
@property (nonatomic, readonly) NSInteger by;

- (instancetype)initWithFrom:(NSInteger)from to:(NSInteger)to by:(NSInteger)by;

- (NSEnumerator *)intervalEnumerator;

@end
