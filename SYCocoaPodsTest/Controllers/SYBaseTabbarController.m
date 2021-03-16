//
//  SYBaseTabbarController.m
//  AFNTest
//
//  Created by 谷胜亚 on 2017/5/9.
//  Copyright © 2017年 谷胜亚. All rights reserved.
//

#import "SYBaseTabbarController.h"
#import "SYTabbar.h"

#import "SYViewControllerA.h"
#import "SYViewControllerB.h"
#import "SYViewControllerC.h"
#import "SYViewControllerD.h"
#import "SYViewControllerE.h"

@interface SYBaseTabbarController ()

@end

@implementation SYBaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetTabBar];
}

/**自定义tabBar*/
-(void)resetTabBar
{
    SYTabbar *tabbar = [[SYTabbar alloc] init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    // 6. 设置tabbar上显示的普通item信息
    [tabbar addTabbarBtnWithImage:@"home_normal" selectedImage:@"home_selected" title:@"第一页" color:@"#999999" selectedColor:@"#999999" itemY:0 clickAction:^{
        self.selectedIndex = 0;
    }];
    [tabbar addTabbarBtnWithImage:@"course_normal" selectedImage:@"course_selected" title:@"第二页" color:@"#999999" selectedColor:@"#999999" itemY:0 clickAction:^{
        self.selectedIndex = 1;
    }];
    [tabbar addTabbarBtnWithImage:@"add_normal" selectedImage:@"add_normal" title:@"" color:@"#999999" selectedColor:@"#999999" itemY:-10 clickAction:^{
        SYViewControllerC *fifth = [[SYViewControllerC alloc] init];
        fifth.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:fifth animated:YES completion:nil];
    }];
    [tabbar addTabbarBtnWithImage:@"task_normal" selectedImage:@"task_selected" title:@"第三页" color:@"#999999" selectedColor:@"#999999" itemY:0 clickAction:^{
        self.selectedIndex = 2;
    }];
    [tabbar addTabbarBtnWithImage:@"community_normal" selectedImage:@"community_selected" title:@"第四页" color:@"#999999" selectedColor:@"#999999" itemY:0 clickAction:^{
        self.selectedIndex = 3;
    }];
#warning 必须tabbar上普通item的数量与添加到viewControllers的子控制器数量相等
    // 7. 设置对应数量的子控制器 -- 数量必须与tabbar上数量相同
    SYViewControllerA *first = [[SYViewControllerA alloc] init];
    SYViewControllerB *second = [[SYViewControllerB alloc] init];
    SYViewControllerD *third = [[SYViewControllerD alloc] init];
    SYViewControllerE *fourth = [[SYViewControllerE alloc] init];
    self.viewControllers = @[first, second, third, fourth];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tabBar.barTintColor = [UIColor whiteColor];
    // 分页控制条的背景图片与barTintColor(背景颜色)冲突，只需要设置这一个属性就可以了
    
    
    
//    for (UIView *child in self.tabBar.subviews) {
////        NSString *class = NSStringFromClass(child.class);
////        if ([class isEqualToString:@"_UIBarBackground"]) {
////            for (UIView *subView in child.subviews) {
////                if (![subView isEqual:child.subviews.firstObject]) {
////                    [subView removeFromSuperview];
////                    class = NSStringFromClass(subView.class);
////                    [child setValue:nil forKeyPath:class];
////                }
////            }
////        }
//        if ([child isKindOfClass:[UIControl class]]) {
//            if ([child isKindOfClass:[UIButton class]]) {
//                continue;
//            }
//            [child removeFromSuperview];
//        }
//    }
}



@end
