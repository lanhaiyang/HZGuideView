//
//  HZ_GuideBaseView.m
//  HZGuideView
//
//  Created by 何鹏 on 2019/3/2.
//  Copyright © 2019 何鹏. All rights reserved.
//

#import "HZ_GuideBaseView.h"
#import "HZ_GuideBaseViewModel.h"

#define HZ_GuideMainW [UIScreen mainScreen].bounds.size.width

#define HZ_GuideScreenRate (375 / HZ_GuideMainW)
#define HZ_GuideSuitFloat(float) (float / HZ_GuideScreenRate)

@interface HZ_GuideBaseView()


@property(nonatomic,strong) CAShapeLayer *dottedLineLayer;

@property(nonatomic,assign) HZ_GuideFormType type;

@end

@implementation HZ_GuideBaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self confige];
    }
    return self;
}

-(void)confige{
    
    _isShowDottedLine = YES;
    _thickness = 1;
}


- (void)creatControlWithType:(HZ_GuideFormType)type frame:(CGRect)rect{

    _type = type;
    
    // 第一个路径
    switch (type) {
        case HZ_GuideFormTypeRound:
            // 下一个路径，圆形

            _selectRect = CGRectMake((rect.origin.x + rect.size.width/2), (rect.origin.y + rect.size.height/2), (rect.size.width), (rect.size.width));
            
            _path = [UIBezierPath bezierPathWithArcCenter:CGPointMake((rect.origin.x + rect.size.width/2), (rect.origin.y + rect.size.height/2)) radius:HZ_GuideSuitFloat((rect.size.width/2)) startAngle:0 endAngle:2 * M_PI clockwise:NO];
            
            
            
            break;
            
        case HZ_GuideFormTypeRectangle:
            // 下一个路径，矩形

            _selectRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
            
            _path = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height) cornerRadius:5] bezierPathByReversingPath];

            break;
            
        default:
            break;
    }
    
    // 绘画虚线
    if (_isShowDottedLine == YES) {
        [self addDottedToLayerType:type frame:rect];
    }
}

- (void)addDottedToLayerType:(HZ_GuideFormType)type frame:(CGRect)rect{
    _dottedLineLayer = self.dottedLineLayer;
    //  线条颜色
    _dottedLineLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    
    _dottedLineLayer.fillColor = nil;
    
    
    CGFloat space = 5;
    UIBezierPath *pat = nil;
    
    switch (type) {
        case HZ_GuideFormTypeRound:
            // 下一个路径，圆形
            
            _dottedRect = CGRectMake((rect.origin.x - space), (rect.origin.y - space), rect.size.width + (space * 2), rect.size.height + (space * 2));
            
            pat = [UIBezierPath bezierPathWithArcCenter:CGPointMake((rect.origin.x + rect.size.width/2), (rect.origin.y + rect.size.height/2)) radius:HZ_GuideSuitFloat((rect.size.width/2 + space)) startAngle:0 endAngle:2 * M_PI clockwise:NO];
            
            break;
            
        case HZ_GuideFormTypeRectangle:
            // 下一个路径，矩形
            
            _dottedRect = CGRectMake((rect.origin.x - space), (rect.origin.y - space), (rect.size.width + space * 2), (rect.size.height + space * 2));
            
            pat = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake((rect.origin.x - space), (rect.origin.y - space), (rect.size.width + space * 2), (rect.size.height + space * 2)) cornerRadius:5] bezierPathByReversingPath];
            break;
            
        default:
            break;
    }
    
    pat.lineCapStyle = kCGLineCapRound;
    _dottedLineLayer.path = pat.CGPath;
    //端点样式
    _dottedLineLayer.lineJoin = kCALineJoinRound;
    _dottedLineLayer.lineCap = kCALineCapRound;
    
    // 不要设太大 不然看不出效果
    _dottedLineLayer.lineWidth = _thickness;
    _dottedLineLayer.lineCap = @"square";
    
    //  第一个是 线条长度   第二个是间距    nil时为实线
    _dottedLineLayer.lineDashPattern = @[@4, @5];
    
}

- (BOOL)hz_isTapPoint:(CGPoint)point{
    
    switch (_type) {
        case HZ_GuideFormTypeRound:
        {
            return [HZ_GuideBaseViewModel point:point inCircleRect:_selectRect];
        }
            break;
        case HZ_GuideFormTypeRectangle:
        {
            return CGRectContainsPoint(_selectRect, point);
        }
        default:
            break;
    }
}


#pragma mark - 懒加载

-(CAShapeLayer *)dottedLineLayer{
    
    if (_dottedLineLayer == nil) {
        _dottedLineLayer = [CAShapeLayer layer];
    }
    return _dottedLineLayer;
}

-(UIImageView *)guideImageView{
    
    if (_guideImageView == nil) {
        _guideImageView = [[UIImageView alloc] init];
    }
    return _guideImageView;
}

@end
