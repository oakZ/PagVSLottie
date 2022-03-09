//
//  PAGViewController.h
//  PagVSLottie
//
//  Created by zx on 2022/3/9.
//

#import <UIKit/UIKit.h>
#include <libpag/PAGView.h>

NS_ASSUME_NONNULL_BEGIN

@interface PAGViewController : UIViewController

/**
 PAG显示视图
 */
@property (strong, nonatomic) PAGView* pagView;

/**
 PAG资源文件
 */
@property (strong, nonatomic) PAGFile* pagFile;

@end

NS_ASSUME_NONNULL_END
