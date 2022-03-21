//
//  LXNextViewController.m
//  LXShare_Example
//
//  Created by Wst on 2021/8/9.
//  Copyright © 2021 hfdz1011. All rights reserved.
//

#import "LXNextViewController.h"
#import "LXMangerHeader.h"

@interface LXNextViewController ()

@end

@implementation LXNextViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
//    [self lx_createNavigationLeftIcon:[UIImage imageNamed:@"syt_code"] title:@"我只是好奇而已" color:[UIColor redColor] font:[UIFont fontWithName:K_Font_Medium size:18] bgColor:[UIColor orangeColor]];
    
    
//    [self lx_createNavigationLeftIcon:[UIImage imageNamed:@"syt_code"]
//                          centerTitle:@"我只是来测试的"
//                          centerColor:[UIColor redColor]
//                           centerFont:[UIFont fontWithName:K_Font_Medium size:18]
//                           rightTitle:@"点击"
//                           rightColor:[UIColor blackColor]
//                            rightFont:[UIFont fontWithName:K_Font_Medium size:15]
//                              bgColor:[UIColor orangeColor]
//                      rightClickBlock:^{
//        
//        
//        NSLog(@"responseObject===???   %@",@"成功实现了点击的回掉处理");
//        
//    }];
}


@end
