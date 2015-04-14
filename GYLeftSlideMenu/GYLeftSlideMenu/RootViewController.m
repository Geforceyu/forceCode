//
//  RootViewController.m
//  GYLeftSlideMenu
//
//  Created by Geforceyu on 15/4/10.
//  Copyright (c) 2015年 Geforceyu. All rights reserved.
//

#import "RootViewController.h"
#import "METransitions.h"
#import "HomeViewController.h"
#import "LeftMenuViewController.h"

@interface RootViewController ()

@property (nonatomic,strong)METransitions * transitions;
@property (nonatomic, strong) UIPanGestureRecognizer *dynamicTransitionPanGesture;

@end

@implementation RootViewController

-(void)loadView
{
    [super loadView];
    //配置顶视图
    UINavigationController * topNavc   = [[UINavigationController alloc]initWithRootViewController:[[HomeViewController alloc] init]];
    topNavc.navigationBar.barTintColor = [UIColor colorWithRed:0 green:122/255.0 blue:175/255.0 alpha:1];
    topNavc.navigationBar.tintColor    = [UIColor whiteColor];
    self.topViewController             = topNavc;
    
    //配置底左视图
    self.underLeftViewController = [[LeftMenuViewController alloc]init];
    self.anchorRightPeekAmount   =  SCREEN_WIDTH - LEFT_MENU_WIDTH;
    
    //配置左滑效果
    id<ECSlidingViewControllerDelegate> transition = self.transitions.foldAnimationController;
    self.delegate                                  = transition;
    self.topViewAnchoredGesture                    = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    self.customAnchoredGestures                    = @[];
    
    [self.topViewController.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
    [self.topViewController.view addGestureRecognizer:self.panGesture];

}
- (void)viewDidLoad {

    [super viewDidLoad];
    [self initUserInterface];
    
}

- (void)initUserInterface
{

    self.view.backgroundColor = [UIColor blackColor];
}
-(METransitions *)transitions
{
    if (!_transitions) {
        _transitions = [[METransitions alloc]init];
    }
    return _transitions;
}
- (UIPanGestureRecognizer *)dynamicTransitionPanGesture {
    if (_dynamicTransitionPanGesture) return _dynamicTransitionPanGesture;
    
    _dynamicTransitionPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.transitions.dynamicTransition action:@selector(handlePanGesture:)];
    
    return _dynamicTransitionPanGesture;
}

@end
