//
//  LXTextView.m
//  LXShare
//
//  Created by 卢旭 on 2020/10/19.
//

#import "LXTextView.h"

@implementation LXTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        self.font = [UIFont systemFontOfSize:15];
        self.placeholderColor = [UIColor grayColor];
        // 使用通知监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}
 
- (void)textDidChange:(NSNotification *)note
{
    [self setNeedsDisplay];
}
 
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
 
/**
 * 每次调用drawRect:方法，都会将以前画的东西清除掉
 */
- (void)drawRect:(CGRect)rect
{
    if (self.hasText) return;
 
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor;
 
    // 画文字
    rect.origin.x = 5;
    rect.origin.y = 8;
    rect.size.width -= 2 * rect.origin.x;
    [self.placeholder drawInRect:rect withAttributes:attrs];
}
 
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setNeedsDisplay];
}
 
#pragma mark - setter
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    [self setNeedsDisplay];
}
 
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}
 
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    [self setNeedsDisplay];
}
 
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self setNeedsDisplay];
}
 
- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}


@end
