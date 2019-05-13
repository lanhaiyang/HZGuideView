//
//  HZ_GuideBackgroundView.h
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/2.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZ_GuideView.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    HZ_GuideBackgroundJumpPointTopLeft,//头部左边
    HZ_GuideBackgroundJumpPointTopRight,//头部右边
    HZ_GuideBackgroundJumpPointBottomLeft,//底部左边
    HZ_GuideBackgroundJumpPointBottomRight//底部右边
} HZ_GuideBackgroundJumpPointType;

@protocol HZ_GuideBackgroundViewDelegate  <NSObject>

@optional


/**
 点击跳过
 */
-(void)hz_guideWithActionJumpBack;


/**
 点击空白区域
 */
-(void)hz_guideWithActionBlankZone;

@end

@interface HZ_GuideBackgroundView : UIView

@property(nonatomic,weak) id<HZ_GuideBackgroundViewDelegate> delegate;


/**
 调整 跳过button位置

 @param title 标题
 @param pointType 位置
 @param centreEdge 中心偏移量
 */
-(void)hz_jumpButtonWithTitle:(NSString *)title
                    pointType:(HZ_GuideBackgroundJumpPointType)pointType
                   centreEdge:(UIEdgeInsets)centreEdge;


/**
 当前引导页是否是第一次
 
 @return YES 是
 */
-(BOOL)hz_guideIsFrist;



/**
 创建引导view
 
 @param cacheKey 缓存 是否第一次 使用
 @return 当前 HZ_GuideBackgroundView 对象
 */
-(instancetype)initWithCacheKey:(NSString *)cacheKey;



/**
 设置隐藏指定的view
 
 会保存起来 hz_guideAppearHidde 调用这个方法会隐藏指定class

 @param opertionClass 指定的class
 @param superView 放在哪个view上
 */
-(void)hz_setGuideAppearHiddeWithClass:(NSArray<NSString *> *)opertionClass withSuperView:(UIView *)superView;


/**
 隐藏指定的view
 */
-(void)hz_guideAppearHidde;


/**
 添加指导模块
 
 @param guideView 指导模板
 */
-(void)hz_addGruideView:(HZ_GuideView *)guideView;


/**
 更新模板位置
 */
-(void)hz_update;



/**
 跳过
 */
-(void)hz_jumpBack;

@end

NS_ASSUME_NONNULL_END
