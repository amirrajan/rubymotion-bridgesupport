// typedef NSDictionary<NSString *, id> CPTDictionary;

@class CPTTextStyle;

@interface CPTTextStyle : NSObject<NSCopying, NSMutableCopying, NSCoding, NSSecureCoding>

@end

#pragma mark -

@interface CPTTextStyle(CPTPlatformSpecificTextStyleExtensions)

@property (readonly, nonatomic, nonnull) NSDictionary<NSString *, id> *attributes;

@end
