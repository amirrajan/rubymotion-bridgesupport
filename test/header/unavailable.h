#import <Availability.h>
#import <Foundation/Foundation.h>

NSString *const TestConstant1 __attribute__((availability(ios,introduced=6.1,obsoleted=8.0)));
NSString *const TestConstant2 __OSX_UNAVAILABLE;
int Function1() __OSX_UNAVAILABLE;
int Function2() __IOS_UNAVAILABLE __TVOS_AVAILABLE(9_0);
int Function3() __TVOS_PROHIBITED;

@interface Test : NSObject
- (NSString *)testMethod1 __OSX_UNAVAILABLE;
- (NSString *)testMethod2 __IOS_UNAVAILABLE;
- (NSString *)testMethod3 NS_AVAILABLE(10_7, 4_0) __TVOS_PROHIBITED;
- (NSString *)testMethod4 NS_AVAILABLE_IOS(4_0) __TVOS_PROHIBITED;
- (NSString *)testMethod5 NS_AVAILABLE_IOS(9_0);
- (NSString *)testMethod6 NS_AVAILABLE(NA, 8_0) __TVOS_PROHIBITED;
- (NSString *)testMethod7 NS_AVAILABLE(10_7, NA);
@end
