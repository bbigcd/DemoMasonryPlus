//
//  ViewController.m
//  DemoMasonryPlus
//
//  Created by liushiq on 15/12/22.
//  Copyright © 2015年 chendi. All rights reserved.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"
@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic,strong)UITableView *tabelview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabelview = ({
        UITableView *view = [[UITableView alloc]init];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        view.dataSource = self;
        view.delegate = self;
        
        view;
    });
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark ------uitabelview data source------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    /** 带箭头样式*/
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [NSString stringWithFormat:@"Example%@",@(indexPath.row+1)];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /** 检测Example中是否有Base%@Controller,有则创建ViewController并且push*/
    Class cls = NSClassFromString([NSString stringWithFormat:@"Base%@Controller",@(indexPath.row+1)]);
    if (cls) {
        [self.navigationController pushViewController:[cls new] animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
