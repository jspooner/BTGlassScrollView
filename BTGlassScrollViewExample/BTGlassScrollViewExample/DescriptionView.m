//
//  DescriptionView.m
//  BTGlassScrollViewExample
//
//  Created by Jonathan Spooner on 12/18/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "DescriptionView.h"

@implementation DescriptionView

-(id)initWithTitle:(NSString*)title
{
    self = [super initWithTitle:title];
    if (self) {
        [self buildDescription];
        [self sizeToFit];
    }
    
    return self;
}

-(void) buildDescription
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(5, 40, 300, 200)];
    NSString *myHTML = @"<html><body><h1>Hello, world!</h1><p>I have HTML Content which was being displayed in a UITextView. The next iteration of my app is display the HTML contents into a UIWebView. So I basically replaced my UITextView with UIWebView. However I could not figure out how to inset my HTML snippit into the view. It seems to need a URLRequest which I do not want. I have already stored the HTML content in memory and want to load and display it from memory.</p></body></html>";
    [webView loadHTMLString:myHTML baseURL:nil];
    [webView setDelegate:self];
    [self addSubview:webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView
{

    CGRect frame = aWebView.frame;
    frame.size.height = 1;
    aWebView.frame = frame;
    CGSize fittingSize = [aWebView sizeThatFits:CGSizeZero];
    frame.size = fittingSize;
    aWebView.frame = frame;

    [self sizeToFit];
    [self.superview sizeToFit];
    NSLog(@"size: %f, %f", fittingSize.width, fittingSize.height);
}



@end
