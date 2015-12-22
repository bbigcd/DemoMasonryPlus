//
//  Base1Controller.m
//  DemoMasonryPlus
//
//  Created by liushiq on 15/12/22.
//  Copyright © 2015年 chendi. All rights reserved.
//

#import "Base1Controller.h"

@interface Base1Controller ()

@end

@implementation Base1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label.text = @"基本用法";
    UIView *v1 = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            /** 左上距离父视图各50*/
            make.left.top.equalTo(@50);
            
            /** 以下代码与上面作用相同*/
            //make.left.top.mas_equalTo(50);
            
            /** 宽高各50*/
            make.size.mas_equalTo(CGSizeMake(50, 50));
            
            /** 以下代码与上面作用相同*/
            //make.width.mas_equalTo(50);
            //make.height.mas_equalTo(50);
        }];
        view.backgroundColor = [UIColor yellowColor];
        view;
    });
    UIView *v2 = ({
        UIView *view = [UIView new];
        
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(v1.mas_right);
            make.top.equalTo(v1.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        view.backgroundColor = [UIColor blueColor];
        
        /** 设置v2的左右上下的边缘(虚拟的层)上下都是20*/
        view.layoutMargins = UIEdgeInsetsMake(-20, -20, -20, -20);
        view;
    });
    UIView *v3 = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            /** 左边缘距离v2右边缘*/
            make.left.mas_equalTo(v2.mas_rightMargin);
            /** v3的Y轴中心与v2相同*/
            make.centerY.equalTo(v2);
            make.size.mas_equalTo(CGSizeMake(50, 50));
            /** 没用*/
//            make.left.right.equalTo(v2).multipliedBy(1);
        }];
        view.backgroundColor = [UIColor redColor];
        view;
    });
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
