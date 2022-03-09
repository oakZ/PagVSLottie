//
//  LottieViewControllerOC.m
//  PagVSLottie
//
//  Created by zx on 2022/3/9.
//

#import "LottieViewControllerOC.h"
@import Lottie;

@interface LottieViewControllerOC ()

@property (nonatomic ,strong) AnimationView *lottieView;

@end

@implementation LottieViewControllerOC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    self.title = NSStringFromClass(self.class);
    self.lottieView = [[AnimationView alloc] initWithFrame:CGRectMake(100, 200, 150, 150)];
    [self.view addSubview:self.lottieView];
}

- (void)loadLottie:(NSString *)path
{
    
}

@end
