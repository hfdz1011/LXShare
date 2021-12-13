//
//  UIViewController+Navigation.m
//  LXShare
//
//  Created by Wst on 2021/8/9.
//

#import "UIViewController+Navigation.h"
#import "LXMangerHeader.h"
#import<objc/runtime.h>

static CGFloat z_left_icon_width = 1;

@implementation UIViewController (Navigation)

/// 创建只有标题的导航栏
/// @param title 标题
/// @param titleColor 颜色
/// @param titleFont 字体
/// @param bgColor 导航背景色
- (void)lx_createNavigationWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont withBgColor:(UIColor *)bgColor
{
    UIView *navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KscrendWidth, KNavigationBarHeight)];
    navigationView.backgroundColor = bgColor;
    [self.view addSubview:navigationView];
    
    UIView *headV = [[UIView alloc]initWithFrame:CGRectMake(0, KHeight_StatusBar, KscrendWidth, 44)];
    headV.userInteractionEnabled = YES;
    [navigationView addSubview:headV];
    
    UILabel *titleLable = [UILabel lx_initLableWithString:title
                                                    color:titleColor
                                                     font:titleFont];
    titleLable.textAlignment = NSTextAlignmentCenter;
    [headV addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(headV.mas_centerX);
        make.width.equalTo(@(KscrendWidth*0.6));
        make.height.equalTo(@(44));
    }];
}

/// 创建带有返回按钮的导航栏
/// @param icon 按钮图标
/// @param leftwidth 按钮宽度
/// @param leftHeight 按钮高度
/// @param title 标题
/// @param color 颜色
/// @param font 字体
/// @param bgColor 背景颜色
- (void)lx_createNavigationLeftIcon:(UIImage *)icon leftWidth:(CGFloat)leftwidth leftHeight:(CGFloat)leftHeight title:(NSString *)title color:(UIColor *)color font:(UIFont *)font bgColor:(UIColor *)bgColor
{
    
    UIView *navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KscrendWidth, KNavigationBarHeight)];
    navigationView.backgroundColor = bgColor;
    [self.view addSubview:navigationView];
    
    UIView *headV = [[UIView alloc]initWithFrame:CGRectMake(0, KHeight_StatusBar, KscrendWidth, 44)];
    headV.userInteractionEnabled = YES;
    [navigationView addSubview:headV];
    
    UIView *leftView = [[UIView alloc]init];
    leftView.userInteractionEnabled = YES;
    [headV addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(40));
        make.centerY.mas_equalTo(headV.mas_centerY);
        make.left.equalTo(@(z_left_icon_width));
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(leftTapAction)];
    [leftView addGestureRecognizer:tap];
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:icon forState:UIControlStateNormal];
    [leftButton setImage:icon forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(leftwidth));
        make.height.equalTo(@(leftHeight));
        make.centerY.mas_equalTo(leftView.mas_centerY);
        make.centerX.mas_equalTo(leftView.mas_centerX);
    }];
    
    UILabel *titleLable = [UILabel lx_initLableWithString:title
                                                    color:color
                                                     font:font];
    titleLable.textAlignment = NSTextAlignmentCenter;
    [headV addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(headV.mas_centerX);
        make.width.equalTo(@(KscrendWidth*0.6));
        make.height.equalTo(@(44));
    }];
}

- (void)leftTapAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftButtonAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


/// 创建 左边返回按钮+中间文本+右边文本 导航
/// @param icon 按钮图标
/// @param leftwidth 按钮宽度
/// @param leftHeight 按钮高度
/// @param centerTitle 中间文本
/// @param centerColor 中间文本颜色
/// @param centerFont 中间文本字体
/// @param rightTitle 右边文本
/// @param rightColor 右边文本颜色
/// @param rightFont 右边文本字体
/// @param bgColor 背景颜色
/// @param rightBlock 右边点击事件
- (void)lx_createNavigationLeftIcon:(UIImage *)icon leftWidth:(CGFloat)leftwidth leftHeight:(CGFloat)leftHeight centerTitle:(NSString *)centerTitle centerColor:(UIColor *)centerColor centerFont:(UIFont *)centerFont rightTitle:(NSString *)rightTitle rightColor:(UIColor *)rightColor rightFont:(UIFont *)rightFont bgColor:(UIColor *)bgColor rightClickBlock:(rightButtonBlock)rightBlock
{
    
    UIView *navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KscrendWidth, KNavigationBarHeight)];
    navigationView.backgroundColor = bgColor;
    [self.view addSubview:navigationView];
    
    UIView *headV = [[UIView alloc]initWithFrame:CGRectMake(0, KHeight_StatusBar, KscrendWidth, 44)];
    headV.userInteractionEnabled = YES;
    [navigationView addSubview:headV];
    
    UIView *leftView = [[UIView alloc]init];
    leftView.userInteractionEnabled = YES;
    [headV addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(40));
        make.centerY.mas_equalTo(headV.mas_centerY);
        make.left.equalTo(@(z_left_icon_width));
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(leftTapAction)];
    [leftView addGestureRecognizer:tap];
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:icon forState:UIControlStateNormal];
    [leftButton setImage:icon forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(leftwidth));
        make.height.equalTo(@(leftHeight));
        make.centerY.mas_equalTo(leftView.mas_centerY);
        make.centerX.mas_equalTo(leftView.mas_centerX);
    }];
    
    
    
    UILabel *titleLable = [UILabel lx_initLableWithString:centerTitle
                                                    color:centerColor
                                                     font:centerFont];
    titleLable.textAlignment = NSTextAlignmentCenter;
    [headV addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(headV.mas_centerX);
        make.width.equalTo(@(KscrendWidth*0.6));
        make.height.equalTo(@(44));
    }];
    
    UIButton *rightButton = [UIButton lx_initButtonWithTitle:rightTitle
                                                  titleColor:rightColor
                                                   titleFont:rightFont];
    //关联对象
    objc_setAssociatedObject(rightButton, @"rightBlock_KEY", rightBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [headV addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(headV.mas_centerY);
        make.right.mas_equalTo(headV.mas_right).offset(-10);
        make.height.equalTo(@(40));
    }];
}

