#import <Foundation/Foundation.h>


@protocol OCMutableCollectionConstruction <NSObject>

- (id)oc_createMutableInstanceOfMyKind;
- (NSEnumerator *)oc_collectionEnumerator;
- (void)oc_addObject:(id)obj toMutableCollection:(id)collection;
- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection;

@end


@interface NSArray (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end


@interface NSDictionary (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end


@interface NSSet (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end


@interface NSString (OCMutableCollectionConstruction) <OCMutableCollectionConstruction>

@end
