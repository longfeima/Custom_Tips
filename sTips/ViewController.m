//
//  ViewController.m
//  sTips
//
//  Created by Seven on 2017/6/28.
//  Copyright © 2017年 Seven. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Common.h"
#import "sShowTisWindow.h"
#import "sAlertView.h"

@interface ViewController ()<sTipsWindowProtocol, sTipsWindowDataSource, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (NSArray *)dataSource{

    if (!_dataSource) {
        _dataSource = @[
                        @"导航栏的tips显示",
                        @"分享View",
                        @"sheetView",
                        @"AlertView",
                        @"ScreenView"
                        ];
    }
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn setTitle:@"testBtn" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(hello) forControlEvents:UIControlEventTouchUpInside];
    
    

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *indent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indent];
    }
    cell.textLabel.text = self.dataSource[indexPath.item];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger index = indexPath.item;
    
    switch (index) {
        case 0:
        {
            [[sShowTisWindow shareTipsWindow] showTips];
        }
            break;
        case 1:
        {
//            [[sShowTisWindow shareTipsWindow] showShareViewWithDelegate:self];
//            [sShowTisWindow shareTipsWindow].isClickHide = YES;
//            [sShowTisWindow shareTipsWindow].delegate = self;
            NSArray *norLogs = @[@"icon_pengyou_nor",@"icon_weixinhaoyou_nor",@"icon_qqhaoyou_nor",@"icon_qqkongjian_nor",@"icon_weibo_nor",@"icon_xinxi_nor",@"icon_weixinhaoyou_nor",@"icon_qqhaoyou_nor",@"icon_qqkongjian_nor",@"icon_weibo_nor",@"icon_xinxi_nor"];
            NSArray *titles = @[@"朋友圈",@"微信",@"QQ好友",@"QQ空间",@"微博",@"信息",@"微信",@"QQ好友",@"QQ空间",@"微博",@"信息"];
            NSArray *preLogs = @[@"",@""];
            [[sShowTisWindow shareTipsWindow] showShareViewWithNormalLogs:norLogs PressLogs:preLogs Titles:titles Delegate:self];
        }
            break;
        case 2:
        {
//            [[sShowTisWindow shareTipsWindow] showShareViewWithDelegate:self];
            [[sShowTisWindow shareTipsWindow] showSheetWithObject:@[@"窗口一",@"窗口二",@"窗口三"] Title:@"这个是标题" Delegate:self Type:Ds_Sheet_Default];
//            [sShowTisWindow shareTipsWindow].isClickHide = YES;
        }
            break;
        case 3:
        {
//            [[sShowTisWindow shareTipsWindow] showAlertWithTitle:@"温馨提示" Message:@"这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个最低高度一个最高高度" Cancel:@"取消" Delegate:self];
            [[sShowTisWindow shareTipsWindow] showAlertWithTitle:@"温馨提示" Message:@"这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个最低高度一个最高高度\n这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个最低高度一个最高高度\n这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个最低高度一个最高高度,这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个的手机号的接口客户端司法局好看的手机都是发货价大沙发很简单撒风华绝代华东师范交互的发神经风刀霜剑啊但是很骄傲大是大非撒火炬大厦发黄齑淡饭撒花积分多撒好减肥的撒建行卡范德萨好几款范德高度，一个最低高度一么去控制了，卧槽，这里是不是要写成自适应的高度，一个最低高度一个最高高度\n这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个最低高度一个最高高度,这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个的手机号的接口客户端司法局好看的手机都是发货价大沙发很简单撒风华绝代华东师范交互的发神经风刀霜剑啊但是很骄傲大是大非撒火炬大厦发黄齑淡饭撒花积分多撒好减肥的撒建行卡范德萨好几款范德高度，一个最低高度一个最高高度\n这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个最低高度一个最高高度,这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个的手机号的接口客户端司法局好看的手机都是发货价大沙发很简单撒风华绝代华东师范交互的发神经风刀霜剑啊但是很骄傲大是大非撒火炬大厦发黄齑淡饭撒花积分多撒好减肥的撒建行卡范德萨好几款范德萨就好看撒地方最个最高高度\n这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个最低高度一个最高高度,这里是内容具体的内容是多少就看你们怎么去控制了，卧槽，这里是不是要写成自适应的高度，一个的手机号的接口客户端司法局好看的手机都是发货价大沙发很简单撒风华绝代华东师范交互的发神经风刀霜剑啊但是很骄傲大是大非撒火炬大厦发黄齑淡饭撒花积分多撒好减肥的撒建行卡范德萨好几款范德萨就好看撒地方最低高度一个最高高度" Cancel:@"取消" Confirm:@"确定" Delegate:self];
    }
            break;
        case 4:
        {
            [[sShowTisWindow shareTipsWindow] showScreenWithUrl:[NSURL URLWithString:@"http://ddsc2.b0.upaiyun.com/common/launch/%E5%BB%BA%E5%86%9B%E8%8A%82.jpg"] Delegate:self];
//            [sShowTisWindow shareTipsWindow].isClickHide = YES;
        }
            break;
            
        default:
            break;
    }
    
}

