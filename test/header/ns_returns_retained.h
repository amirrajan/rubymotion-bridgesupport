NS_RETURNS_RETAINED NSString* MakeString();

@interface ReturnsRetained : NSObject
- (NSString *)testMethod1 NS_RETURNS_RETAINED;
- (NSString *)testMethod2 NS_RETURNS_NOT_RETAINED;
- (NSString *)testMethod3;
- (NSString *)testMethod4 __attribute__((ns_returns_autoreleased));
@end