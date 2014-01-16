//
//  dmWebView.m
//  lolapp
//
//  Created by 解云飞 on 14-1-13.
//  Copyright (c) 2014年 解云飞. All rights reserved.
//

#import "dmWebView.h"

@implementation dmWebView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    id minit = [super initWithCoder:aDecoder];
    [self loadWebPageWithString:@"http://www.baidu.com/"];
    for(UIView *v in [[[self subviews] objectAtIndex:0] subviews])
    {
        if([v isKindOfClass:[UIImageView class]])
        {
            v.hidden = YES;
        }
    }
    return minit;
}

- (void)loadWebPageWithString:(NSString*)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    NSLog(urlString);
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self loadRequest:request];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

@end