- (void)rightButtonAction:(UIButton *)sender
{
    rightButtonBlock block =  objc_getAssociatedObject(sender, @"rightBlock_KEY");
    if (block) {
        block();
    }
}


/// 创建 左边返回按钮+中间文本+右边图标 导航
/// @param icon 按钮图标
/// @param leftwidth 按钮宽度
/// @param leftHeight 按钮高度
/// @param centerTitle 标题
/// @param centerColor 颜色
/// @param centerFont 字体
/// @param rightIcon 右边图标
/// @param iconWidth 按钮宽度
/// @param bgColor 背景颜色
/// @param rightBlock 右边点击事件
- (void)lx_createNavigationLeftIcon:(UIImage *)icon leftWidth:(CGFloat)leftwidth leftHeight:(CGFloat)leftHeight centerTitle:(NSString *)centerTitle centerColor:(UIColor *)centerColor centerFont:(UIFont *)centerFont rightIcon:(UIImage *)rightIcon iconWidth:(CGFloat)iconWidth  bgColor:(UIColor *)bgColor rightClickBlock:(rightButtonBlock)rightBlock
{
    
    UIView *navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KscrendWidth, KNavigationBarHeight)];
    navigationView.backgroundColor = bgColor;
    [self.view addSubview:navigationView];
    
    UIView *headV = [[UIView alloc]initWithFrame:CGRectMake(0, KHeight_StatusBar, KscrendWidth, 44)];
    headV.userInteractionEnabled = YES;
    [navigationView addSubview:headV];
    
    UIView *leftView = [[UIView alloc]init];
    leftView.userInteractionEnabled = YES;
    [headV addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(40));
        make.centerY.mas_equalTo(headV.mas_centerY);
        make.left.equalTo(@(z_left_icon_width));
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(leftTapAction)];
    [leftView addGestureRecognizer:tap];
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:icon forState:UIControlStateNormal];
    [leftButton setImage:icon forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(leftwidth));
        make.height.equalTo(@(leftHeight));
        make.centerY.mas_equalTo(leftView.mas_centerY);
        make.centerX.mas_equalTo(leftView.mas_centerX);
    }];
    
    UILabel *titleLable = [UILabel lx_initLableWithString:centerTitle
                                                    color:centerColor
                                                     font:centerFont];
    titleLable.textAlignment = NSTextAlignmentCenter;
    [headV addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(headV.mas_centerX);
        make.width.equalTo(@(KscrendWidth*0.6));
        make.height.equalTo(@(44));
    }];
    
    UIImageView *right_icon = [[UIImageView alloc]init];
    right_icon.userInteractionEnabled = YES;
    right_icon.image = rightIcon;
    [headV addSubview:right_icon];
    [right_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@(iconWidth));
        make.centerY.mas_equalTo(headV.mas_centerY);
        make.right.mas_equalTo(headV.mas_right).offset(-10);
    }];
    
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
        [tap addTarget:self action:@selector(rightTapAction:)];
        //关联对象
        objc_setAssociatedObject(tap, @"rightBlock_KEY", rightBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [right_icon addGestureRecognizer:tap];
    }
}

- (void)rightTapAction:(UITapGestureRecognizer *)tap
{
    rightButtonBlock block =  objc_getAssociatedObject(tap, @"rightBlock_KEY");
    if (block) {
        block();
    }
}

@end