- (void)showTipsWithCustomView:(UIView *)customView Type:(DsShowScreenType)type{

    
    
}



- (void)hello{
    NSLog(@"打印就是有效，不打印就是无效");
    ViewController *vc = [[ViewController alloc]init];
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random()%244/255.0 green:arc4random()%244/255.0 blue:arc4random()%244/255.0 alpha:1];
    [self.navigationController pushViewController:vc animated:YES];
}


//share
- (void)sShareViewSelectIndex:(NSInteger)index{

    NSLog(@"\n\n点了share第%lu个\n\n",index);
    [[sShowTisWindow shareTipsWindow] hideWindowSubviews];
}

//sheet
- (void)sSheetViewSelectIndex:(NSInteger)index{

    NSLog(@"\n\n点了sheet第%lu个\n\n",index);
    [[sShowTisWindow shareTipsWindow] hideWindowSubviews];
    
}
// alert
- (void)sAlertViewSelectIndex:(NSInteger)index{

    NSLog(@"\n\n点了alert第%lu个\n\n",index);
    [[sShowTisWindow shareTipsWindow] hideWindowSubviews];
    
}


//screen
- (void)sScreenViewClick:(Ds_ScreenButtonClick)type{

    NSLog(@"\n\n点了screen第%lu个\n\n",type);
    [[sShowTisWindow shareTipsWindow] hideWindowSubviews];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [sShowTisWindow shareTipsWindow].type = 3;
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}


- (void)creaseLineWithGradient{

    UIColor *blackColor = [UIColor blackColor];
    UILabel *lb = [[UILabel alloc]init];
    lb.frame = CGRectMake(100, 100, 100, 100);
    //    [self.view addSubview:lb];
    [lb addGradientLayerWithColors:@[(id)[blackColor colorWithAlphaComponent:0.9].CGColor, (id)[blackColor colorWithAlphaComponent:0.5].CGColor, (id)[[UIColor redColor] colorWithAlphaComponent:0.8].CGColor, (id)[[UIColor redColor] colorWithAlphaComponent:0.0].CGColor] locations:nil startPoint:CGPointMake(0.5, 0.0) endPoint:CGPointMake(0.5, 0.4)];
    
    for (int i = 0; i < 50; i++) {
        UILabel *lb = [[UILabel alloc]init];
        lb.frame = CGRectMake(0, 64 + i * 15, 375, 10);
        [self.view addSubview:lb];
        [lb addGradientLayerWithColors:@[(id)[blackColor colorWithAlphaComponent:0.9].CGColor, (id)[blackColor colorWithAlphaComponent:0.5].CGColor, (id)[[UIColor redColor] colorWithAlphaComponent:0.8].CGColor, (id)[[UIColor redColor] colorWithAlphaComponent:0.0].CGColor] locations:nil startPoint:CGPointMake(0.5, 0.0) endPoint:CGPointMake(0.5, 0.4)];
        NSLog(@"\n\n时间：\n%@\n\n",[NSDate date]);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
