//
//  ViewController.m
//  DMCAShapeLayer
//
//  Created by lbq on 2017/9/4.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rectangleAction:(id)sender {
    [self clearOtherLayer];
    //矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 200)];
    
    
    [self createShapeLayerPath:path];
}

- (IBAction)circleAction:(id)sender {
    //内接椭圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 200)];
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:10.];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(80, 80.)];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [self createShapeLayerPath:path];
}

- (IBAction)lineAction:(id)sender {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //起始点
    [path moveToPoint:CGPointMake(100, 100)];
    
    [path addLineToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(150, 180)];
//    [path closePath];//形成闭合路径
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(20, 30)];
    
//    kCGLineCapButt,
//    kCGLineCapRound,
//    kCGLineCapSquare
    
    CGFloat dashLineConfig1[] = {10.0, 10.0};
    [path setLineDash:dashLineConfig1 count:3 phase:0];
    
    [path stroke];
    
    [self createShapeLayerPath:path];
    
}
- (IBAction)twiceLineAction:(id)sender {
//    UIBezierPath *path = [UIBezierPath bezierPath];
//   
//    [path moveToPoint:CGPointMake(50, 100)];
//    
//    [path addQuadCurveToPoint:CGPointMake(150, 100) controlPoint:CGPointMake(10, 200)];
//
//    [path addLineToPoint:CGPointMake(10, 200)];
//    
//    [path addLineToPoint:CGPointMake(50, 100)];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(10, 100)];
    
//    [path addQuadCurveToPoint:CGPointMake(150, 100) controlPoint:CGPointMake(10, 200)];
    [path addCurveToPoint:CGPointMake(190, 100) controlPoint1:CGPointMake(50, 50) controlPoint2:CGPointMake(150, 150)];
    
    [self createShapeLayerPath:path];
}
- (IBAction)dashLineAction:(id)sender {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(200, 200)];
    
    CGFloat dash[] = {5,5};
    [path setLineDash:dash count:10 phase:0];
    [self createShapeLayerPath:path];
    
}

- (void)createShapeLayerPath:(UIBezierPath *)path
{
    [self clearOtherLayer];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.bounds = CGRectMake(0, 0, 200, 200);
    shapeLayer.position = CGPointMake(CGRectGetWidth(self.view.frame)/2., CGRectGetHeight(self.view.frame)/2.);
    shapeLayer.lineWidth = 10;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = nil;
    shapeLayer.path = path.CGPath;
    shapeLayer.backgroundColor = [UIColor orangeColor].CGColor;
    shapeLayer.lineCap = @"round";
    shapeLayer.lineJoin = @"round";
    
    //虚线
//    shapeLayer.lineDashPattern = @[@5,@15];
    
    [self.view.layer addSublayer:shapeLayer];
}

- (void)clearOtherLayer
{
    [self.view.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[CAShapeLayer class]]) {
            [obj removeFromSuperlayer];
        }
    }];
}
@end
