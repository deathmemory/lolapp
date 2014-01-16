//
//  dmTestRequestViewController.m
//  lolapp
//
//  Created by 解云飞 on 14-1-13.
//  Copyright (c) 2014年 解云飞. All rights reserved.
//

#import "dmTestRequestViewController.h"

@interface dmTestRequestViewController ()

@end

@implementation dmTestRequestViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gobtn:(id)sender {
    NSString *url = _textfield.text;
    NSLog(@"url : %@", url);
    [_webView loadWebPageWithString:url];
}

@end
