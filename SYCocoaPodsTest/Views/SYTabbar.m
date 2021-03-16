//
//  SYTabbar.m
//  AFNTest
//
//  Created by 谷胜亚 on 2018/5/4.
//  Copyright © 2018年 谷胜亚. All rights reserved.
//

#import "SYTabbar.h"
#import "SYTabbarBtn.h"
#import "UIButton+WebCache.h"
#import "UIColor+SYAdd.h"
#import "SYTabbarItemModel.h"

#define imageOfBundle(path) [UIImage imageWithContentsOfFile:[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"SYImageBundle" ofType:@"bundle"]] pathForResource:path ofType:@"png"]]
@interface GZTabbarItem: NSObject

@property (nonatomic, strong) SYTabbarBtn *tabbarBtn;

@property (nonatomic, assign) CGFloat itemY;

@property (nonatomic, copy) void(^clickCallback)(void);

@end

@implementation GZTabbarItem

@end

@interface SYTabbar()
{
    UIButton *_currentSelectedBtn; // 当前选定的按钮
    
    GZTabbarItem *_selectedItem;
}

@property (nonatomic, strong) NSMutableArray *itemArray;

@end

@implementation SYTabbar

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 分页控制条的背景图片与barTintColor(背景颜色)冲突(且设置了该值其他值就无效了)，只需要设置这一个属性就可以了
        // 当设置了该值后_UIBarBackground属性中就只剩了分页条上侧分割线图片框和背景图片框了
        self.backgroundImage = [UIColor imageWithColor:[UIColor colorWithHexString:@"#ffffff"]];
        self.shadowImage = [UIColor imageWithColor:[UIColor colorWithHexString:@"#f2f2f2"]];
    }
    
    return self;
}

