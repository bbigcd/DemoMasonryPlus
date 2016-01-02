//
//  Base5Controller.m
//  DemoMasonryPlus
//
//  Created by 陈弟 on 16/1/2.
//  Copyright © 2016年 chendi. All rights reserved.
//

#import "Base5Controller.h"

@interface Base5Controller ()

@end

@implementation Base5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = ({
        UIScrollView *view = [UIScrollView new];
        [self.view addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
        }];
        view.backgroundColor = [UIColor lightGrayColor];
        
        view;
    });
    /** 一个view容器，提高代码的重用性*/
    UIView *container = ({
        UIView *view = [UIView new];
        [scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
        }];
        
        view;
    });
    
    
    CGSize size = CGSizeMake(100, 100);
    
    UIView *v1 = ({
        UIView *view = [UIView new];
        [scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
        }];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    UIView *v2 = ({
        UIView *view = [UIView new];
        [scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.left.equalTo(v1.mas_right);
            make.top.equalTo(v1.mas_bottom);
        }];
        view.backgroundColor = [UIColor yellowColor];
        view;
    });
    UIView *v3 = ({
        UIView *view = [UIView new];
        [scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.right.equalTo(v2.mas_left);
            make.top.equalTo(v2.mas_bottom);
        }];
        view.backgroundColor = [UIColor greenColor];
        view;
    });
    UIView *v4 = ({
        UIView *view = [UIView new];
        [scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.right.equalTo(v3.mas_left);
            make.top.equalTo(v3.mas_bottom);
        }];
        view.backgroundColor = [UIColor blueColor];
        view;
    });
    UIView *v5 = ({
        UIView *view = [UIView new];
        [scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.left.equalTo(v4.mas_right);
            make.top.equalTo(v4.mas_bottom);
        }];
        view.backgroundColor = [UIColor brownColor];
        view;
    });
    
    [container mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(v4.mas_left);
        make.top.equalTo(v1.mas_top);
        make.right.equalTo(v2.mas_right);
        make.bottom.equalTo(v5.mas_bottom);
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
