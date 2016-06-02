//
//  DetailViewController.m
//  GWL
//
//  Created by oujinlong on 16/6/1.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "DetailViewController.h"
#import "OUNavigationController.h"
@interface DetailViewController ()
@property (nonatomic, strong) UIImageView* topView;
@property (nonatomic, strong) UILabel* nameLB;
@property (nonatomic, strong) UIButton* closeButton;
@end

@implementation DetailViewController
- (UIImageView *)topView
{
    if (!_topView) {
        _topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg1"]];
        _topView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 220);
        
           }
    return _topView;
}
- (UILabel *)nameLB
{
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] initWithFrame:CGRectMake(120, 220 - 50, 100, 40)];
        _nameLB.font = [UIFont boldSystemFontOfSize:16];
        _nameLB.textColor = [UIColor whiteColor];
    }
    return _nameLB;
}
- (UIButton *)closeButton
{
    if (!_closeButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        button.frame = CGRectMake(10, 30, 30, 30);
        
        _closeButton = button;
    }
    return _closeButton;
}

-(void)setName:(NSString *)name{
    self.nameLB.text = name;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.topView];
    
    [self.topView addSubview:self.nameLB];
    
    [self.view addSubview:self.closeButton];
    
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0 green:240/255.0 blue:240/255.0 alpha:1];
}
-(void)close{
    [((OUNavigationController*)self.navigationController) popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
