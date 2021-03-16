//
//  SYViewControllerC.m
//  SYCocoaPodsTestDemo
//
//  Created by 谷胜亚 on 2021/3/11.
//  Copyright © 2021 谷胜亚. All rights reserved.
//

#import "SYViewControllerC.h"

@interface SYViewControllerC ()

@end

@implementation SYViewControllerC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick
{
    
    [self dismissViewControllerAnimated:YES completion:nil];

}




@end
