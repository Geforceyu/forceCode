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
@property (nonatomic,strong)UISearchBar * searchBar;
@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor      = [UIColor whiteColor];
    [self.view insertSubview:self.backImageView atIndex:0];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.searchBar;
    
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
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 200, CGRectGetHeight(self.view.bounds)-20)];
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 30)];
        _searchBar.placeholder = @"搜索表情";
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    }
    return _searchBar;
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
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    [cell.selectedBackgroundView.layer removeAllAnimations];
    cell.textLabel.text = @"炮炮兵";
    
    return cell;
}
@end
