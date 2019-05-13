//
//  HZ_ViewControllerGuideManager.h
//  HZGuideView
//
//  Created by 何鹏 on 2019/5/13.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HZ_GuideActionDelegate  <NSObject>

 @optional

-(void)hz_aBackgroundWithAction;

-(void)hz_bBackgroundWithAction;

-(void)hz_cButtonWithAction;

@end

@interface HZ_ViewControllerGuideManager : NSObject

@property(nonatomic,weak) id<HZ_GuideActionDelegate> actionDelegate;

/**
 指导的背景
 */
@property(nonatomic,strong,readonly) UIView *guideView;

/**
 是否第一次 引导
 
 @return YES 第一次引导
 */
-(BOOL)hl_isFristGuide;


/**
 更新引导布局
 */
-(void)hl_updateGuide;

/**
 删除引导
 */
-(void)hl_deleteView;

/**
 引导设置
 
 @param item  引导位置
 @param describeImage 指导描述内容
 */
-(void)hz_aBackgroundGudieWithItem:(UIView *)item describeImage:(UIImage *)describeImage;

-(void)hz_bBackgroundGudieWithItem:(UIView *)item describeImage:(UIImage *)describeImage;

-(void)hz_cButtonGudieWithItem:(UIView *)item describeImage:(UIImage *)describeImage;

@end

NS_ASSUME_NONNULL_END
