//
//  PathAnimationViewController.m
//  iOSAnimationTutorial
//
//  Created by 臧其龙 on 16/4/11.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "PathAnimationViewController.h"
#import "CABasicAnimationDemo.h"

@interface PathAnimationViewController ()
{
    UIBezierPath *smallOvalPath;
    UIBezierPath *ovalPath;
    
    CAShapeLayer *maskLayer;
    
    UIButton *recordButton;
    
    BOOL isReverse;
}

@end

@implementation PathAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect2 = CGRectMake(0, 0, 200, 200);
    smallOvalPath = [UIBezierPath bezierPathWithRoundedRect:rect2 cornerRadius:0];
    ovalPath = [UIBezierPath bezierPathWithRoundedRect:rect2 cornerRadius:100];
    
    maskLayer = [CAShapeLayer layer];
    maskLayer.path = smallOvalPath.CGPath;
    
    recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    recordButton.backgroundColor = [UIColor redColor];
    recordButton.frame = CGRectMake(100, 100, 200, 200);
    recordButton.layer.mask = maskLayer;
    [self.view addSubview:recordButton];

}


- (IBAction)startPathAnimation:(id)sender
{
    [recordButton.layer removeAllAnimations];
    [maskLayer addAnimation:[CABasicAnimationDemo shapePathAnimationWithFromPath:smallOvalPath toPath:ovalPath reverse:!isReverse] forKey:@"pathAnimation"];
    isReverse = !isReverse;
}



@end
