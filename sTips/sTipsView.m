//
//  sTipsView.m
//  sTips
//
//  Created by Seven on 2017/7/23.
//  Copyright © 2017年 Seven. All rights reserved.
//

#import "sTipsView.h"






@interface sTipsView ()
@end

@implementation sTipsView



- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self tipLb];
    }
    return self;
}

- (void)tipClick:(UITapGestureRecognizer *)tap{

    if (self.delegate && [self.delegate respondsToSelector:@selector(sTipsViewClick)]) {
        [self.delegate sTipsViewClick];
    }
}

- (UILabel *)tipLb{

    if (!_tipLb) {
        _tipLb = [UILabel new];
        _tipLb.textAlignment = 1;
        _tipLb.textColor = [UIColor grayColor];
        _tipLb.backgroundColor = [UIColor blueColor];
        _tipLb.bounds = CGRectMake(0, 0, 200, 30);
        _tipLb.center = CGPointMake(self.center.x, self.center.y + 60);
        _tipLb.userInteractionEnabled = YES;
        [_tipLb addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tipClick:)]];
        [self addSubview:_tipLb];
    }
    return _tipLb;
}

@end
