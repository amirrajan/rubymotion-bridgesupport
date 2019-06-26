#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (MyExpanded)

- (UIColor *)colorByAdding:(CGFloat)f;
- (NSString *)stringFromColor;
- (NSString *)hexStringFromColor;

@end
