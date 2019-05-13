//
//  HZ_GuideBackgroundView.m
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/2.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import "HZ_GuideBackgroundView.h"
#import "HZ_GuideBackgroundBaseViewModel.h"

@interface HZ_GuideBackgroundView()

@property(nonatomic,strong) UIButton *deleteBtn;

@property(nonatomic,strong) UIView *backgroundView;

@property(nonatomic,strong) CAShapeLayer *shapeLayer;

@property(nonatomic,strong) NSMutableArray<HZ_GuideView *> *guideViews;

@property(nonatomic,assign) BOOL isGuide;

@property(nonatomic,copy) NSString *cacheKey;

@property(nonatomic,strong) HZ_GuideBackgroundBaseViewModel *guideBaseViewModel;
@property(nonatomic,strong) UIView *superView;

@property(nonatomic,assign) CGSize jumpButtonSize;
@property(nonatomic,strong) NSString *jumpButtonTitle;
@property(nonatomic,assign) HZ_GuideBackgroundJumpPointType pointType;
@property(nonatomic,assign) UIEdgeInsets centreEdge;

@end

@implementation HZ_GuideBackgroundView

-(instancetype)initWithCacheKey:(NSString *)cacheKey{
    
    if (self = [super init]) {
        [self layout];
        [self confige];
        [self configeWithCacheKey:cacheKey];
    }
    return self;
}

-(BOOL)hz_guideIsFrist{
    
    return _isGuide;
}

-(void)confige{
    
    _jumpButtonTitle = @"跳过";
    _pointType = HZ_GuideBackgroundJumpPointTopRight;
    _centreEdge = UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)configeWithCacheKey:(NSString *)cacheKey{
    
    if (_cacheKey.length == 0 && [NSThread isMainThread] == NO) {
        _isGuide = NO;
        return ;
    }
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:cacheKey] == nil) {
        _isGuide = YES;
    }
    else{
        _isGuide = [[NSUserDefaults standardUserDefaults] boolForKey:cacheKey];
    }
    _cacheKey = cacheKey;
}

-(void)layout{
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self updateLayout];
}

-(void)updateLayout{
    
    CGRect frame = self.bounds;
    self.frame = frame;
    
    if ([_jumpButtonTitle isEqualToString:_deleteBtn.titleLabel.text] == NO) {
        NSString *content = (_jumpButtonTitle.length != 0 ? _jumpButtonTitle:@"跳过");
        _jumpButtonSize = [self.guideBaseViewModel hz_jumpButtonWidthWithTitle:content Font:self.deleteBtn.titleLabel.font];
        [_deleteBtn setTitle:content forState:UIControlStateNormal];
    }
    
    switch (_pointType) {
        case HZ_GuideBackgroundJumpPointTopLeft:
        {
            _deleteBtn.frame = [_guideBaseViewModel hz_jumpButtonTopLeftWithSuperViewRect:self.bounds centreEdge:_centreEdge size:_jumpButtonSize];
        }
            break;
        case HZ_GuideBackgroundJumpPointTopRight:
        {
            _deleteBtn.frame = [_guideBaseViewModel hz_jumpButtonTopRightWithSuperViewRect:self.bounds centreEdge:_centreEdge size:_jumpButtonSize];
        }
            break;
        case HZ_GuideBackgroundJumpPointBottomLeft:
        {
            _deleteBtn.frame = [_guideBaseViewModel hz_jumpButtonBottomLeftWithSuperViewRect:self.bounds centreEdge:_centreEdge size:_jumpButtonSize];
        }
            break;
        case HZ_GuideBackgroundJumpPointBottomRight:
        {
            _deleteBtn.frame = [_guideBaseViewModel hz_jumpButtonBottomRightWithSuperViewRect:self.bounds centreEdge:_centreEdge size:_jumpButtonSize];
        }
            break;
        default:
            break;
    }
    
//    CGFloat space = 5;
//    CGFloat width = 50;
//    CGFloat heigth = 30;
//    CGFloat x = self.bounds.size.width - width - space;
//    CGFloat y = 34;
//
//    self.deleteBtn.frame = CGRectMake(x, y, width, heigth);
    
    [self hz_update];
    
}

