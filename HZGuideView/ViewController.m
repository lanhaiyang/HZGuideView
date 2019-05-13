//
//  ViewController.m
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/1.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import "ViewController.h"
//#import "HZ_GuideBackgroundView.h"
#import "HZ_ViewControllerGuideManager.h"
#import <Masonry.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *dBtn;
@property (weak, nonatomic) IBOutlet UIView *BBackgroundView;

@property (weak, nonatomic) IBOutlet UIView *ABackgourndView;


//@property(nonatomic,strong) HZ_GuideBackgroundView *backgroundView;
//@property(nonatomic,strong) HZ_GuideView *guideView1;
//@property(nonatomic,strong) HZ_GuideView *guideView2;
//@property(nonatomic,strong) HZ_GuideView *guideView3;

@property(nonatomic,strong) HZ_ViewControllerGuideManager *guideManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self layout];
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    //    if ([_backgroundView hz_guideIsFrist] == YES) {
//    __weak typeof(self) weakSelf = self;
//    CGRect rect1=[self.dBtn convertRect:self.dBtn.bounds toView:self.view];
//    [_guideView1 hz_setGuideWihtRect:rect1 form:HZ_GuideFormTypeRound event:^{
//        [weakSelf.backgroundView hz_jumpBack];
//    }];
//
//    CGRect rect2=[self.BBackgroundView convertRect:self.BBackgroundView.bounds toView:self.view];
//    [_guideView2 hz_setGuideWihtRect:rect2 form:HZ_GuideFormTypeRectangle event:^{
//        [weakSelf.backgroundView hz_jumpBack];
//    }];
//
//    CGRect rect3=[self.ABackgourndView convertRect:self.ABackgourndView.bounds toView:self.view];
//    [_guideView3 hz_setGuideWihtRect:rect3 form:HZ_GuideFormTypeRectangle event:^{
//        [weakSelf.backgroundView hz_jumpBack];
//    }];
    //    }
    
    if ([self.guideManager hl_isFristGuide] == YES) {
       
        [_guideManager hz_cButtonGudieWithItem:self.dBtn describeImage:[UIImage imageNamed:@"live"]];
        [_guideManager hz_aBackgroundGudieWithItem:self.ABackgourndView describeImage:nil];
        [_guideManager hz_bBackgroundGudieWithItem:self.BBackgroundView describeImage:nil];
        
        [self.view addSubview:_guideManager.guideView];
        [_guideManager.guideView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
    
}


//-(void)layout{x
//
//
//
//    _backgroundView = [[HZ_GuideBackgroundView alloc] initWithCacheKey:@"cacheKey"];
//
////    if ([_backgroundView hz_guideIsFrist] == NO) {
////        return;
////    }
//    /// 设置 [UIApplication sharedApplication].keyWindow 隐藏指定 Class 比如有弹窗
//    [_backgroundView hz_setGuideAppearHiddeWithClass:@[@"Class"] withSuperView:[UIApplication sharedApplication].keyWindow];
//
//    _guideView1 = [[HZ_GuideView alloc] init];
//    _guideView2 = [[HZ_GuideView alloc] init];
//    _guideView3 = [[HZ_GuideView alloc] init];
//
//    [_backgroundView hz_addGruideView:_guideView1];
//    [_backgroundView hz_addGruideView:_guideView2];
//    [_backgroundView hz_addGruideView:_guideView3];
//
//    [_guideView1 hz_addGuideDescribeWithImage:[UIImage imageNamed:@"live"] pointType:HZ_GuideDescribePointCentreUp edge:UIEdgeInsetsMake(0, 0, 0, 18)];
//
//    [self.view addSubview:_backgroundView];
//    [_backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//
//    [_backgroundView hz_guideAppearHidde];//开启隐藏
//}

#pragma mark - 懒加载

-(HZ_ViewControllerGuideManager *)guideManager{
    
    if (_guideManager == nil) {
        _guideManager = [[HZ_ViewControllerGuideManager alloc] init];
    }
    return _guideManager;
}

@end
