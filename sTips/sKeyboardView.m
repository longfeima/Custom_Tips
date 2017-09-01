//
//  sKeyboardView.m
//  sTips
//
//  Created by Seven on 2017/8/14.
//  Copyright © 2017年 Seven. All rights reserved.
//

#import "sKeyboardView.h"
#import <Masonry/Masonry.h>
@interface sKeyboardView ()


@property (nonatomic, strong) UIImageView *bgImageV;
//@property (nonatomic, strong) UITextView *textView;

@end


@implementation sKeyboardView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
        
        [self confConstrain];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
        
        
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{

    if([keyPath isEqualToString:@"frame"])
    {
        //        NSLog(@"\n\n%@\n\n",change);
        
        CGRect new = [change[@"new"] CGRectValue];
        CGRect old = [change[@"old"] CGRectValue];
        
        if (new.origin.y > old.origin.y && new.origin.y == [UIScreen mainScreen].bounds.size.height - self.frame.size.height) {
            [UIView animateWithDuration:0.01 animations:^{
                self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.frame.size.width, self.frame.size.height);
            }];
        }
        
        
    }
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"frame"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)showKeyboard:(NSNotification *)noti{

    NSDictionary *dict = noti.userInfo;
    
    NSValue *begainV = [dict objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect begainR = [begainV CGRectValue];
    
    NSValue *endV = [dict objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect endR = [endV CGRectValue];
    
    
    CGFloat durationTime = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    self.frame = CGRectMake(0, begainR.origin.y - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    
    [UIView animateWithDuration:durationTime animations:^{
        self.frame = CGRectMake(0, endR.origin.y - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }];
    
    
    
}

- (void)hideKeyboard:(NSNotification *)noti{

    NSDictionary *dict = noti.userInfo;
//    NSValue *begainV = [dict objectForKey:UIKeyboardFrameBeginUserInfoKey];
//    CGRect begainR = [begainV CGRectValue];
    NSValue *endV = [dict objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect endR = [endV CGRectValue];
    CGFloat durationTime = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    
    
    
    [UIView animateWithDuration:durationTime animations:^{
    }];
    [UIView animateWithDuration:durationTime animations:^{
        self.frame = CGRectMake(0, endR.origin.y - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
    
}


- (void)creatUI{

    [self addSubview: self.bgImageV];
    [self.bgImageV addSubview:self.textView];
}

- (void)confConstrain{
    
    [self.bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.bgImageV).offset(15);
        make.bottom.right.equalTo(self.bgImageV).offset(-15);
    }];
    [self.textView becomeFirstResponder];
    
}



- (UIImageView *)bgImageV {

    if (!_bgImageV) {
        _bgImageV = [UIImageView new];
        _bgImageV.userInteractionEnabled = YES;
        _bgImageV.backgroundColor = [UIColor yellowColor];
    }
    return _bgImageV;
}


- (UITextView *)textView{

    if (!_textView) {
        _textView = [UITextView new];
        _textView.delegate = self;
        _textView.backgroundColor = [UIColor redColor];
    }
    return _textView;
}

@end
