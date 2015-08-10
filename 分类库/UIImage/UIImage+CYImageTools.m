/**
 *
 *  FileName：UIImage+CYImageTools.m
 *  Author：cheny
 *  Date：2014-12-29
 *  Desc：UIImage工具类
 *
 */

#import "UIImage+CYImageTools.h"
#import "NSString+CYStringTools.h"

#define CYFont13 [UIFont systemFontOfSize:13]
#define CYMaxSize CGSizeMake(100, 30)
#define CYMargin15 15


@implementation UIImage (CYImageTools)

+ (instancetype)drawWatermark:(UIImage *)image size:(CGSize)size watermarkString:(NSString *)watermarkString
{
    // 开启位图上下文
    UIGraphicsBeginImageContext(size);
    // 获取上下文
    UIGraphicsGetCurrentContext();
    // 向上下文中绘图
    [image drawAtPoint:CGPointZero];

    // 绘制文字水印
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor purpleColor];
    attrs[NSFontAttributeName] = CYFont13;

    CGSize strSize = [watermarkString sizeWithFont:CYFont13 maxSize:CYMaxSize];
    CGPoint point = CGPointMake(size.width - strSize.width - CYMargin15, size.height - strSize.height - CYMargin15);
    [watermarkString drawAtPoint:point withAttributes:attrs];

    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    // 删除位图上下文
    UIGraphicsEndImageContext();
    return img;
}

+ (instancetype)clipCircularImage:(UIImage *)image isShowMargin:(BOOL)isShowMargin margin:(CGFloat)margin marginColor:(UIColor *)color
{
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    CGSize normalSize = CGSizeMake(imageW, imageH);
    CGRect normalRect = CGRectMake(0, 0, imageW, imageH);
    CGSize bigSize = CGSizeMake(imageW + margin * 2, imageH + margin * 2);
    CGRect bigRect = CGRectMake(0, 0, imageW + margin * 2, imageH + margin * 2);
    CGRect clipRect = CGRectMake(margin, margin, imageW, imageH);

    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(isShowMargin ? bigSize : normalSize, NO, 0);

    if (isShowMargin)
    {
        UIBezierPath *bigPath = [UIBezierPath bezierPathWithOvalInRect:bigRect];
        [color set];
        [bigPath fill];
    }
    else
    {
        clipRect = normalRect;
    }

    // 裁剪的正切圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:clipRect];
    [path addClip];
    // 将图片绘制到上下文上去
    [image drawInRect:clipRect];
    // 获得绘制后的图片
    return UIGraphicsGetImageFromCurrentImageContext();
}

@end


