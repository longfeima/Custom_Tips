//
//  sTipsWindowProtocol.h
//  sTips
//
//  Created by Seven on 2017/7/25.
//  Copyright © 2017年 Seven. All rights reserved.
//

#import <Foundation/Foundation.h>



#define DS_SCREEN_SCALE                             [UIScreen mainScreen].bounds.size.width / 320.0

///////////////////shareView///////////////////////////////////////
#define DS_SHARE_ITEMHIGHT                          80              //每个按钮的高度
#define DS_SHARE_ITEMS_PREROW                       4               //每行个数
#define DS_SHARE_CANCELHIGHT                        45              //取消按钮的高度

//////////////////////////////////////////////////////////////////







@protocol sTipsWindowProtocol <NSObject>
/**  */
typedef enum : NSUInteger {
    tipsWindowAllScreen,                //全屏显示
    tipsWindowExpectNavBar,             //不覆盖导航栏
    tipsWindowExpectTabBar,             //不覆盖状态栏
    tipsWindowExpectBar                 //不覆盖导航栏和状态栏
} DsTipsWindowType;
/**  */
typedef enum : NSUInteger {
    Ds_Sheet_Default,           //looks like system sheet(title && items && cancel<index == 0>)
    Ds_Sheet_Normal             //title and items
} Ds_SheetType;

/**  */
typedef enum : NSUInteger{

    Ds_Screen_Image,
    Ds_Screen_Cancel
    
} Ds_ScreenButtonClick;

@optional
//tips delegate()
- (void)sTipsViewClick;

//shareView delegate

- (void)sShareViewSelectIndex:(NSInteger )index;

//sheetView delegate

- (void)sSheetViewSelectIndex:(NSInteger )index;



//alert delegate

- (void)sAlertViewSelectIndex:(NSInteger)index;



/**screenBtnClick  imageV click(Ds_Screen_Image)  cancelBtnClick (Ds_Screen_Cancel)*/

- (void)sScreenViewClick:(Ds_ScreenButtonClick)type;

@end
