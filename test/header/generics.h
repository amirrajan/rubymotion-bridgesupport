#import <Foundation/Foundation.h>

@interface Foo<T:NSString *> : NSObject 

- (void)setArray:(NSArray<T> *)ary;

@end
