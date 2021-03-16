//
//  SYTabbar.h
//  AFNTest
//
//  Created by 谷胜亚 on 2018/5/4.
//  Copyright © 2018年 谷胜亚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYTabbar : UITabBar

/**
 *  向tabbar上添加底部显示的控件
 *
 *  @param normal 非选中状态展示的图片
 *  @param selected 选中状态展示的图片
 *  @param title 展示的标题
 *  @param itemY 是否有超出tabbar上方边界的需求, 如有请输入对应负值
 *  @param clickAction 控件点击事件回调
 *
 */
- (void)addTabbarBtnWithImage:(NSString *)normal selectedImage:(NSString *)selected title:(NSString *)title color:(NSString *)color selectedColor:(NSString *)selectedColor itemY:(CGFloat)itemY clickAction:(void(^)(void))clickAction;

/// 手动控制tabbar上item选择哪个高亮
- (void)setupItemHighlightAtIndex:(NSInteger)index;

- (void)updateTabbarItems:(NSArray *)array;

@end
