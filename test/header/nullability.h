#import <Foundation/Foundation.h>

@interface Foo : NSObject
- (void)setSelector1:(SEL)selector;
- (void)setSelector2:(nullable SEL)selector;
- (void)setSelector3:(__nullable SEL)selector;
- (void)setSelector4:(nonnull SEL)selector;
- (void)setSelector5:(__nonnull SEL)selector;
@end
