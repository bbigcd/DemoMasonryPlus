//
//  Base4Controller.m
//  DemoMasonryPlus
//
//  Created by liushiq on 15/12/23.
//  Copyright © 2015年 chendi. All rights reserved.
//

#import "Base4Controller.h"
#import <pop/POP.h>
#import <MMTweenAnimation/MMTweenAnimation.h>
@interface Base4Controller ()
@property (nonatomic, strong) UIView *block;
@end

@implementation Base4Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.block = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_bottom).offset(-400);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        view.backgroundColor = [UIColor redColor];
        view.layer.cornerRadius = 50;
        view;
    });
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"test" initializer:^(POPMutableAnimatableProperty *prop) {
//        prop.writeBlock = ^(id obj,const CGFloat values[]){
//            UIView *ball = (UIView *)obj;
//            [ball mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.center.equalTo(self.view).centerOffset(CGPointMake(0, -values[0]));
//            }];
//        };
//        prop.readBlock = ^(id obj, CGFloat values[]){
//            UIView *ball = (UIView *)obj;
//            for (MASLayoutConstraint *constraint in ball.constraints) {
//                if (constraint.firstAttribute == NSLayoutAttributeBottom) {
//                    values[0] = constraint.constant;
//                }
//            }
//        };
//    }];
//    POPSpringAnimation *animation = [POPSpringAnimation animation];
//    animation.property = prop;
//    animation.fromValue = @(0);
//    animation.toValue = @(200);
//    animation.springBounciness = 20;
//    animation.springSpeed = 10;
    MMTweenAnimation *animation = [MMTweenAnimation animation];
    animation.functionType = MMTweenFunctionBounce;
    animation.duration = 1.5f;
    animation.fromValue = @[@(-400)];
    animation.toValue = @[@(-40)];
    
    animation.animationBlock = ^(double c,
                                 double d,
                                 NSArray *v,
                                 id target,
                                 MMTweenAnimation *animation
                                 )
    {
        double value = [v[0] doubleValue];
        
        [self.block mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view.mas_bottom).offset(value);
        }];
    };
    [self.block pop_addAnimation:animation forKey:@"test"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
