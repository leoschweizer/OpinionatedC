#import <Foundation/Foundation.h>


@protocol OCMutableCollectionConstruction <NSFastEnumeration>

- (id)newMutableCollectionInstace;
- (void)addObject:(id)obj toMutableCollection:(id)collection;
- (id)newCollectionFromMutableCollection:(id)collection;

@end


@interface NSArray (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end


@interface NSSet (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end
