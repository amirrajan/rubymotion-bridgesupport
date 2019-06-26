#import <Foundation/Foundation.h>

// http://hipbyte.myjetbrains.com/youtrack/issue/RM-479
typedef enum TestEnumValue : NSUInteger {
    FooBarBaz = 42
} TestEnumValue;

// http://hipbyte.myjetbrains.com/youtrack/issue/RM-886
typedef NS_ENUM(NSInteger, ASScrollDirection) {
  ASScrollDirectionNone,
};
@interface Foo : NSObject
- (void)foo:(enum ASScrollDirection)scrollDirection;
@end
