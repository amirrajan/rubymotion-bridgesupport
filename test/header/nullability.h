#import <Foundation/Foundation.h>

@interface AAA : NSObject
- (void)setSelector1:(SEL)selector;
- (void)setSelector2:(nullable SEL)selector;
- (void)setSelector3:(__nullable SEL)selector;
- (void)setSelector4:(nonnull SEL)selector;
- (void)setSelector5:(__nonnull SEL)selector;
@end

typedef struct {
    int a;
} TestStruct;

@interface BBB : NSObject
- (void)method1:(TestStruct*)st;
- (void)method2:(nonnull TestStruct*)st;
- (void)method3:(nullable TestStruct*)st;
@end

@interface CCC : NSObject
- (TestStruct*)return1;
- (nonnull TestStruct*)return2;
- (nullable TestStruct*)return3;
@end
