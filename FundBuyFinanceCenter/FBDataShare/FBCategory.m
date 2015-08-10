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
static NSString *dxSDKDateTimeFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
static NSString *dxSDKCreditDateTimeFormat = @"yyMM";
static NSString *dxSDKCreditDateDisplayFormat = @"yy/MM";
static NSString *dxSDKDateOnlyFormat = @"yyyy-MM-dd";
static NSString *dxSDKTimeOnlyFormat = @"HH:mm";
static NSString *dxSDKDateYearMonthDayFormat = @"yyyy年MM月dd日";
static NSString *dxSDKDateOnly = @"MM-dd";
static NSString *dxSDKDateOnlyChineseFormat = @"MM月dd日";
static NSString *dxSDKDateTimeDisplayFormat = @"yyyy-MM-dd HH:mm";
static NSString *dxSDKDateTimeFullFormat = @"yyyy-MM-dd HH:mm:ss";
static NSString *dxSDKUniqueString = @"yyyyMMddHHmmss";
static NSString *dxSDKChatGroupIDString = @"yyyy_MM_dd_HH_mm_ss";
static NSString *dxSDKCurrentDayTimeString = @"HH:mm";
static NSString *dxSDKCurrentWeekTimeString = @"cccc HH:mm";
static NSString *dxSDKDateFolderFormat = @"yyyy/MM/dd/HH";
static NSString *dxSDKTimeSCValue = @"HH_mm_ss_SSS";
static NSString *dxSDKDateAndTimeFormat = @"MM-dd HH:mm";
@implementation NSDate(FBDate)

- (NSString *)toFormattedString:(NSString *)format{
    NSString *stringRet = @"";
    if (format) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: format];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
        stringRet = [dateFormatter stringFromDate: self];
        return stringRet;
    }
    return stringRet;
}

- (NSString *)toChineseString
{
    return [self toFormattedString:dxSDKDateOnlyChineseFormat];
}

- (NSString *)toString
{
    return [self toFormattedString:dxSDKDateOnlyFormat];
}

- (NSString *)toStringTimeOnly {
    return [self toFormattedString:dxSDKTimeOnlyFormat];
}

- (NSString *)toFolderString
{
    return [self toFormattedString:dxSDKDateFolderFormat];
}
- (NSString *)toRandomFilenameString {
    return [self toFormattedString:dxSDKTimeSCValue];
}

- (NSString *)toStringYearMonthDay
{
    return [self toFormattedString:dxSDKDateYearMonthDayFormat];
}
- (NSString *)toStringOnly
{
    return [self toFormattedString:dxSDKDateOnly];
}
- (NSString *)toStringDetail
{
    return [self toFormattedString:dxSDKDateTimeFormat];
}
- (NSString *)toStringCreditDatetime
{
    return [self toFormattedString:dxSDKCreditDateTimeFormat];
}
- (NSString *)toStringCreditDateDisplay
{
    return [self toFormattedString:dxSDKCreditDateDisplayFormat];
}
- (NSString *)toStringDisplay
{
    return [self toFormattedString:dxSDKDateTimeDisplayFormat];
}
- (NSString *)toStringFullDisplay
{
    return [self toFormattedString:dxSDKDateTimeFullFormat];
}
- (NSString *)toStringToday {
    return [self toFormattedString:dxSDKCurrentDayTimeString];
}
- (NSString *)toStringThisWeek {
    return [self toFormattedString:dxSDKCurrentWeekTimeString];
}
- (NSString *)toStringDateAndTimeDisplay
{
    return [self toFormattedString:dxSDKDateAndTimeFormat];
}
-(NSString *)createdAt
{
    // 取出数据结构为: Sat Apr 19 19:15:53 +0800 2014，将数据格式化输出业务数据
    NSDateFormatter *dfm = [[NSDateFormatter alloc] init];
    dfm.dateFormat = @"EEE MMM dd HH:mm:ss zzzz yyyy";
    dfm.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    // 格式取出的字符串，获取时间对象
    NSDate *createdTime = self;
    dfm.dateFormat = @"M月d日 HH点mm分";
    
    //    // 时间格式化成字符串
    //    NSString *createdTimeStr = [dfm stringFromDate:createdTime];
    
    NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:createdTime];
    NSTimeInterval second = time;       // 时间单位换算成 秒
    NSTimeInterval minute = time / 60;  // 时间单位换算成 分
    NSTimeInterval hour = minute / 60;  // 时间单位换算成 时
    NSTimeInterval day = hour / 24;     // 时间单位换算成 天
    NSTimeInterval year = day / 365;    // 时间单位换算成 年
    
    if (second < 60) {                  // 1分钟之内显示 "刚刚"
        return @"刚刚";
    } else if (minute < 60) {           // 1小时之内显示 "x分钟前"
        return [NSString stringWithFormat:@"%.f分钟前", minute];
    } else if (hour < 24) {             // 1天之内显示 "x小时前"
        return [NSString stringWithFormat:@"%.f小时前", hour];
    } else if (day < 7) {               // 1周之内显示 "x天前"
        return [NSString stringWithFormat:@"%.f天前", day];
    } else if (year >= 1) {             // 1年以前显示 "xxxx年x月x日"
        dfm.dateFormat = @"yyyy年M月d日";
        return [dfm stringFromDate:createdTime];
    } else {                            // 1年以内显示 "x月x日 x点x分"
        return [self toString];
    }
}

