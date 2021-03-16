//
//  UIColor+Extension.h
//  AFNTest
//
//  Created by 谷胜亚 on 2017/5/4.
//  Copyright © 2017年 谷胜亚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SYExtension)
#pragma mark ======新增属性=======
@property (nonatomic, readonly) CGFloat redValue;
@property (nonatomic, readonly) CGFloat greenValue;
@property (nonatomic, readonly) CGFloat blueValue;
@property (nonatomic, readonly) CGFloat alphaValue;


#pragma mark =====根据十六进制数 例: 0xffffff 来获得对应RGB颜色=====
/**
 *  根据传入的十六进制RGB数获得对应颜色
 *
 *  @param number 十六进制数 例: 0x999999
 *
 *  @return 对应的颜色
 */
+ (UIColor *)colorWithHexNumber:(NSUInteger)number;


/**
 *  根据传入的十六进制RGB数以及对应透明度获得对应颜色
 *
 *  @param number 十六进制数 例: 0x999999
 *
 *  @param alpha 透明度(0.0~1.0)
 *
 *  @return 对应的颜色
 */
+ (UIColor *)colorWithHexNumber:(NSUInteger)number alpha:(CGFloat)alpha;

/**
 *  根据传入的十六进制RGB字符串获得对应颜色
 *
 *  @param str 十六进制数 例: @"0x999999"
 *
 *  @return 对应的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)str;


/**
 *  根据传入的十六进制RGB字符串以及对应透明度获得对应颜色
 *
 *  @param str 十六进制数 例: @"0x999999"
 *
 *  @param alpha 透明度(0.0~1.0)
 *
 *  @return 对应的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)str alpha:(CGFloat)alpha;

#pragma mark =============随机色===============
/**
 *  随机颜色
 *
 *  @return 随机色
 */
+ (UIColor *)randomColor;

/**
 *  对应透明度的随机色
 *
 *  @param alpha 透明度
 *
 *  @return 随机色
 */
+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha;

#pragma mark =======实用小功能========
/**
 *  可以更改状态栏的背景颜色 -- 但是在同一个应用中跳转页面不会恢复原来颜色 -- 需要再次调用该方法进行相应更改
 *
 *  @param color 更改的颜色
 */
+ (void)changeStatusBarBackgroundColorToColor:(UIColor *)color;

#pragma mark- <-----------  根据颜色获得图片  ----------->
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
@end
