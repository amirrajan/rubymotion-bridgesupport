@interface Foo : NSObject
- (void)testBlock:(void (^)(NSString *string))block;
@end

#if NS_BLOCKS_AVAILABLE
@interface Bar : NSObject
- (void)testBlock:(void (^)(NSString *string))block;
@end
#endif