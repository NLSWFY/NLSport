//
//  NLMyNoteViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/4.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLMyNoteViewController.h"
#import "NLNoteTableViewCell.h"
@interface NLMyNoteViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *noteTB;

@end

@implementation NLMyNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的帖子" ;
    _noteTB.rowHeight = 532.0 ;
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3 ;
}
//此函数是循环执行的，每次执行后加载一个单元格，直到单元格加载完毕
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NLNoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NLNoteTableViewCell"];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NLNoteTableViewCell" owner:self options:nil]lastObject];
        
    }
    
    // [cell configUI:dataArr[indexPath.row]];
    return cell ;
    
    
    
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
