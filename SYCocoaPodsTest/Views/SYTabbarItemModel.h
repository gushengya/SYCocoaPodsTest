//
//  SYTabbarItemModel.h
//  Etoubao
//
//  Created by 谷胜亚 on 2019/6/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYTabbarItemModel : NSObject

/// normal图片
@property (nonatomic, copy) NSString *normalURL;
/// select图片
@property (nonatomic, copy) NSString *selectURL;
/// weburl
@property (nonatomic, copy) NSString *webURL;
/// 文字
@property (nonatomic, copy) NSString *title;
/// normal颜色
@property (nonatomic, copy) NSString *normalColor;
/// select颜色
@property (nonatomic, copy) NSString *selectColor;
/// 类名
@property (nonatomic, copy) NSString *className;

@end

NS_ASSUME_NONNULL_END
