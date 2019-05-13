//
//  HZ_ViewControllerGuideManager.m
//  HZGuideView
//
//  Created by 何鹏 on 2019/5/13.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import "HZ_ViewControllerGuideManager.h"
#import "HZ_GuideBackgroundView.h"

static NSString * const HL_GroupChatGuideCacheKey = @"HL_GroupChatGuideCacheKey";

@interface HZ_ViewControllerGuideManager()

@property(nonatomic,strong) HZ_GuideBackgroundView *guideBackgroundView;

@property(nonatomic,strong) HZ_GuideView *aBackgroudGudie;

@property(nonatomic,strong) HZ_GuideView *bBackgroudGudie;

@property(nonatomic,strong) HZ_GuideView *cButtonGudie;

@end

@implementation HZ_ViewControllerGuideManager

- (instancetype)init{
    self = [super init];
    if (self) {
        [self guideConfige];
    }
    return self;
}


//-(void)layout{
//
//
//
//    _guideBackgroundView = [[HZ_GuideBackgroundView alloc] initWithCacheKey:@"cacheKey"];
//
//    //    if ([_backgroundView hz_guideIsFrist] == NO) {
//    //        return;
//    //    }
//    /// 设置 [UIApplication sharedApplication].keyWindow 隐藏指定 Class 比如有弹窗
//    [_guideBackgroundView hz_setGuideAppearHiddeWithClass:@[@"Class"] withSuperView:[UIApplication sharedApplication].keyWindow];
//
//    _aBackgroudGudie = [[HZ_GuideView alloc] init];
//    _bBackgroudGudie = [[HZ_GuideView alloc] init];
//    _cButtonGudie = [[HZ_GuideView alloc] init];
//
//    [_guideBackgroundView hz_addGruideView:_aBackgroudGudie];
//    [_guideBackgroundView hz_addGruideView:_bBackgroudGudie];
//    [_guideBackgroundView hz_addGruideView:_cButtonGudie];
//
////    [_aBackgroudGudie hz_addGuideDescribeWithImage:[UIImage imageNamed:@"live"] pointType:HZ_GuideDescribePointCentreUp edge:UIEdgeInsetsMake(0, 0, 0, 18)];
////
////    [self.view addSubview:_backgroundView];
////    [_backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.edges.equalTo(self.view);
////    }];
////
//    [_guideBackgroundView hz_guideAppearHidde];//开启隐藏
//}

-(void)hl_deleteView{
    
    [self.guideBackgroundView hz_jumpBack];
}

-(BOOL)hl_isFristGuide{
    
    //测试可以设置为 YES
    return [self.guideBackgroundView hz_guideIsFrist];
    //            return YES;
}

-(void)hl_updateGuide{
    
    [self.guideBackgroundView hz_update];
}

-(void)guideConfige{
    
    _guideBackgroundView = [[HZ_GuideBackgroundView alloc] initWithCacheKey:HL_GroupChatGuideCacheKey];
    
    if ([self hl_isFristGuide] == NO) {
        return;
    }
    
    /// 设置 [UIApplication sharedApplication].keyWindow 隐藏指定 Class 比如有弹窗
    [_guideBackgroundView hz_setGuideAppearHiddeWithClass:@[@"Class"] withSuperView:[UIApplication sharedApplication].keyWindow];
//    _guideBackgroundView.delegate = self;
//    [_guideBackgroundView hz_jumpButtonWithTitle:@"跳过引导" pointType:HZ_GuideBackgroundJumpPointTopLeft centreEdge:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    // 聊天页面设置按钮引导
    _aBackgroudGudie = [[HZ_GuideView alloc] init];
    _bBackgroudGudie = [[HZ_GuideView alloc] init];
    _cButtonGudie = [[HZ_GuideView alloc] init];
    
    [_guideBackgroundView hz_addGruideView:_aBackgroudGudie];
    [_guideBackgroundView hz_addGruideView:_bBackgroudGudie];
    [_guideBackgroundView hz_addGruideView:_cButtonGudie];
    
}

-(UIView *)guideView{
    
    return _guideBackgroundView;
}

-(void)hz_aBackgroundGudieWithItem:(UIView *)item describeImage:(UIImage *)describeImage{
    
    if ([self hl_isFristGuide] == YES) {//开始指导
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[item convertRect:item.bounds toView:window];
        
        __weak typeof(self) weakSelf = self;
        
//        CGFloat width = 10;
//        rect = CGRectMake(rect.origin.x-(width/2), rect.origin.y-(width/2), rect.size.width+width, rect.size.height+width);
        [_aBackgroudGudie hz_setGuideWihtRect:rect form:HZ_GuideFormTypeRound event:^{
            
            if ([weakSelf.actionDelegate respondsToSelector:@selector(hz_aBackgroundWithAction)]) {
                [weakSelf.actionDelegate hz_aBackgroundWithAction];
            }
        }];
        //[UIImage imageNamed:@"LiveModel_Program_Guide"]
        [_aBackgroudGudie hz_addGuideDescribeWithImage:describeImage pointType:HZ_GuideDescribePointCentreLeft edge:UIEdgeInsetsMake(0, 0, 30, 0)];
    }
    
}

-(void)hz_bBackgroundGudieWithItem:(UIView *)item describeImage:(UIImage *)describeImage{
    
    if ([self hl_isFristGuide] == YES) {//开始指导
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[item convertRect:item.bounds toView:window];
        
        __weak typeof(self) weakSelf = self;
        
//        CGFloat width = 10;
//        rect = CGRectMake(rect.origin.x-(width/2), rect.origin.y-(width/2), rect.size.width+width, rect.size.height+width);
        [_bBackgroudGudie hz_setGuideWihtRect:rect form:HZ_GuideFormTypeRectangle event:^{
            
            if ([weakSelf.actionDelegate respondsToSelector:@selector(hz_bBackgroundWithAction)]) {
                [weakSelf.actionDelegate hz_bBackgroundWithAction];
            }
        }];
        //[UIImage imageNamed:@"LiveModel_Program_Guide"]
        [_bBackgroudGudie hz_addGuideDescribeWithImage:describeImage pointType:HZ_GuideDescribePointCentreLeft edge:UIEdgeInsetsMake(0, 0, 30, 0)];
    }
    
}

-(void)hz_cButtonGudieWithItem:(UIView *)item describeImage:(UIImage *)describeImage{
    
    if ([self hl_isFristGuide] == YES) {//开始指导
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[item convertRect:item.bounds toView:window];
        
        __weak typeof(self) weakSelf = self;
        
//        CGFloat width = 10;
//        rect = CGRectMake(rect.origin.x-(width/2), rect.origin.y-(width/2), rect.size.width+width, rect.size.height+width);
        [_cButtonGudie hz_setGuideWihtRect:rect form:HZ_GuideFormTypeRectangle event:^{
            
            if ([weakSelf.actionDelegate respondsToSelector:@selector(hz_cButtonWithAction)]) {
                [weakSelf.actionDelegate hz_cButtonWithAction];
            }
        }];
        //[UIImage imageNamed:@"LiveModel_Program_Guide"]
        [_cButtonGudie hz_addGuideDescribeWithImage:[UIImage imageNamed:@"live"] pointType:HZ_GuideDescribePointCentreUp edge:UIEdgeInsetsMake(0, 0, 0, 18)];
    }
    
}

@end
