#import <Foundation/Foundation.h>


@protocol OCEnumerableCollection <NSObject>

- (NSEnumerator *)oc_collectionEnumerator;

@end


@protocol OCMutableCollectionConstruction <OCEnumerableCollection>

- (id)oc_createMutableInstanceOfMyKind;
- (void)oc_addObject:(id)obj toMutableCollection:(id)collection;
- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection;

@end


@interface NSArray (OCCollectionCapabilities) <OCEnumerableCollection, OCMutableCollectionConstruction>

@end


@interface NSDictionary (OCCollectionCapabilities) <OCEnumerableCollection, OCMutableCollectionConstruction>

@end


@interface NSSet (OCCollectionCapabilities) <OCEnumerableCollection, OCMutableCollectionConstruction>

@end


@interface NSString (OCCollectionCapabilities) <OCEnumerableCollection, OCMutableCollectionConstruction>

@end
