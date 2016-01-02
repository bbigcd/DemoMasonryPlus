//
//  Base2Controller.m
//  DemoMasonryPlus
//
//  Created by liushiq on 15/12/22.
//  Copyright © 2015年 chendi. All rights reserved.
//  multipliedBy和dividedBy

#import "Base2Controller.h"

@interface Base2Controller ()

@end

@implementation Base2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label.text = @"旋转屏幕可以实现自动布局";
    UIView *playerView = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.view);
            /** view的高度为view宽度的9/16，这样设置可以实现横屏的时候刚刚好覆盖整个屏幕，类似与横屏播放视频，multipliedBy可以提供倍数关系*/
//            make.height.equalTo(view.mas_width).multipliedBy(9.0f/16.0f);
            /** 而dividerBy则是multipleBy的倒数,下方代码等同上方代码*/
            make.height.equalTo(view.mas_width).dividedBy(16.0f/9.0f);
        }];
        view.backgroundColor = [UIColor blackColor];
        view;
    });
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
