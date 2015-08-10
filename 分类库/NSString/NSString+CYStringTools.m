/**
 *
 *  FileName：NSString+CYStringTools.m
 *  Author：cheny
 *  Date：2014-12-14
 *  Desc：NSString类的分类
 *
 */

#import "NSString+CYStringTools.h"

@implementation NSString (CYStringTools)

#pragma mark - 根据文本获取其占用的空间

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    // 根据文本计算它的宽高
    return [NSString sizeWithString:self font:font maxSize:maxSize];
}

+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize
{
    // 根据文本计算它的宽高
    return [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

#pragma mark - 根据日期字符串计算时间间隔

- (NSString *)getTimespan
{
    return [NSString getTimespanWithDataString:self];
}

+ (NSString *)getTimespanWithDataString:(NSString *)dataString
{
    // 保存计算结果
    NSString *timespan = @"";

    // 格式化oldTime，用于计算它距离1970所经历的秒数
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:kDataFormatString];
    NSDate *oldDate = [formatter dateFromString:dataString];
    NSTimeInterval late = [oldDate timeIntervalSince1970];

    // 获取当前时间
    // 获取当前的小时数
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSInteger era,y,m,d;
    // [cal getHour:&h minute:&m second:&s nanosecond: &ns fromDate:date];
#warning 一个方法，带多个输出参数
    [cal getEra:&era year:&y month:&m day:&d fromDate:date];  // 一个方法，带多个输出参数
    // NSLog(@"era:%zd,y:%zd",era,y);
    NSString *newDate = [NSString stringWithFormat:@"%zd-%zd-%zd 23:59",y,m,d];  // 把今天的时间过完
    date = [formatter dateFromString:newDate];  // 重新赋值
    // 获取今天所经历的秒数
    NSTimeInterval now = [date timeIntervalSince1970];

    NSTimeInterval delta = now - late; // 计算时间差

    CGFloat interval4Hour = kMinute_60 * kSecond_60;

#warning 一定要注意括号的使用！！！
    // 小于1小时
    if (delta / (1 * interval4Hour) < 1) {
        timespan = [NSString stringWithFormat:@"%f",delta / kMinute_60];
        // timespan = [timespan substringFromIndex:timespan.length-7];
        timespan = [NSString stringWithFormat:@"%d分钟前",[timespan intValue]];
    }
    // 今天
    else if (delta / (1 * interval4Hour) > 1 && delta / (24 * interval4Hour) < 1) {
        NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
        [dataFormatter setDateFormat:kTimeFormatString];
        timespan = [NSString stringWithFormat:@"今天%@",[dataFormatter stringFromDate:oldDate]];
    }
    // 昨天
    else if (delta / (24 * interval4Hour) > 1 && delta / (2 * 24 * interval4Hour) < 1)
    {
        NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
        [dataFormatter setDateFormat:kTimeFormatString];
        timespan = [NSString stringWithFormat:@"昨天%@",[dataFormatter stringFromDate:oldDate]];
    }
    else
    {
        NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
        [dataFormatter setDateFormat:kDataFormatString];
        timespan = [NSString stringWithFormat:@"%@",[dataFormatter stringFromDate:oldDate]];
    }

    return timespan;
}


@end


