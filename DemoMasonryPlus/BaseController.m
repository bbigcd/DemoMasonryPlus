//
//  BaseController.m
//  DemoMasonryPlus
//
//  Created by liushiq on 15/12/22.
//  Copyright © 2015年 chendi. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    /** 设置坐标参照不延生出视图即不延生到navigation内和tabbar*/
    self.edgesForExtendedLayout = UIRectEdgeNone;
    /** 在这里写注释*/
    self.automaticallyAdjustsScrollViewInsets = NO;
    /** 简介*/
    self.label = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(@-60);
        }];
        label.font = [UIFont systemFontOfSize:22];
        label.textColor = [UIColor blackColor];
        label.numberOfLines = 0;
        label;
    });
    /** 提示*/
    UILabel *label2 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(@-10);
        }];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        label.text = @"提示：右划返回上层菜单";
        label;
    });
    /** 手势创建*/
    UISwipeGestureRecognizer *swipeGR = ({
        /** 创建轻扫手势*/
        UISwipeGestureRecognizer *swipeGR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
        /** 设置手势方向-->右划*/
        swipeGR.direction = UISwipeGestureRecognizerDirectionRight;
        /** 与视图绑定*/
        [self.view addGestureRecognizer:swipeGR];
        swipeGR;
    });
}
- (void)swipe:(UISwipeGestureRecognizer *)gr{
    [self.navigationController popViewControllerAnimated:YES];
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
