@interface NSIndexSet : NSObject <NSCopying, NSMutableCopying, NSSecureCoding>
- (void)enumerateIndexesUsingBlock:(void (NS_NOESCAPE ^)(NSUInteger idx, BOOL *stop))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
@end
