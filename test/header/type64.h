#import <Foundation/Foundation.h>

#if __LP64__
typedef double MyFloat;
#else
typedef float  MyFloat;
#endif

@interface Foo : NSObject
- (void)setFloat:(MyFloat)flt;
@end
