/**
 *
 *  FileName：NSString+CYStringTools.h
 *  Author：cheny
 *  Date：2014-12-14
 *  Desc：NSString类的分类
 *
 */

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

#define kSecond_60 60  // 60秒
#define kMinute_60 60 // 60分钟
#define kDataFormatString @"yyyy-MM-dd HH:mm"
#define kTimeFormatString @"HH:mm"

@interface NSString (CYStringTools)

#pragma mark - 根据文本获取其占用的空间

/** 计算文本的Size */
- (CGSize) sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/** 计算文本的Size */
+ (CGSize) sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize;


#pragma mark - 根据日期字符串计算时间间隔

/** 根据日期字符串计算时间间隔 */
- (NSString *)getTimespan;

/** 根据日期字符串计算时间间隔 */
+ (NSString *) getTimespanWithDataString:(NSString *)dataString;

@end