-(void)hz_jumpButtonWithTitle:(NSString *)title
                    pointType:(HZ_GuideBackgroundJumpPointType)pointType
                   centreEdge:(UIEdgeInsets)centreEdge{
    
    _jumpButtonTitle = title;
    _pointType = pointType;
    _centreEdge = centreEdge;
    
    [self updateLayout];
    
}

-(void)hz_update{
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    for (int i = 0; i< self.guideViews.count; i++) {
        HZ_GuideView *guideView = _guideViews[i];
        guideView.frame = self.frame;
        [guideView hz_updateView];
        
        [path appendPath:guideView.path];
        [self.layer addSublayer:guideView.dottedLineLayer];
    }
    
    self.shapeLayer.path = path.CGPath;
    
    [self.layer setMask:self.shapeLayer];
}

-(void)action{
    
}

-(void)hz_addGruideView:(HZ_GuideView *)guideView{
    
    
    if (guideView != nil && [self.guideViews containsObject:guideView] == NO) {
        [_guideViews addObject:guideView];
        [self addSubview:guideView.guideImageView];
        
    }
}

-(void)hz_setGuideAppearHiddeWithClass:(NSArray<NSString *> *)opertionClass withSuperView:(UIView *)superView{
    
    _superView = superView;
    [self hz_opertionClass:opertionClass];
}

-(void)hz_guideAppearHidde{
    
    [self hz_allView:_superView isHidden:YES];
}

//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"C");
//    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
//    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
//    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
//
//
//
//    for (int i = 0; i< self.guideViews.count; i++) {
//        HZ_GuideView *guideView = _guideViews[i];
//        BOOL action = [guideView hz_isTapPoint:point];
//
//        if (action == YES) {
//            //            [self userDefaultWithCache];
//            //            return [self allView:guideView.eventView point:point];
//
//            UIView *view = [self allView:guideView.eventView point:point];
//            [guideView.eventView.nextResponder touchesBegan:touches withEvent:event];
//        }
//    }
//    if (CGRectContainsPoint(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20 ), point)) {
//        [self hz_jumpBack];//防止点击头部回到顶部
////        return nil;
//    }
//    else if (CGRectContainsPoint(_deleteBtn.frame, point)){
////        return _deleteBtn;
//        [_deleteBtn touchesBegan:touches withEvent:event];
//    }
////    return self;
//}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches  anyObject] locationInView:self];
    if (CGRectContainsPoint(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20 ), point)) {
        
//        [self hz_jumpBack];//防止点击头部回到顶部
        //防止点击头部回到顶部
        if ([_delegate respondsToSelector:@selector(hz_guideWithActionBlankZone)]) {
            [self userDefaultWithCache];
            [_delegate hz_guideWithActionBlankZone];
        }
    }
    else{
        [self eventWithPoint:point];
    }
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CGPoint point = [[touches  anyObject] locationInView:self];
//    if (CGRectContainsPoint(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20 ), point)) {
//        
//        [self hz_jumpBack];//防止点击头部回到顶部
//    }
//    else{
//        [self eventWithPoint:point];
//    }
//}

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//
//    static UIEvent *e = nil;
//
//    if (e != nil && e == event) {
//        e = nil;
//        return [super hitTest:point withEvent:event];
//    }
//
//    e = event;
//
//    NSSet *touches = [event touchesForView:self];
//    UITouch *touch = [touches anyObject];
//
//    if (event.type == UIEventTypeTouches && touch.phase == UITouchPhaseBegan) {
//
//        [self eventWithPoint:point];
//
//    }else if (CGRectContainsPoint(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20 ), point)) {
//
//        [self hz_jumpBack];//防止点击头部回到顶部
//        return [super hitTest:point withEvent:event];
//    }
//
//    return [super hitTest:point withEvent:event];
//
//    //事件穿透
//    //    for (int i = 0; i< self.guideViews.count; i++) {
//    //        HZ_GuideView *guideView = _guideViews[i];
//    //        BOOL action = [guideView hz_isTapPoint:point];
//    //        if (action == YES) {
//    //            //            [self userDefaultWithCache];
//    ////            return [self allView:guideView.eventView point:point];
//    //            return [self allView:guideView.eventView point:point];
//    //        }
//    //    }
//    //    if (CGRectContainsPoint(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20 ), point)) {
//    //        [self hz_jumpBack];//防止点击头部回到顶部
//    //        return nil;
//    //    }
//    //    else if (CGRectContainsPoint(_deleteBtn.frame, point)){
//    //        return _deleteBtn;
//    //    }
//    //    return [super hitTest:point withEvent:event];
//
//
//    //    return _deleteBtn;
//
//    //    if (CGRectContainsPoint(_deleteBtn.frame, point)) {
//    //         return _deleteBtn;
//    //    }
//    //    else{
//    //        [self hz_jumpBack];//点击空白清除
//    //        return nil;
//    //    }
//
//    //    [self hz_jumpBack];//点击空白清除
//    //    return _deleteBtn;
//}

