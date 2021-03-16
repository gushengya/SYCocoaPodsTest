//
//  SYBaseNavigationController.m
//  AFNTest
//
//  Created by 谷胜亚 on 2017/8/10.
//  Copyright © 2017年 谷胜亚. All rights reserved.
//

#import "SYBaseNavigationController.h"

@interface SYBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SYBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 获取系统自带滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
    
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    // 设置手势代理，拦截手势触发
    pan.delegate = self;
    
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
    
    // 禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)handleNavigationTransition:(UIPanGestureRecognizer *)pan
{
    
}



@end
