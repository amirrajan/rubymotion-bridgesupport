#import <AvailabilityMacros.h>
#import <Foundation/NSValue.h>
#import <Foundation/NSCoder.h>

@interface Variadic : NSObject
+ (id)method1:(id)firstObj, ...;
+ (id)method2:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
@end