//
//  HZGuideView.h
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/1.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZ_GuideBaseView.h"


typedef NS_ENUM(NSInteger, HZ_GuideDescribePoint) {
    HZ_GuideDescribePointCentreUp = 0, //上面中心
    HZ_GuideDescribePointCentreDown,// 下面中心
    HZ_GuideDescribePointCentreLeft, //左边中心
    HZ_GuideDescribePointCentreRright //右边中心
};


NS_ASSUME_NONNULL_BEGIN

@interface HZ_GuideView : HZ_GuideBaseView


/**
 事件响应view
 */
@property(nonatomic,weak,readonly) UIView *eventView;


@property(nonatomic,strong,readonly) void(^eventBlock)(void);

-(void)hz_updateView;

/**
 设置指定的位置
 
 @param guideRect 指定位置
 @param form 形状
 @param eventBlock 先用的事件
 */
-(void)hz_setGuideWihtRect:(CGRect )guideRect form:(HZ_GuideFormType)form event:(void(^)(void))eventBlock;


/**
 设置指定的位置(废弃)
 
 @param guideRect 指定位置
 @param form 形状
 @param eventView 事件穿透 使用
 */
//-(void)hz_setGuideWihtRect:(CGRect )guideRect form:(HZ_GuideFormType)form eventView:(UIView *)eventView;



/**
 添加指导描述
 
 @param guideDescribe 摘掉描述imageView
 @param pointType 指导的位置
 @param edge 以图片为中心的偏移
 */
-(void)hz_addGuideDescribeWithImage:(UIImage *)guideDescribe pointType:(HZ_GuideDescribePoint)pointType edge:(UIEdgeInsets)edge;

@end

NS_ASSUME_NONNULL_END
