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

@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *confirmBtn;


@end


@implementation sKeyboardView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
        self.backgroundColor = [UIColor whiteColor];
        [self confConstrain];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
        
        
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
        
    }
    return self;
}



- (void)creatUI{
    
    [self addSubview: self.bgImageV];
    [self.bgImageV addSubview:self.textView];
    [self.bgImageV addSubview:self.cancelBtn];
    [self.bgImageV addSubview:self.confirmBtn];
}

- (void)confConstrain{
    
    [self.bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.bgImageV).offset(15);
        make.right.equalTo(self.bgImageV).offset(-15);
    }];
    [self.textView becomeFirstResponder];
    
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageV).offset(20);
        make.bottom.equalTo(self.bgImageV).offset(-15);
        make.top.equalTo(self.textView.mas_bottom).offset(10);
    }];
    
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cancelBtn);
        make.right.equalTo(self.bgImageV).offset(-20);
    }];
    
    [self.cancelBtn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.confirmBtn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)itemClick:(UIButton *)btn{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(sKeyboardViewClick:contentStr:)]) {
        //        [self.delegate sScreenViewClick:tag];
        if ([btn isEqual:self.cancelBtn]) {
            [self.delegate sKeyboardViewClick:-1 contentStr:@""];
        }else{
            [self.delegate sKeyboardViewClick:1 contentStr:self.textView.text];
        }
    }
    
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

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"frame"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UIImageView *)bgImageV {
    
    if (!_bgImageV) {
        _bgImageV = [UIImageView new];
        _bgImageV.userInteractionEnabled = YES;
        _bgImageV.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4];
    }
    return _bgImageV;
}


- (UITextView *)textView{
    
    if (!_textView) {
        _textView = [UITextView new];
        _textView.delegate = self;
        _textView.backgroundColor = [UIColor whiteColor];
    }
    return _textView;
}

- (UIButton *)cancelBtn{
    
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return _cancelBtn;
}

- (UIButton *)confirmBtn{
    
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_confirmBtn setBackgroundColor: [UIColor whiteColor]];
    }
    return _confirmBtn;
}



@end
