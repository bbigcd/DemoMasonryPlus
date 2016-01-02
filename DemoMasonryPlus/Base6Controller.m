//
//  Base6Controller.m
//  DemoMasonryPlus
//
//  Created by 陈弟 on 16/1/2.
//  Copyright © 2016年 chendi. All rights reserved.
//

#import "Base6Controller.h"
#import <MMPlaceHolder/MMPlaceHolder.h>

@interface Base6Controller ()
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation Base6Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIStackView *stackView = ({
        UIStackView *view = [UIStackView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.centerY.equalTo(self.view);
            make.height.equalTo(@200);
        }];
        view.axis = UILayoutConstraintAxisHorizontal;
        view.alignment = UIStackViewAlignmentCenter;
        view.distribution = UIStackViewDistributionFillProportionally;
        view.spacing = 5;
        view;
    });
    self.stackView = stackView;
    /** UIStackView无法直接设置背景色*/
    UIView *backView = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(stackView);
        }];
        view.backgroundColor = [UIColor lightGrayColor];
        
        view;
    });
    /** UIView层次管理（sendSubviewToBack，bringSubviewToFront）
     将一个UIView显示在最前面只需要调用其父视图的 bringSubviewToFront（）方法。
     将一个UIView层推送到背后只需要调用其父视图的 sendSubviewToBack（）方法。*/
    [self.view sendSubviewToBack:backView];
    
    NSArray *array = @[[UIView new],[UIView new],[UIView new],[UIView new]];
    
//    for ( UIView *view in array) {
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(80, 80)).priorityLow();//优先级
//        }];
//        [stackView addArrangedSubview:view];
//        view.backgroundColor = [UIColor redColor];
//        view.layer.borderColor = [UIColor blackColor].CGColor;
//        view.layer.borderWidth = 2.0f;
//    }
    for ( int i = 0 ; i < array.count ; ++i ) {
        UIView *view = array[i];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10+i*10, 80-i*10)).priorityLow();//优先级
        }];
        [stackView addArrangedSubview:view];
        view.backgroundColor = [UIColor redColor];
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 2.0f;
        
        [view showPlaceHolder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    for ( NSLayoutConstraint *constraint in self.stackView.constraints) {
//        NSLog(@"%@",constraint);
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
