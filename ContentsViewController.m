//
//  ContentsViewController.m
//  lolapp
//
//  Created by 解云飞 on 14-1-16.
//  Copyright (c) 2014年 解云飞. All rights reserved.
//

#import "ContentsViewController.h"
#import "PullingRefreshTableView.h"
#import "ContentCell.h"
#import "CommentsViewController.h"
#import "tooles.h"

@interface ContentsViewController ()<PullingRefreshTableViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) PullingRefreshTableView *pullTableView;
@end

@implementation ContentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self.view setBackgroundColor:[UIColor clearColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"main_background.png"]]];
    CGRect bounds = self.view.bounds;
    bounds.size.height -= 44.f*2;   //底边边界
    self.pullTableView = [[PullingRefreshTableView alloc] initWithFrame:bounds pullingDelegate:self];
    _pullTableView.separatorStyle = UITableViewCellSeparatorStyleNone;  // 无边界线
    _pullTableView.backgroundColor = [UIColor clearColor];
    _pullTableView.dataSource = self;
    _pullTableView.delegate = self;
    [self.view addSubview:self.pullTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)loadData
{
     [tooles MsgBox:@"连接网络失败，请检查是否开启移动数据"];
    /*
     [self.tableView tableViewDidFinishedLoadingWithMessage:@"下面没有了.."];
     self.tableView.reachedTheEnd  = YES;
     */
    [self.pullTableView tableViewDidFinishedLoading];
    [self.pullTableView reloadData];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Contentidentifier = @"_ContentCELL";
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:Contentidentifier];
    if (cell == nil){
        //设置cell 样式
        cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Contentidentifier] ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        [cell.txtContent setNumberOfLines:12];
    }
    
//    QiuShi *qs = [self.list objectAtIndex:[indexPath row]];
    //设置内容
    cell.txtContent.text = @"test cotentstest cotentstest cotentstest cotentstest cotentstest cotentstest cotentstest cotents";     //qs.content;
    //设置图片
    cell.imgUrl = @"http://www.baidu.com/img/bdlogo.gif";   //qs.imageURL;
    cell.imgMidUrl = @"http://www.baidu.com/img/bdlogo.gif";   //qs.imageMidURL;
    //设置用户名

    cell.txtAnchor.text = @"匿名1";

    //设置标签
    cell.txtTag.text = @"节操";

        
    //设置up ，down and commits
    [cell.goodbtn setTitle:[NSString stringWithFormat:@"%d",123] forState:UIControlStateNormal];
    [cell.badbtn setTitle:[NSString stringWithFormat:@"%d",12] forState:UIControlStateNormal];
    [cell.commentsbtn setTitle:[NSString stringWithFormat:@"%d",11] forState:UIControlStateNormal];
    //自适应函数
    [cell resizeTheHeight];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{// 返回 cell 个数
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{// 设置 cell 高度
    return 270.f;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentsViewController *demoView=[[CommentsViewController alloc]initWithNibName:@"CommentsViewController" bundle:nil];
//    demoView.qs = [self.list objectAtIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.view.superview addSubview:demoView.view];
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view.superview cache:YES];
    
    [UIView commitAnimations];
}

#pragma mark - LoadPage
-(void) LoadPageOfQiushiType:(QiuShiType) type Time:(QiuShiTime) time
{
//    self.Qiutype = type;
//    self.QiuTime = time;
//    self.page =0;
//    [self.tableView launchRefreshing];
    [self.pullTableView launchRefreshing];
}

#pragma mark - PullingRefreshTableViewDelegate

- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView
{
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}

- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView{
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}

#pragma mark - Scroll

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.pullTableView tableViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.pullTableView tableViewDidEndDragging:scrollView];
}

@end
