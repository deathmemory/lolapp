//
//  dmLoginViewController.m
//  lolapp
//
//  Created by 解云飞 on 14-1-17.
//  Copyright (c) 2014年 解云飞. All rights reserved.
//

#import "dmLoginViewController.h"
#import "SlideNavigationController.h"
#import "ASIHttpHeaders.h"
#import "tooles.h"
#import "CJSONDeserializer.h"

@interface dmLoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation dmLoginViewController

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
    [self.navigationController setNavigationBarHidden:YES];
    [self.userName becomeFirstResponder];
    [self.passWord setSecureTextEntry:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginClick:(id)sender {
    //表单提交前的验证
    if (_userName.text == nil||_passWord.text==nil||[_userName.text isEqualToString:@""]||[_passWord.text isEqualToString:@""] ) {
        [tooles MsgBox:@"用户名或密码不能为空！"];
		return;
    }
    
    //隐藏键盘
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
    //等待提示
    [tooles showHUD:@"正在登陆...."];
    // http:// 头必须加
	NSString *urlstr = [NSString stringWithFormat:@"%@", @"http://account.mkjogo.com/api/user/login?password=xinghen5&username=DeathMemory&sign=6467d3b7b1a5ac04e522867ce0d36615"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlstr]];
//	[request setTag:1];
	[request setDidFailSelector:@selector(GetErr:)];
	[request setDidFinishSelector:@selector(GetResult:)];
	[request setDelegate:self];
	[request startAsynchronous];
}

//获取请求结果
- (void)GetResult:(ASIHTTPRequest *)request{
	//取消登录状态
	[tooles removeHUD];
    NSData *data =[request responseData];
    //输出接收到的字符串
	NSString *str = [NSString stringWithUTF8String:[data bytes]];
    NSLog(@"%@",str);
    NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:data error:nil];
    NSString* result = [dictionary objectForKey:@"msg"];
    //判断是否登陆成功
    if ([result isEqual: @"SUCCESS"]) {
        NSString* info = [[dictionary objectForKey:@"result"] objectForKey:@"user_email"];
		[tooles MsgBox:info];
		return;
    }else{
		[tooles MsgBox:[dictionary objectForKey:@"msg"]];
		return;
	}
	
}

//连接错误调用这个函数
- (void) GetErr:(ASIHTTPRequest *)request{
    NSLog(request.error.debugDescription);
    [tooles removeHUD];
    [tooles MsgBox:@"网络错误,连接不到服务器"];
}


@end

