//
//  NLMineViewController.m
//  NiuLangSport
//
//  Created by shi ren on 2017/11/2.
//  Copyright © 2017年 shi ren. All rights reserved.
//

#import "NLMineViewController.h"
#import "NLMyNoteViewController.h"
#import "NLMyFansViewController.h"
#import "NLMineHeaderView.h"
#import "NLMineTableViewCell.h"
#import "NLMeModel.h"

@interface NLMineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *mineTB;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation NLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)configUI
{
    //我的课程
    NLMeModel *courseModel = [NLMeModel new];
    courseModel.imageURL = @"mine_icon_help";
    courseModel.name = @"我的课程";
    courseModel.meType = NL_ME_COURSE ;
    
    //我的卡
    NLMeModel *cardModel = [NLMeModel new];
    cardModel.imageURL = @"mine_icon_help";
    cardModel.name = @"我的会员卡";
    cardModel.meType = NL_ME_CARD ;
    
    NSArray *section1 = [NSArray arrayWithObjects:courseModel,cardModel,nil];
    
    //与我相关
    NLMeModel *aboutMe = [NLMeModel new];
    aboutMe.imageURL = @"mine_icon_help";
    aboutMe.name = @"与我相关";
    aboutMe.meType = NL_ME_ABOUT_ME ;
    
    //邀请好友
    NLMeModel *inviteFriendModel = [NLMeModel new];
    inviteFriendModel.imageURL = @"mine_icon_help";
    inviteFriendModel.name = @"邀请好友";
    inviteFriendModel.meType = NL_ME_FRIEND_INVITE;
    
    NSArray *section2 = [NSArray arrayWithObjects:aboutMe,inviteFriendModel,nil];
    
    //HealthKit
    NLMeModel *healthKitModel = [NLMeModel new];
    healthKitModel.imageURL = @"mine_icon_help";
    healthKitModel.name = @"HealthKit";
    healthKitModel.meType = NL_ME_HEALTHKIT ;
    
    NSArray *section3 = [NSArray arrayWithObjects:healthKitModel,nil];
    
    _dataArray = [NSMutableArray array];
    [_dataArray addObject:section1];
    [_dataArray addObject:section2];
    [_dataArray addObject:section3];
    
    [self addTableviewHeaderView];
    [_mineTB reloadData];
    
}

-(void)addTableviewHeaderView
{
    
    NLMineHeaderView *header = [[[NSBundle mainBundle]loadNibNamed:@"NLMineHeaderView" owner:self options:nil]lastObject];
    header.frame = (CGRect){0,64,SCREEN_W,190/375.0 *SCREEN_W};
    _mineTB.tableHeaderView = header ;
    
    _mineTB.tableFooterView = [UIView new];
    
    self.view.backgroundColor = RGBA(244, 244, 244, 1.0);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_dataArray[section]count] ;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return _dataArray.count ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10 ;
}
//此函数是循环执行的，每次执行后加载一个单元格，直到单元格加载完毕
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NLMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NLMineTableViewCell"];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NLMineTableViewCell" owner:self options:nil]lastObject];
        
    }
    if([_dataArray[indexPath.section] count] - 1 == indexPath.row){
        cell.lineView.hidden = YES;
    }else{
        cell.lineView.hidden = NO;
    }
    
      [cell configUI:_dataArray[indexPath.section][indexPath.row]];
    return cell ;
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [self.navigationController pushViewController:[NLMyFansViewController new] animated:YES];
    
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
