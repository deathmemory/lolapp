//
//  dmMenuViewController.m
//  lolapp
//
//  Created by 解云飞 on 14-1-10.
//  Copyright (c) 2014年 解云飞. All rights reserved.
//

#import "dmMenuViewController.h"

@implementation dmMenuViewController
@synthesize cellIdentifier;

- (id)init
{
    return [super init];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    return [super initWithCoder:aDecoder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"Home";
            [cell.imageView setImage:[UIImage imageNamed:@"a"]];
        }
            break;
        case 1:
            cell.textLabel.text = @"ShareFrame";
            break;
        case 2:
            cell.textLabel.text = @"Messages";
            break;
        case 3:
            cell.textLabel.text = @"Notice";
            break;
        case 4:
            cell.textLabel.text = @"logOut";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* vc = nil;
    switch (indexPath.row) {
        case 0:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"dmHomeViewController"]; // 赋值示例标识符
            break;
        case 1:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"ContentsViewController"];
            break;
        case 2:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"dmFriendsViewController"];
            break;
        case 3:
            break;
        case 4:
            [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];   // 返回顶端开始界面
            break;
            
        default:
            break;
    }
    if (vc != nil) {
        [[SlideNavigationController sharedInstance] switchToViewController:vc withCompletion:nil];  // 根据示例标识符展现界面
    }
    
}

@end