-(void)hz_opertionClass:(NSArray<NSString *> *)opertionClass{
    
    self.guideBaseViewModel.guideHiddenClass = opertionClass;
}

-(void)hz_allView:(UIView *)rootView isHidden:(BOOL)hidden{
    for (UIView *subView in [rootView subviews]){
        
        if (!rootView.subviews.count) {
            return;
        }
        if ([self.guideBaseViewModel.guideHiddenClass containsObject:NSStringFromClass([subView class])] == YES) {
            if (hidden == YES) {
                subView.alpha = 0;
            }
            else{
                subView.alpha = 1;
            }
        }
        [self hz_allView:subView isHidden:hidden];
    }
}


-(void)eventWithPoint:(CGPoint)point{
    
    //事件穿透
    BOOL isGuideArea = NO;
    for (int i = 0; i< self.guideViews.count; i++) {
        HZ_GuideView *guideView = _guideViews[i];
        BOOL action = [guideView hz_isTapPoint:point];
        if (action == YES && guideView.eventBlock != nil) {
            [self userDefaultWithCache];
            isGuideArea = YES;
            guideView.eventBlock();
            
        }
    }
    
    if (isGuideArea == NO) {
        [self userDefaultWithCache];;
    }
}

// 遍历到指定事件层
-(UIView *)allView:(UIView *)rootView point:(CGPoint )point{
    
    for (UIView *subView in [rootView subviews]){
        if ([subView.layer containsPoint:point]) {
            if ([subView subviews].count == 0) {
                return subView;
            }
            else{
                [self allView:subView point:point];
            }
        }
    }
    return nil;
}



//跳过
-(void)hz_jumpBack{
    [self userDefaultWithCache];
    
    if ([_delegate respondsToSelector:@selector(hz_guideWithActionJumpBack)]) {
        [_delegate hz_guideWithActionJumpBack];
    }
}

-(void)userDefaultWithCache{
    
    if ([NSThread isMainThread] == YES && _isGuide == YES) {
        _isGuide = NO;
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:_cacheKey];
    }
    [self hz_allView:_superView isHidden:NO];
    [self removeFromSuperview];
}

#pragma mark - 懒加载

-(UIButton *)deleteBtn{
    
    if (_deleteBtn == nil) {
        _deleteBtn = [[UIButton alloc] init];
        [_deleteBtn setTitle:@"跳过" forState:UIControlStateNormal];
        [_deleteBtn setTintColor:[UIColor whiteColor]];
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_deleteBtn addTarget:self action:@selector(hz_jumpBack) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_deleteBtn];
    }
    return _deleteBtn;
}

-(NSMutableArray<HZ_GuideView *> *)guideViews{
    
    if (_guideViews == nil) {
        _guideViews = [NSMutableArray array];
    }
    return _guideViews;
}

//-(UIView *)backgroundView{
//
//    if (_backgroundView == nil) {
//        _backgroundView = [[UIView alloc] init];
//        [self addSubview:_backgroundView];
//    }
//    return _backgroundView;
//}

-(CAShapeLayer *)shapeLayer{
    
    if (_shapeLayer == nil) {
        _shapeLayer = [[CAShapeLayer alloc] init];
    }
    return _shapeLayer;
}

-(HZ_GuideBackgroundBaseViewModel *)guideBaseViewModel{
    
    if (_guideBaseViewModel == nil) {
        _guideBaseViewModel = [[HZ_GuideBackgroundBaseViewModel alloc] init];
    }
    return _guideBaseViewModel;
}


@end
