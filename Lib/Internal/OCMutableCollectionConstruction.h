#import <Foundation/Foundation.h>


@protocol OCMutableCollectionConstruction <NSObject>

- (id)newMutableCollectionInstace;
- (id<NSFastEnumeration>)collectionEnumerator;
- (void)addObject:(id)obj toMutableCollection:(id)collection;
- (id)newCollectionFromMutableCollection:(id)collection;

@end


@interface NSArray (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end


@interface NSDictionary (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end


@interface NSSet (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end
