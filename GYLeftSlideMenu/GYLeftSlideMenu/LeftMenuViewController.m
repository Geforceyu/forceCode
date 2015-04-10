//
//  LeftMenuViewController.m
//  GYLeftSlideMenu
//
//  Created by Geforceyu on 15/4/10.
//  Copyright (c) 2015年 Geforceyu. All rights reserved.
//

#import "LeftMenuViewController.h"

@interface LeftMenuViewController ()<UITableViewDataSource>

@property (nonatomic,strong)UIImageView * backImageView;
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:self.backImageView atIndex:0];
    [self.view addSubview:self.tableView];
    
}
- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _backImageView.image = [UIImage imageNamed:@"menuBack.png"];
    }
    return _backImageView;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-20)];
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}
#pragma mark <UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
   
    UITableViewCell * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld1231241241241451451541251",indexPath.row];
    
    return cell;
}
@end
