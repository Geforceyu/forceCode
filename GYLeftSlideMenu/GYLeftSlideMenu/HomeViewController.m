//
//  HomeViewController.m
//  GYLeftSlideMenu
//
//  Created by Geforceyu on 15/4/10.
//  Copyright (c) 2015年 Geforceyu. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import <ShareSDK/ShareSDK.h>

@interface HomeViewController ()
{
    UIWebView * webView;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUserInterface];
    
    
}
- (void)initUserInterface
{
    self.view.backgroundColor             = [UIColor whiteColor];
    UIBarButtonItem * leftItem            = [[UIBarButtonItem alloc]initWithTitle:@"分类" style:UIBarButtonItemStylePlain target:self action:@selector(processNavigationItem:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 160, 160)];
    webView.center = self.view.center;
    [self.view addSubview:webView];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForAuxiliaryExecutable:@"test.gif"]];
    [webView loadRequest:request];
    
    [webView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(processTapGesture:)]];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationItem.title             = @"微信表情";

}
#pragma mark -Process
- (void)processNavigationItem:(UIBarButtonItem *)item
{
    [self.slidingViewController anchorTopViewToRightAnimated:YES onComplete:nil];
}
- (void)processTapGesture:(UITapGestureRecognizer *)tap
{
    NSString *imagePath = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"test.gif"];
    NSData * data = [NSData dataWithContentsOfFile:imagePath];
    
    //构造分享内容re
    id<ISSContent> publishContent = [ShareSDK content:@"123" defaultContent:@"123" image:[ShareSDK imageWithPath:imagePath] title:@"123" url:@"123" description:@"123" mediaType:SSPublishContentMediaTypeGif];
    
    
    NSArray *shareList = [ShareSDK getShareListWithType:ShareTypeWeixiSession, nil];
    
//    [ShareSDK oneKeyShareContent:publishContent//内容对象
//                       shareList:shareList//平台类型列表
//                     authOptions:nil//授权选项
//                   statusBarTips:YES
//                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {//返回事件
//                              
//                              if (state == SSPublishContentStateSuccess)
//                              {
//                                  NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
//                              }
//                              else if (state == SSPublishContentStateFail)
//                              {
//                                  NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
//                              }
//                          }];
//    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:webView arrowDirect:UIPopoverArrowDirectionUp];
    
    //弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                }
                            }];
}

@end
