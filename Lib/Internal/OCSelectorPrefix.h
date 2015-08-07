#ifndef Pods_OCSelectorPrefix_h
#define Pods_OCSelectorPrefix_h

#ifndef OC_PREFIX
#define OC_PREFIX 
#endif

#define OC_PREFIXED(sel) OC_PREFIXED1(OC_PREFIX, sel)
#define OC_PREFIXED1(prefix, selector) OC_PREFIXED2(prefix, selector)
#define OC_PREFIXED2(prefix, selector) prefix ## selector

#endif
