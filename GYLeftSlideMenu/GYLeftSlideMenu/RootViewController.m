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
    self.topViewController = [[HomeViewController alloc]init];
    
    //配置底左视图
    self.underLeftViewController = [[LeftMenuViewController alloc]init];
    self.anchorRightPeekAmount   = 60;
    
    //配置左滑效果
    id<ECSlidingViewControllerDelegate> transition = self.transitions.foldAnimationController;
    self.delegate = transition;
    self.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    self.customAnchoredGestures = @[];
    
    [self.topViewController.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
    [self.topViewController.view addGestureRecognizer:self.panGesture];

}
- (void)viewDidLoad {

    [super viewDidLoad];
    [self initUserInterface];
    
}

- (void)initUserInterface
{
//    UIImageView * backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    backImageView.image = [UIImage imageNamed:@"personal_background_shadow_am.png"];
//    [self.view insertSubview:backImageView atIndex:0];
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
