//
//  ViewController.m
//  PagVSLottie
//
//  Created by zx on 2022/3/8.
//

#import "ViewController.h"
#import "Masonry.h"
#import <PagVSLottie-Swift.h>
#import "PAGViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews
{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSString *)titleForIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row) {
        return @"PAG";
    }
    if (1 == indexPath.row) {
        return @"Lottie";
    }
    if (2 == indexPath.row) {
        return @"Compare";
    }
    return @"unknown";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = [self titleForIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row) {
        PAGViewController *pag = [[PAGViewController alloc] init];
        [self.navigationController pushViewController:pag animated:YES];
    } else if (1 == indexPath.row) {
        LottieViewController *lottie = [[LottieViewController alloc] init];
        [self.navigationController pushViewController:lottie animated:YES];
    } else if (2 == indexPath.row) {
        CompareViewController *vc = [[CompareViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
