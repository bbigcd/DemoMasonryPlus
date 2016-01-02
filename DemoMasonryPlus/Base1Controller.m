//
//  Base1Controller.m
//  DemoMasonryPlus
//
//  Created by liushiq on 15/12/22.
//  Copyright © 2015年 chendi. All rights reserved.
//  Masonry的基本用法，layoutMargins的用法

#import "Base1Controller.h"
#import "BaseView.h"
#import "BaseLabel.h"
@interface Base1Controller ()
@property (nonatomic, strong) UILabel *labelCenter;
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
//    UIView *v4 = ({
//        BaseView *view = [BaseView new];
//        [self.view addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            /** 没有指定宽高，会根据intrinsicContentSize（在BaseView中）指定*/
//            make.center.equalTo(self.view);
//            /** 如果改变宽度,会因为优先级先指定宽度为50，高度根据intrinsicContentSize指定为100*/
////            make.width.equalTo(@50);
//        }];
//        view.innerSize = CGSizeMake(100, 100);
//        view.backgroundColor = [UIColor greenColor];
//        view;
//    });
//    UIView *v5 = ({
//        BaseLabel *label = [BaseLabel new];
//        [self.view addSubview:label];
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.view);
//            make.width.equalTo(@150);
//        }];
//        label.text = @"dahfdhfksdahfksafiksafsa fisf";
//        label.textColor = [UIColor whiteColor];
//        label.numberOfLines = 0;
//        label.backgroundColor = [UIColor darkGrayColor];
//        label;
//    });
    UILabel *lbl1 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.left.equalTo(self.view);
        }];
        label.text = @"左边的文字";
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor grayColor];
        /** 拉伸*/
        [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        label;
    });
    
    UILabel *lbl2 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.left.equalTo(lbl1.mas_right);
        }];
        label.text = @"中间的文字";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor redColor];
        label;
    });
    self.labelCenter = lbl2;
    
    UILabel *lbl3 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.left.equalTo(lbl2.mas_right);
            make.right.equalTo(self.view.mas_right);
        }];
        label.text = @"右边的文字";
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor grayColor];
        /** 拉伸*/
        [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        label;
    });
    UILabel *label = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(@-90);
        }];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        label.text = @"点击屏幕可以添加文字";
        label;
    });
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.labelCenter.text = [self.labelCenter.text stringByAppendingString:@"test"];
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