- (void)addTabbarBtnWithImage:(NSString *)normal selectedImage:(NSString *)selected title:(NSString *)title color:(NSString *)color selectedColor:(NSString *)selectedColor itemY:(CGFloat)itemY clickAction:(void(^)(void))clickAction
{
    // 0. item对象
    GZTabbarItem *item = [[GZTabbarItem alloc] init];
    item.itemY = itemY;
    item.clickCallback = clickAction;
    
    // 1. 创建自定义btn
    SYTabbarBtn *btn = [[SYTabbarBtn alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width / 5), 49)];
    // 2. 设置按钮的一些属性
    if (itemY == 0)
    {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateSelected];
     
        // 3. 设置文本框的文字颜色
        [btn setTitleColor:[UIColor colorWithHexString:color] forState:UIControlStateNormal]; // 普通状态文字颜色
        [btn setTitleColor:[UIColor colorWithHexString:selectedColor] forState:UIControlStateSelected]; // 选中状态文字颜色
    }
    
    if ([normal hasPrefix:@"http"])
    {
        [btn sd_setImageWithURL:[NSURL URLWithString:normal] forState:UIControlStateNormal placeholderImage:nil];
        [btn sd_setImageWithURL:[NSURL URLWithString:selected] forState:UIControlStateSelected placeholderImage:nil];
    }
    else
    {
        NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"SYImageBundle" ofType:@"bundle"]];
        UIImage *normalImg = [UIImage imageNamed:normal inBundle:bundle compatibleWithTraitCollection:nil];
        UIImage *selectedImg = [UIImage imageNamed:selected inBundle:bundle compatibleWithTraitCollection:nil];
        [btn setImage:[normalImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [btn setImage:[selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    }
    
    btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    item.tabbarBtn = btn;
    
    if (!_selectedItem) {
        _selectedItem = item;
        _selectedItem.tabbarBtn.selected = YES;
    }
    
    // 3. 把该按钮添加到持有数组中
    [self.itemArray addObject:item];
    // 4. 把该按钮添加到tabbar上
    [self addSubview:btn];
}

- (void)updateTabbarItems:(NSArray *)array
{
    for (GZTabbarItem *item in self.itemArray)
    {
        // 当前4个加上大加好, array也需要4个才行
        if (item.itemY != 0)
        {
            if (array.count != 4) return;
        }
        else
        {
            if (array.count != 5) return;
        }
    }
    
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    for (int i = 0; i < array.count; i++)
    {
        if (i > self.itemArray.count - 1) return;
        GZTabbarItem *item = self.itemArray[i];
        SYTabbarItemModel *model = array[i];
        SYTabbarBtn *btn = item.tabbarBtn;
        [btn setTitle:model.title forState:UIControlStateNormal];
        [btn setTitle:model.title forState:UIControlStateSelected];
        
        if (version >= 13.0)
        {
            [btn sd_setImageWithURL:[NSURL URLWithString:model.normalURL] forState:UIControlStateNormal completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                if (image)
                {
                    image = [UIImage imageWithCGImage:image.CGImage scale:2 orientation:UIImageOrientationUp];
                    [btn setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
                }
            }];
            [btn sd_setImageWithURL:[NSURL URLWithString:model.selectURL] forState:UIControlStateSelected completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                if (image)
                {
                    image = [UIImage imageWithCGImage:image.CGImage scale:2 orientation:UIImageOrientationUp];
                    [btn setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
                }
            }];
        }
        else
        {
            [btn sd_setImageWithURL:[NSURL URLWithString:model.normalURL] forState:UIControlStateNormal placeholderImage:nil];
            [btn sd_setImageWithURL:[NSURL URLWithString:model.selectURL] forState:UIControlStateSelected placeholderImage:nil];
        }

        [btn setTitleColor:[UIColor colorWithHexString:model.normalColor] forState:UIControlStateNormal]; // 普通状态文字颜色
        [btn setTitleColor:[UIColor colorWithHexString:model.selectColor] forState:UIControlStateSelected]; // 选中状态文字颜色
    }
}

// 重写子控件布局方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1. 移除系统自动创建的tabbarButton
    for (UIView *child in self.subviews)
    {
        if ([child isKindOfClass:[UIControl class]])
        {
            if ([child isKindOfClass:[SYTabbarBtn class]]) continue;
            [child removeFromSuperview];
        }
    }

    // 2. tabbar的size
    CGSize tabSize = self.bounds.size;
    
    // 3. 判断数组中是否有数据
    if (self.itemArray.count == 0) return;
    
    CGFloat averageW = tabSize.width / self.itemArray.count;
    
    // 4. 遍历数组中的对象从而布局frame
    for (int i = 0; i < self.itemArray.count; i++)
    {
        // 按钮获取
        GZTabbarItem *item = self.itemArray[i];
        SYTabbarBtn *btn = item.tabbarBtn;
        btn.tag = i;
        
        btn.frame = CGRectMake(i * averageW, item.itemY, averageW, 49 - item.itemY);
        [btn addTarget:self action:@selector(tabbarItemClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)tabbarItemClickAction:(SYTabbarBtn *)btn
{
    // 判断点击的是否是已选中
    if (btn.isSelected) return;
    
    GZTabbarItem *item = self.itemArray[btn.tag];
    
    // 回调点击事件
    if (item.clickCallback) {
        item.clickCallback();
    }
    
    // 切换选中效果
    if (item.itemY != 0) return;
    
    _selectedItem.tabbarBtn.selected = NO;
    _selectedItem = item;
    _selectedItem.tabbarBtn.selected = YES;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.hidden) {
        //tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }

    //将当前tabbar的触摸点转换坐标系，转换到中间按钮的身上，生成一个新的点
    for (GZTabbarItem *item in self.itemArray) {
        if (item.itemY == 0) continue;
        CGPoint convertPoint = [self convertPoint:point toView:item.tabbarBtn];
        if ([item.tabbarBtn pointInside:convertPoint withEvent:event]) {
            return item.tabbarBtn;
        }
    }

    //如果点不在中间按钮身上，直接让系统处理就可以了
    return [super hitTest:point withEvent:event];
}

- (NSMutableArray *)itemArray
{
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    
    return _itemArray;
}

/// 手动控制tabbar上item选择哪个高亮
- (void)setupItemHighlightAtIndex:(NSInteger)index
{
    if (index == 1) return; // 表示大加号
    
    if (index > self.itemArray.count - 1) return;
    
    GZTabbarItem *item = self.itemArray[index];
    
    if ([item isEqual:_selectedItem]) return;
    
    _selectedItem.tabbarBtn.selected = NO;
    item.tabbarBtn.selected = YES;
    _selectedItem = item;
}

@end




