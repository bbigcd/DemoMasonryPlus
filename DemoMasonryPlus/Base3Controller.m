//
//  Base3Controller.m
//  DemoMasonryPlus
//
//  Created by liushiq on 15/12/22.
//  Copyright © 2015年 chendi. All rights reserved.
//

#import "Base3Controller.h"

@interface Base3Controller ()
@property (nonatomic, strong) UIView *block;
@end

@implementation Base3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.block = ({
        UIView *view = [UIView new];
        /** 不使用Masonry*/
//        view.frame = CGRectMake(0, 0, 100, 100);
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view).centerOffset(CGPointMake(0, -300));
            make.size.mas_equalTo(CGSizeMake(200, 200));
        }];
        /** 缩放*/
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.3, 0.3);
        view;
    });
}
/** 视图加载完毕 */
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    /** 有弹簧效果的动画*/
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:1.5 initialSpringVelocity:1 options:0 animations:^{
        //        self.block.frame = CGRectMake(0, 200, 100, 100);
        /** 更新约束*/
        [self.block mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            
        }];
        [self.view layoutIfNeeded];
        self.block.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
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
