//
//  HBFontChangeVC.m
//  HBFontChange
//
//  Created by 胡明波 on 16/12/15.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "HBFontChangeVC.h"
#import "HBTableCell.h"
#import "HBSetFontVC.h"

#import "HBLabelChangeVC.h"
#import "HBButtonChangeVC.h"
#import "HBTextViewVC.h"
@interface HBFontChangeVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)NSArray *dataArray;
@end

@implementation HBFontChangeVC
- (NSArray *)dataArray{

    if (!_dataArray) {
        _dataArray = @[@"label字体大小改变",@"button字体大小改变",@"textView字体改变"];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    
    self.title = @"全局改变字体大小";
    
    [super viewDidLoad];
    //添加table
    [self addTableView];
    //添加设置字体按钮
    [self addSetFontSizeButton];
    
}
#pragma mark - 监听到字体改变
-(void)fontSizeChange{

    NSLog(@"监听到字体改变");
    [self.tableView reloadData];
}
#pragma mark - 添加设置按钮
-(void)addSetFontSizeButton{

    //添加导航栏设置按钮和消息按钮
    UIButton * setBtn = [UIButton buttonWithType:0];
    setBtn.frame = CGRectMake(0, 0, 100, 35);
    [setBtn setTitle:@"设置字体" forState:UIControlStateNormal];
    [setBtn setBackgroundColor:[UIColor redColor]];
    [setBtn addTarget:self action:@selector(navRightBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * setRightBtn = [[UIBarButtonItem alloc]initWithCustomView:setBtn];
    self.navigationItem.rightBarButtonItem = setRightBtn;

}
-(void)navRightBtn{

    HBSetFontVC *vc = [[HBSetFontVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark- tableView
-(void)addTableView{

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"cell";
    HBTableCell *cell = nil;
    if (!cell) {
        cell = [[HBTableCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.titleString = self.dataArray[indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.tableView cellHeightForIndexPath:indexPath cellContentViewWidth:[self cellContentViewWith] tableView:tableView];
}
- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            HBLabelChangeVC *vc = [[HBLabelChangeVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 1:
        {
            HBButtonChangeVC *vc = [[HBButtonChangeVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            HBTextViewVC *vc = [[HBTextViewVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
