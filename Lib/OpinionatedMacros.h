
#define NotYetImplemented() @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%s is not implemented yet", __PRETTY_FUNCTION__] userInfo:nil]

#define SubclassResponsibility() @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%s should be overridden in a subclass", __PRETTY_FUNCTION__] userInfo:nil]

#define ShouldNotOccur() @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%s should not be called", __PRETTY_FUNCTION__] userInfo:nil]

#define UnsupportedOperation() @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%s is not supported", __PRETTY_FUNCTION__] userInfo:nil]

