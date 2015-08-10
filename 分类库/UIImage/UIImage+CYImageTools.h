/**
 *
 *  FileName：UIImage+CYImageTools.h
 *  Author：cheny
 *  Date：2014-12-29
 *  Desc：UIImage工具类
 *
 */

#import <UIKit/UIKit.h>

@interface UIImage (CYImageTools)

/**
 *  在图片上绘制文字水印
 *
 *  @param image        待操作的图片
 *  @param size         显示图片的大小
 *  @param watermarkString 水印文字
 *
 *  @return 返回输出带水印的图片
 */
+ (instancetype) drawWatermark:(UIImage *)image size:(CGSize)size watermarkString:(NSString *)watermarkString;

/**
 *  把图片裁剪成圆形
 *
 *  @param image        待操作的图片
 *  @param isShowMargin 是否显示边框
 *  @param margin       边框间距
 *  @param color        间距显示的颜色
 *
 *  @return 返回裁剪后的图片
 */
+ (instancetype) clipCircularImage:(UIImage *)image isShowMargin:(BOOL)isShowMargin margin:(CGFloat)margin marginColor:(UIColor *)color;

@end
