//
//  RootViewController.m
//  CellExtand
//
//  Created by 花达 on 2018/4/12.
//  Copyright © 2018年 HangZhouShenMangtTechnologyInformation. All rights reserved.
//

#import "RootViewController.h"
#import "CellTableViewCell.h"
#import "Masonry.h"
#import "YYKit.h"

@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource, CellTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *contentArr;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setConfig];
}

/**
 setConfig
 */
- (void)setConfig{
    self.titleArr = @[@"怎么样次啊能借到贷款？", @"审核期一般要多久？", @"怎么才能快速提高通过率？", @"如何修改登录密码？"];
    //
    self.contentArr = @[@"由淘宝快递发货的自营（非自提）订单，在订单打印之前可以修改，打开“我的订单”，进入您想修改的“订单详情”页面，点击右上角的“修改订单”即可，若没有修改订单按钮，则表示订单无法修改。", @"由当当快递发货的自营（非自提）订单，在订单打印之前可以修改，打开“我的订单”，进入您想修改的“订单详情”页面，点击右上角的“修改订单”即可，若没有修改订单按钮，则表示订单无法修改。", @"由京东快递发货的自营（非自提）订单，在订单打印之前可以修改，打开“我的订单”，进入您想修改的“订单详情”页面，点击右上角的“修改订单”即可，若没有修改订单按钮，则表示订单无法修改。", @"由天猫快递发货的自营（非自提）订单，在订单打印之前可以修改，打开“我的订单”，进入您想修改的“订单详情”页面，点击右上角的“修改订单”即可，若没有修改订单按钮，则表示订单无法修改。", @"由京东快递发货的自营（非自提）订单，在订单打印之前可以修改，打开“我的订单”，进入您想修改的“订单详情”页面，点击右上角的“修改订单”即可，若没有修改订单按钮，则表示订单无法修改。"];
    self.tableView.estimatedRowHeight = 80;
    self.tableView.estimatedRowHeight = 80;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //
    [self.tableView registerClass:[CellTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CellTableViewCell class])];
}

/**
 懒加载

 @return <#return value description#>
 */
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        //
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    static CellTableViewCell *cell;
    cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[CellTableViewCell alloc] initWithReuseIdentifier:NSStringFromClass([CellTableViewCell class]) indexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    //
    cell.titleLabel.text = self.titleArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.4];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

#pragma mark - CellTableViewCellDelegate

- (void)xxy_cellTableViewCellDelegateActionWithSender:(UIButton *)sender indexPath:(NSIndexPath *)indexPath{
    sender.selected = !sender.selected;
    CellTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (sender.selected) {
        [sender setImage:kXXYGetImage(@"xuanzhong") forState:UIControlStateNormal];
        cell.messageLabel.text = self.contentArr[indexPath.row];
    }else{
        [sender setImage:kXXYGetImage(@"weixuan") forState:UIControlStateNormal];
        cell.messageLabel.text = @"";
    }
    //
    [self.tableView reloadRow:indexPath.row inSection:0 withRowAnimation:UITableViewRowAnimationNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
