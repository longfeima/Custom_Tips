//
//  sKeyboardView.h
//  sTips
//
//  Created by Seven on 2017/8/14.
//  Copyright © 2017年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sTipsWindowProtocol.h"
@interface sKeyboardView : UIView

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, assign) id<sTipsWindowProtocol>delegate;
@end
