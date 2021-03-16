//
//  UIColor+Extension.m
//  AFNTest
//
//  Created by 谷胜亚 on 2017/5/4.
//  Copyright © 2017年 谷胜亚. All rights reserved.
//

#import "UIColor+SYAdd.h"

@implementation UIColor (SYExtension)
#pragma mark ======新增属性=======
- (CGFloat)redValue
{
    CGFloat r = 0, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return r;
}

- (CGFloat)greenValue
{
    CGFloat r, g = 0, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return g;
}

- (CGFloat)blueValue
{
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return b;
}

- (CGFloat)alphaValue
{
    CGFloat r, g, b, a = 0;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return a;
}

#pragma mark- <-----------  根据颜色获得图片  ----------->
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 设置画布的大小
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    // 开启上下文
    UIGraphicsBeginImageContext(rect.size);

    // 获得当前上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    // 设置填充色
    CGContextSetFillColorWithColor(ref, color.CGColor);
    
    // 设置填充rect
    CGContextFillRect(ref, rect);
    
    // 从上下文获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 返回获得的图片
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    // 设置画布的大小
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    // 开启上下文
    UIGraphicsBeginImageContext(size);
    
    // 获得当前上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    // 设置填充色
    CGContextSetFillColorWithColor(ref, color.CGColor);
    
    // 设置填充rect
    CGContextFillRect(ref, rect);
    
    // 从上下文获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillPath(context);
    CGContextMoveToPoint(context, cornerRadius, 0); // (r, 0)
    CGContextAddArc(context, cornerRadius, cornerRadius, cornerRadius, -M_PI_2, M_PI, 1);
    CGContextAddLineToPoint(context, 0, size.height - cornerRadius);
    CGContextAddArc(context, cornerRadius, size.height - cornerRadius, cornerRadius, M_PI, M_PI_2, 1);
    CGContextAddLineToPoint(ref, size.width - cornerRadius, size.height);
    CGContextAddArc(context, size.width - cornerRadius, size.height - cornerRadius, cornerRadius, M_PI_2, 0, 1);
    CGContextAddLineToPoint(ref, size.width, cornerRadius);
    CGContextAddArc(context, size.width - cornerRadius, cornerRadius, cornerRadius, 0, -M_PI_2, 1);
    CGContextAddLineToPoint(context, cornerRadius, 0);
    CGContextClosePath(context);
    CGContextClip(context);
    [image drawInRect:rect];
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

#pragma mark- <-----------  获得颜色  ----------->
/**
 *  根据传入的十六进制RGB数获得对应颜色
 *
 *  @param number 十六进制数 例: 0x999999
 *
 *  @return 对应的颜色
 */
+ (UIColor *)colorWithHexNumber:(NSUInteger)number
{
    return [self colorWithHexNumber:number alpha:1.0];
}


/**
 *  根据传入的十六进制RGB数以及对应透明度获得对应颜色
 *
 *  @param number 十六进制数 例: 0x999999
 *
 *  @param alpha 透明度(0.0~1.0)
 *
 *  @return 对应的颜色
 */
+ (UIColor *)colorWithHexNumber:(NSUInteger)number alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((number & 0xFF0000) >> 16) / 255.0f
                           green:((number & 0xFF00) >> 8) / 255.0f
                            blue:(number & 0xFF) / 255.0f
                           alpha:alpha];
}


/**
 *  根据传入的十六进制RGB字符串获得对应颜色
 *
 *  @param str 十六进制数 例: @"0x999999"
 *
 *  @return 对应的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)str
{
    return [self colorWithHexString:str alpha:1.0f];
}


/**
 *  根据传入的十六进制RGB字符串以及对应透明度获得对应颜色
 *
 *  @param str 十六进制数 例: @"0x999999"
 *
 *  @param alpha 透明度(0.0~1.0)
 *
 *  @return 对应的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)str alpha:(CGFloat)alpha
{
    NSUInteger length = str.length - 1;
    //	if (length != 3 && length != 6 ) return [UIColor clearColor];
    if (length != 6 ) return [UIColor clearColor];
    if ([str characterAtIndex:0] != '#') return [UIColor clearColor];
    int color;
    sscanf([str UTF8String], "#%x", &color);
    return [UIColor colorWithHexNumber:color alpha:alpha];
}

/**
 *  随机颜色
 *
 *  @return 随机色
 */
+ (UIColor *)randomColor
{
    return [self randomColorWithAlpha:1.0f];
}

/**
 *  对应透明度的随机色
 *
 *  @param alpha 透明度
 *
 *  @return 随机色
 */
+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha
{
    BOOL fakeRandom = NO; // 是否假随机
    if (fakeRandom) {
        return [UIColor colorWithRed:rand()%255/255.f green:rand()%255/255.f blue:rand()%255/255.f alpha:alpha]; // 生成一个随机种子,再次调用不会重新随机
    }
    else {
        return [UIColor colorWithRed:arc4random()%255/255.f green:arc4random()%255/255.f blue:arc4random()%255/255.f alpha:alpha]; // 随机的更精准,每次调用都会随机
    }
}


#pragma mark =======实用小功能========
/**
 *  可以更改状态栏的背景颜色 -- 但是在同一个应用中跳转页面不会恢复原来颜色 -- 需要再次调用该方法进行相应更改
 *
 *  @param color 更改的颜色
 */
+ (void)changeStatusBarBackgroundColorToColor:(UIColor *)color
{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
    {
        statusBar.backgroundColor = color;
    }
}

@end
