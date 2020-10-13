//
//  LXViewController.m
//  LXShare
//
//  Created by hfdz1011 on 07/17/2020.
//  Copyright (c) 2020 hfdz1011. All rights reserved.
//

#import "LXViewController.h"
#import "LXMangerHeader.h"

@interface LXViewController ()

@end

@implementation LXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    lab.attributedText = [NSMutableAttributedString lx_inserIconFirst:@"syt_code" withAttributedString:@" 哈哈哈" withFont:[UIFont boldSystemFontOfSize:18] withColor:[UIColor redColor]];
    
    [self.view addSubview:lab];
    
    [UIAlertController lx_showAlertWithTitle:@"标题部分"
                                     message:@"信息部分"
                                      target:self
                               clickedHandle:^(UIAlertAction *action) {
        
        if ([action.title isEqualToString:@"确定"]) {
        }
    } buttons:@{
        @(UIAlertActionStyleDefault):@"确定"},@{@(UIAlertActionStyleCancel):@"取消"},nil];
    
    
    UIView *calyer = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 50, 100)];
    
    CAGradientLayer *layer = [LXToolManger lx_backGradientLayerFrame:calyer.frame withColorArray:@[[UIColor redColor],[UIColor orangeColor],[UIColor purpleColor]] withLocations:@[@(0),@(0.2),@(0.76)] withStartPoint:CGPointMake(0, 0) withEndPoint:CGPointMake(0, 1)];
    
    [calyer.layer addSublayer:layer];
    [self.view addSubview:calyer];
    
    
    UITextField *textT = [[UITextField alloc]initWithFrame:CGRectMake(50, 240, 100, 40)];
    textT.borderStyle = UITextBorderStyleRoundedRect;
    textT = [UITextField lx_setTextFiled:textT withPlace:@"哈哈哈" withPlaceColor:[UIColor redColor] withFont:[UIFont systemFontOfSize:18]];
    
    [self.view addSubview:textT];
    
    
    UIButton *button = [UIButton lx_initButtonWithTitle:@"哈哈哈322323" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:13] target:self action:@selector(buttonAction:)];
    button.frame = CGRectMake(50, 300, 100, 40);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
        
}

- (void)buttonAction:(UIButton *)sender{
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
