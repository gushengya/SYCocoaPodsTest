//
//  SYTabbarBtn.m
//  AFNTest
//
//  Created by 谷胜亚 on 2017/5/9.
//  Copyright © 2017年 谷胜亚. All rights reserved.
//

#import "SYTabbarBtn.h"
#import "UIColor+SYAdd.h"
@implementation SYTabbarBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1. 设置高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        // 2. 设置文本框的文字颜色
        [self setTitleColor:[UIColor colorWithHexString:@"0x666666"] forState:UIControlStateNormal]; // 普通状态文字颜色
        [self setTitleColor:[UIColor colorWithHexString:@"0xe64c65"] forState:UIControlStateSelected]; // 选中状态文字颜色
        // 3. 设置文本框文字字体
        self.tintColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:10];
        // 4. 设置文本框文字对齐方式
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 5. 设置图片框内容mode
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    
    return self;
}


- (void)setHighlighted:(BOOL)highlighted
{
    
}

/**布局调整*/
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect titleRect = [super titleRectForContentRect:contentRect];
    if (titleRect.size.width == 0) {
        return [super imageRectForContentRect:contentRect];
    }
    
    /**自己调整图片大小吧 -_- */
    CGFloat height = (self.bounds.size.height - 10 - 5 - 2) / 3 * 2;
    CGFloat width = height;
    CGFloat x = (self.bounds.size.width - width)/2;
    CGFloat y = 10;
    return CGRectMake(x, y, width, height);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    /**自己调整 -_- */
    CGFloat height = (self.bounds.size.height - 10 - 5 - 2) / 3;
    CGFloat width = contentRect.size.width;
    
    CGFloat x = (self.bounds.size.width - width)/2;
    CGFloat y = self.bounds.size.height - 5 - height;
    return CGRectMake(x, y, width, height);
}






@end










