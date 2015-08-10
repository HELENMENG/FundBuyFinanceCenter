//
//  FBCategory.m
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/7.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

#import "FBCategory.h"
@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

@end

@implementation UIView (DXUIBackGroundView)

- (void)addDXUIBackGroundView {
    self.backgroundColor = [UIColor colorWithHexString:@"efefef"];
}

@end
@implementation UIButton (UIButtonImageWithLable)
- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType {
    [self.titleLabel setFont:self.titleLabel.font];
    
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    [self.imageView setContentMode:UIViewContentModeCenter];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width, 0, -titleSize.width)];
    
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self setTitleColor:[UIColor blueColor] forState:stateType];//用这个方法替换下面的方法，文字的颜色就可以显示了。
    if (stateType == UIControlStateSelected) {
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    }else{
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    [self  setTitleEdgeInsets:UIEdgeInsetsMake(0, -image.size.width, 3, image.size.width)];
    
    [self setTitle:title forState:stateType];
    
}

- (void) setTitle:(NSString *)title withImage:(UIImage *)image forState:(UIControlState)stateType {
    [self setImage:image forState:stateType];
    [self.titleLabel setFont:self.titleLabel.font];
    //
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    //    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    //    [self setTitleColor:[UIColor blueColor] forState:stateType];//用这个方法替换下面的方法，文字的颜色就可以显示了。
    //    if (stateType == UIControlStateSelected) {
    //        [self setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    //    }else{
    //        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    }
    //    [self  setTitleEdgeInsets:UIEdgeInsetsMake(0, image.size.width, 0, -image.size.width)];
    [self setTitle:title forState:stateType];
    //
    //
    //
    //    CGSize titleSize = [title sizeWithFont:self.titleLabel.font];
    [self.imageView setContentMode:UIViewContentModeCenter];
    //    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -titleSize.width, 0, titleSize.width)];
    //
    //    [self setImage:image forState:stateType];
    
    
    
}

@end

@implementation NSDictionary (NSDictionaryEqualNull)

-(BOOL)isValueForKey:(NSString *)key{
    // judge nil
    if(![self objectForKey:key]){
        return NO;
    }
    id obj = [self objectForKey:key];// judge NSNull
    
    return ![obj isEqual:[NSNull null]];
}

@end
@implementation NSString (NSStringEqualNull)

- (BOOL)isBlankString{
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
@implementation NSNull (JSON)

- (NSUInteger)length { return 0; }

- (NSInteger)integerValue { return 0; };

- (float)floatValue { return 0; };

- (NSString *)description { return @"0(NSNull)"; }

- (NSArray *)componentsSeparatedByString:(NSString *)separator { return @[]; }

- (id)objectForKey:(id)key { return nil; }

- (BOOL)boolValue { return NO; }
- (NSInteger)count {return 0;}
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet {return NSMakeRange(0, 0);}
@end
@implementation MTLModel (KTVNullableScalar)
- (void)setNilValueForKey:(NSString *)key {
    [self setValue:@0 forKey:key]; // For NSInteger/CGFloat/BOOL
}
@end