+ (NSString *)generateUniqueID
{
    return [[NSDate date] toFormattedString:dxSDKUniqueString];
}

+ (NSInteger)currentYearNumber
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]]; //获取当前年
    return [dateComponents year];
}

- (NSString *)toDurationStringWithReferenceDate:(NSDate *)referenceDate {
    
    NSString *messageStr = nil;
    NSTimeInterval timerInterval = [self timeIntervalSinceDate:referenceDate];
    if (timerInterval < 0) {
        timerInterval = -timerInterval;
    }
    NSInteger secs = timerInterval;
    NSInteger mins = secs / 60;
    NSInteger hours = mins / 60;
    NSInteger days = hours / 24;
    
#if DATE_DESCRIPTION_YEAR_MONTH_DAY_ENABLE
    if (days / 365 > 0) {
        messageStr = [NSString stringWithFormat:@"%d年前", days / 365];
    } else if (days / 30 > 0) {
        messageStr = [NSString stringWithFormat:@"%d个月前", days / 30];
    } else if (days > 0) {
        messageStr = [NSString stringWithFormat:@"%d天前", days];
    } else
#else /* DATE_DESCRIPTION_YEAR_MONTH_DAY_ENABLE */
        if (days > 0) {
            messageStr = [self toStringDisplay];
        } else
#endif /* DATE_DESCRIPTION_YEAR_MONTH_DAY_ENABLE */
            if (hours > 0) {
                messageStr = [NSString stringWithFormat:@"%ld小时前", hours];
            } else if (mins > 0) {
                messageStr = [NSString stringWithFormat:@"%ld分钟前", mins];
            } else {
                messageStr = [NSString stringWithFormat:@"1分钟内"];
            }
    
    return messageStr;
}
- (NSString *)toDurationString {
    return [self toDurationStringWithReferenceDate:[NSDate date]];
}
- (NSString *)toIMDurationStringWithReferenceDate:(NSDate *)referenceDate {
    NSString *messageStr = nil;
    NSInteger daysInterval = [referenceDate daysIntervalFromDate:self];
    if (daysInterval < 1) {
        //当天
        messageStr = [self toStringToday];
    } else if (daysInterval == 1) {
        //第二天
        messageStr = [self toStringToday];
        messageStr = [NSString stringWithFormat:@"昨天 %@", messageStr];
    } else if (daysInterval <= 6) {
        //7天之内
        messageStr = [self toStringThisWeek];
    } else {
        //超过7天
        messageStr = [self toStringDisplay];
    }
    return messageStr;
}
- (NSString *)toIMDurationString {
    return [self toIMDurationStringWithReferenceDate:[NSDate date]];
}

- (BOOL)isValidDate
{
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    NSTimeInterval tenYears = 60 * 60 * 365 * 10;
    BOOL result = YES;
    if (timeInterval < tenYears)
    {
        result = NO;
    }
    return result;
}
- (BOOL)isSameDateWithDate:(NSDate *)date
{
    BOOL isSame = NO;
    if (date && [date isKindOfClass:[NSDate class]])
    {
        NSDateComponents *selfComponent = nil;
        NSDateComponents *dateComponent = nil;
        NSCalendar *calendar = [NSCalendar currentCalendar];
        selfComponent = [calendar components:NSCalendarUnitYear fromDate:self];
        dateComponent = [calendar components:NSCalendarUnitYear fromDate:date];
        if ([selfComponent year] == [dateComponent year])
        {
            selfComponent = [calendar components:NSCalendarUnitMonth fromDate:self];
            dateComponent = [calendar components:NSCalendarUnitMonth fromDate:date];
            if ([selfComponent month] == [dateComponent month])
            {
                selfComponent = [calendar components:NSCalendarUnitDay fromDate:self];
                dateComponent = [calendar components:NSCalendarUnitDay fromDate:date];
                if ([selfComponent day] == [dateComponent day])
                {
                    isSame = YES;
                }
            }
        }
    }
    return isSame;
}

- (NSInteger)daysIntervalFromDate:(NSDate *)fromDate
{
    NSInteger beginDays = 0;
    if (fromDate && NSOrderedAscending == [fromDate compare:self]) {
        
        NSDate *inBegin = fromDate;
        NSDate *inEnd = self;
        
        NSInteger unitFlags = NSCalendarUnitDay| NSCalendarUnitMonth | NSCalendarUnitYear;
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [cal components:unitFlags fromDate:inBegin];
        NSDate *newBegin  = [cal dateFromComponents:comps];
        
        NSCalendar *cal2 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps2 = [cal2 components:unitFlags fromDate:inEnd];
        NSDate *newEnd  = [cal2 dateFromComponents:comps2];
        
        NSTimeInterval interval = [newEnd timeIntervalSinceDate:newBegin];
        beginDays = ((NSInteger)interval)/(3600*24);
    }
    return beginDays;
}

- (NSString *)toJTree
{
    return [self toStringDetail];
}
@end
