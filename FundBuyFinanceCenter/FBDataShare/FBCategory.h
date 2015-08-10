//
//  FBCategory.h
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/7.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

@interface UIView (DXUIBackGroundView)
- (void)addDXUIBackGroundView;
@end
@interface UIButton (UIButtonImageWithLable)
- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType;
- (void) setTitle:(NSString *)title withImage:(UIImage *)image forState:(UIControlState)stateType;
@end
@interface NSDictionary (NSDictionaryEqualNull)
-(BOOL)isValueForKey:(NSString *)key;
@end
@interface NSString (NSStringEqualNull)
- (BOOL)isBlankString;
@end
@interface NSNull (JSON)
@end
@interface MTLModel (KTVNullableScalar)
@end

@interface NSDate(FBDate)
- (NSString *)toString; /* String as: @"2011-01-01"; */
- (NSString *)toStringTimeOnly; //18:30
- (NSString *)toFolderString; //yyyy/mm/dd/hh
- (NSString *)toRandomFilenameString; //HH_mm_ss_SSS
- (NSString *)toStringYearMonthDay; /* String as: @"2011年01月01日"; */
- (NSString *)toChineseString;
- (NSString *)toStringOnly; //"yyyy.MM.dd";
- (NSString *)toStringDetail; /* String as: @"2011-01-01T00:00:00+08:00"; */
- (NSString *)toStringCreditDatetime;//YYMM
- (NSString *)toStringCreditDateDisplay;//String as: @"YY/MM"
- (NSString *)toStringDisplay; /* String as @"2011-01-01 00:00" */
- (NSString *)toStringFullDisplay; /* String as @"2011-01-01 00:00:00" */
- (NSString *)toStringToday;
- (NSString *)toStringDateAndTimeDisplay;
- (NSString *)createdAt;
+ (NSString *)generateUniqueID; /* String as @"yyyyMMddHHmmss" */
+ (NSInteger)currentYearNumber;
- (NSString *)toDurationStringWithReferenceDate:(NSDate *)referenceDate;
- (NSString *)toDurationString; /* 返回距离当前的时间字符串 */
- (NSString *)toIMDurationString;
- (BOOL)isValidDate; /* 1970～1980数据为错误 */
- (BOOL)isSameDateWithDate:(NSDate *)date; /* 比较两个日期是否为同一天 */
- (NSInteger)daysIntervalFromDate:(NSDate *)fromDate; //从某天到某天的间隔日期数
- (NSString *)toJTree; /* 同[self toStringDetail] */
@end