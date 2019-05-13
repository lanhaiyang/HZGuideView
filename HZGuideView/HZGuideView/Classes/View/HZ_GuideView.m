//
//  HZGuideView.m
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/1.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import "HZ_GuideView.h"
#import "HZ_GuideViewModel.h"


typedef NS_ENUM(NSInteger, HWGuidePageType) {
    HWGuidePageTypeHome = 0,
    HWGuidePageTypeMajor,
};

@interface HZ_GuideView()

@property (nonatomic, copy) NSString *guidePageKey;

@property(nonatomic,assign) CGRect guideRect;

@property(nonatomic,assign) HZ_GuideFormType form;

@property(nonatomic,strong) HZ_GuideView *guideView;

@property(nonatomic,strong) HZ_GuideViewModel *guideViewModel;

@property(nonatomic,strong) UIImage *guideDescribe;

@property(nonatomic,assign) HZ_GuideDescribePoint pointType;

@end

@implementation HZ_GuideView

- (instancetype)init{
    
    if (self = [super init]) {
        
    }
    return self;
}

-(void)hz_updateView{
    [super creatControlWithType:_form frame:_guideRect];
    
    self.guideImageView.image = _guideDescribe;
    
    CGRect pointRect = self.dottedRect;
    if (self.isShowDottedLine == NO) {
        pointRect = self.selectRect;
    }
    
    switch (_pointType) {
        case HZ_GuideDescribePointCentreUp:
        {
            CGRect up = [self.guideViewModel hz_guideCenterUpWithRect:pointRect imageSize:_guideDescribe.size];
            self.guideImageView.frame = up;
        }
            break;
        case HZ_GuideDescribePointCentreDown:
        {
            CGRect down = [self.guideViewModel hz_guideCenterDownWithRect:pointRect imageSize:_guideDescribe.size];
            self.guideImageView.frame = down;
        }
            break;
        case HZ_GuideDescribePointCentreLeft:
        {
            CGRect left = [self.guideViewModel hz_guideCenterLeftWithRect:pointRect imageSize:_guideDescribe.size];
            self.guideImageView.frame = left;
        }
            break;
        case HZ_GuideDescribePointCentreRright:
        {
            CGRect right = [self.guideViewModel hz_guideCenterRightWithRect:pointRect imageSize:_guideDescribe.size];
            self.guideImageView.frame = right;
        }
            break;
        default:
            break;
    }
}

-(void)hz_setGuideWihtRect:(CGRect )guideRect form:(HZ_GuideFormType)form event:(void(^)(void))eventBlock{
    
    _guideRect = guideRect;
    _form = form;
    _eventBlock = eventBlock;
}


//-(void)hz_setGuideWihtRect:(CGRect )guideRect form:(HZ_GuideFormType)form eventView:(UIView *)eventView{
//    
//    _guideRect = guideRect;
//    _form = form;
//    _eventView = eventView;
//    
//}

-(void)hz_addGuideDescribeWithImage:(UIImage *)guideDescribe pointType:(HZ_GuideDescribePoint)pointType edge:(UIEdgeInsets)edge{
    
    if (guideDescribe == nil) {
        return ;
    }
    
    _guideDescribe = guideDescribe;
    _pointType = pointType;
    self.guideViewModel.imageViewEdge = edge;
    
    
    
}
#pragma mark - 懒加载

-(HZ_GuideViewModel *)guideViewModel{
    
    if (_guideViewModel == nil) {
        _guideViewModel = [[HZ_GuideViewModel alloc] init];
    }
    return _guideViewModel;
}

-(HZ_GuideView *)guideView{
    
    if (_guideView == nil) {
        _guideView = [[HZ_GuideView alloc] init];
    }
    return _guideView;
}


@end
