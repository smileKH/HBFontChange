//
//  HBTextViewVC.m
//  HBFontChange
//
//  Created by 胡明波 on 16/12/15.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "HBTextViewVC.h"

@interface HBTextViewVC ()
@property (nonatomic ,strong)UITextView *textView;
@end

@implementation HBTextViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"textView字体改变";
    [self addTextViewChangeSubView];
}
-(void)addTextViewChangeSubView{

    self.textView = [[UITextView alloc]initWithFrame:self.view.bounds];
    self.textView.text = @"个人简介：个人微信：humingbo88 \r\n \r\n 微信公众号：smileK \r\n \r\n 简书：明似水   地址：http://www.jianshu.com/users/965e70e698ec/latest_articles \r\n  \r\n 微博：明似水  地址：http://weibo.com/5823119395/profile?topnav=1&wvr=6&is_all=1";
    self.textView.font = Font(USERDEFAULT_float(CONTENT_FONT));
    [self.view addSubview:self.textView];
    
}

#pragma mark - 监听到字体改变
-(void)fontSizeChange{
    
    self.textView.font = Font(USERDEFAULT_float(CONTENT_FONT));
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
