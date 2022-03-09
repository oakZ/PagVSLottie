//
//  PAGViewController.m
//  PagVSLottie
//
//  Created by zx on 2022/3/9.
//

#import "PAGViewController.h"


@interface PAGViewController ()

@end

@implementation PAGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    self.title = NSStringFromClass(self.class);
    [self initPAGView];
}

- (NSString*)resourcePath {
    return [[NSBundle mainBundle] pathForResource:@"live_product" ofType:@"pag"];
}

/**
 初始化PAGView
 */
- (void)initPAGView {
    //读取PAG素材文件
    NSString* resourcePath = [self resourcePath];
    self.pagFile = [PAGFile Load:resourcePath];
    
    //创建PAG播放视图PAGView
    self.pagView = [[PAGView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width - 60, 210)];
    [self.view addSubview:self.pagView];
    
    //关联PAGView和PAGFile
    [self.pagView setComposition:self.pagFile];
    //3.0中pagView中可以使用setPath直接使用file，setPath在pag中会根据path缓存pagFile，实现一次加载多个地方调用
    //[self.pagView setPath:resourcePath];
    //3.0中 [self.pagView setFile:self.pagFile]方法被废弃，如果使用setFile则无法通过file对替换数据进行控制;
    
    //设置循环播放，默认只播放一次
    [self.pagView setRepeatCount:-1];
    
    //播放
    [self.pagView play];
    
    
    [self.view sendSubviewToBack:self.pagView];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    if ([self.pagView isPlaying]) {
        [self.pagView stop];
    } else {
        [self.pagView play];
    }
    
}

@end
