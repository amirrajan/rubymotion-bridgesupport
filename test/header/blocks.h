@interface Foo : NSObject
- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block;
@end

#if NS_BLOCKS_AVAILABLE
@interface Bar : NSObject
- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block;
@end
#endif