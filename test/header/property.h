#import <Foundation/Foundation.h>

@interface Foo : NSObject
@property (strong, readonly) NSString *sample1;
@property (assign, readonly) NSString *sample2;
@end

@interface TestClassProperty : NSObject
@property (class, assign, readonly) NSString *sample1;
@end
