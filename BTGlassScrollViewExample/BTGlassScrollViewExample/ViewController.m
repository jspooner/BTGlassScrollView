//
//  ViewController.m
//  BTGlassScrollViewExample
//
//  Created by Byte on 10/18/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#define SIMPLE_SAMPLE YES


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    BTGlassScrollView *_glassScrollView;
    
    UIScrollView *_viewScroller;
    BTGlassScrollView *_glassScrollView1;
    BTGlassScrollView *_glassScrollView2;
    BTGlassScrollView *_glassScrollView3;
    int _page;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _page = 0;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //showing white status
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //preventing weird inset
    [self setAutomaticallyAdjustsScrollViewInsets: NO];
    
    //navigation bar work
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowOffset:CGSizeMake(1, 1)];
    [shadow setShadowColor:[UIColor blackColor]];
    [shadow setShadowBlurRadius:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSShadowAttributeName: shadow};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.title = @"Alex Rd. Oceanside Skate Park";
//    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Share" style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.rightBarButtonItem = anotherButton;
    
    //background
    self.view.backgroundColor = [UIColor blackColor];
    
#warning Toggle this to see the more complex build of this version
    if (SIMPLE_SAMPLE) {
        //create your custom info views
//        UIView *view = [self customView];
        SkateparkPage *view = [[SkateparkPage alloc] initWithFrame:CGRectMake(0, 0, 320, 600)];
        
        _glassScrollView = [[BTGlassScrollView alloc] initWithFrame:self.view.frame
                                                    BackgroundImage:[UIImage imageNamed:@"background"]
                                                       blurredImage:nil
                                             viewDistanceFromBottom:120
                                                     foregroundView:view];
        
        [self.view addSubview:_glassScrollView];
    }else{
        CGFloat blackSideBarWidth = 2;
        
        _viewScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width + 2*blackSideBarWidth, self.view.frame.size.height)];
        [_viewScroller setPagingEnabled:YES];
        [_viewScroller setDelegate:self];
        [_viewScroller setShowsHorizontalScrollIndicator:NO];
        [self.view addSubview:_viewScroller];
        
        _glassScrollView1 = [[BTGlassScrollView alloc] initWithFrame:self.view.frame BackgroundImage:[UIImage imageNamed:@"background3"] blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customView]];
        _glassScrollView2 = [[BTGlassScrollView alloc] initWithFrame:self.view.frame BackgroundImage:[UIImage imageNamed:@"background2"] blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customView]];
        _glassScrollView3 = [[BTGlassScrollView alloc] initWithFrame:self.view.frame BackgroundImage:[UIImage imageNamed:@"background"] blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customView]];
        
        [_viewScroller addSubview:_glassScrollView1];
        [_viewScroller addSubview:_glassScrollView2];
        [_viewScroller addSubview:_glassScrollView3];
        
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    if (!SIMPLE_SAMPLE) {
        int page = _page; // resize scrollview can cause setContentOffset off for no reason and screw things up
        
        CGFloat blackSideBarWidth = 2;
        [_viewScroller setFrame:CGRectMake(0, 0, self.view.frame.size.width + 2*blackSideBarWidth, self.view.frame.size.height)];
        [_viewScroller setContentSize:CGSizeMake(3*_viewScroller.frame.size.width, self.view.frame.size.height)];
        
        [_glassScrollView1 setFrame:self.view.frame];
        [_glassScrollView2 setFrame:self.view.frame];
        [_glassScrollView3 setFrame:self.view.frame];
        
        [_glassScrollView2 setFrame:CGRectOffset(_glassScrollView2.bounds, _viewScroller.frame.size.width, 0)];
        [_glassScrollView3 setFrame:CGRectOffset(_glassScrollView3.bounds, 2*_viewScroller.frame.size.width, 0)];
        
        [_viewScroller setContentOffset:CGPointMake(page * _viewScroller.frame.size.width, _viewScroller.contentOffset.y)];
        _page = page;
    }
}

- (void)viewWillLayoutSubviews
{
    // if the view has navigation bar, this is a great place to realign the top part to allow navigation controller
    // or even the status bar
    if (SIMPLE_SAMPLE) {
        [_glassScrollView setTopLayoutGuideLength:[self.topLayoutGuide length]];
    }else{
        [_glassScrollView1 setTopLayoutGuideLength:[self.topLayoutGuide length]];
        [_glassScrollView2 setTopLayoutGuideLength:[self.topLayoutGuide length]];
        [_glassScrollView3 setTopLayoutGuideLength:[self.topLayoutGuide length]];
    }
}

- (UIView *)customView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1205)];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 310, 120)];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setNumberOfLines:4];
    [label setText:@"Alex Rd. Oceanside Skate Park"];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:50]];
    [label setShadowColor:[UIColor blackColor]];
    [label setShadowOffset:CGSizeMake(1, 1)];
    [view addSubview:label];
    
//    UIImageView *shareView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"share"]];
//    [shareView setFrame:CGRectMake(5, 125, 300, 50)];
//    [view addSubview:shareView];
    
    UIView *box1 = [[UIView alloc] initWithFrame:CGRectMake(5, 140, 310, 155)];
    box1.layer.cornerRadius = 3;
    box1.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
    [view addSubview:box1];
    [box1 addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"address"]]];
    
    UIView *box2 = [[UIView alloc] initWithFrame:CGRectMake(5, 300, 310, 380)];
    box2.layer.cornerRadius = 3;
    box2.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
    [view addSubview:box2];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"New", @"Popular"]];
    [segmentedControl setFrame:CGRectMake(5, 5, 300, 44)];
    [segmentedControl setTintColor:[UIColor whiteColor]];
    [segmentedControl setTitleTextAttributes:@{
                                               NSForegroundColorAttributeName: [UIColor whiteColor],
                                               NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:14]
                                               }
                                    forState:UIControlStateNormal];
    [segmentedControl setSelectedSegmentIndex:0];
    [box2 addSubview:segmentedControl];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 54, 300, 250)];
    [scrollView setPagingEnabled:YES];
    [scrollView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]]];
    UIImageView *secondImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    [secondImage setFrame:CGRectMake(300, 0, 300, 250)];
    [scrollView addSubview:secondImage];
    [scrollView setContentSize:CGSizeMake(600, 250)];
    [box2 addSubview:scrollView];
    
    UILabel *imageCount = [[UILabel alloc] initWithFrame:CGRectMake(5, 300, 300, 44)];
    [imageCount setText:@"1 of 2 images"];
    [imageCount setTextColor:[UIColor whiteColor]];
    [imageCount setTextAlignment:NSTextAlignmentCenter];
    [imageCount setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:14]];
    [imageCount setShadowColor:[UIColor blackColor]];
    [box2 addSubview:imageCount];
    
    UIButton *uploadButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 335, 300, 44)];
    [uploadButton setTitle:@"Upload Photos" forState:UIControlStateNormal];
    [box2 addSubview:uploadButton];
    
    UIView *box3 = [[UIView alloc] initWithFrame:CGRectMake(5, 690, 350, 300)];
    box3.layer.cornerRadius = 3;
    box3.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
    [view addSubview:box3];
    
    UIImageView *mapView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map"]];
    [mapView setFrame:CGRectMake(5, 5, 300, 250)];
    [box3 addSubview:mapView];

    UIButton *flagButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 255, 300, 44)];
    [flagButton setTitle:@"Flag Location" forState:UIControlStateNormal];
    [box3 addSubview:flagButton];
    

    UIView *box4 = [[UIView alloc] initWithFrame:CGRectMake(5, 995, 310, 150)];
    box4.layer.cornerRadius = 3;
    box4.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
    [view addSubview:box4];

    
    return view;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat ratio = scrollView.contentOffset.x/scrollView.frame.size.width;
    _page = (int)floor(ratio);
    NSLog(@"%i",_page);
    if (ratio > -1 && ratio < 1) {
        [_glassScrollView1 scrollHorizontalRatio:-ratio];
    }
    if (ratio > 0 && ratio < 2) {
        [_glassScrollView2 scrollHorizontalRatio:-ratio + 1];
    }
    if (ratio > 1 && ratio < 3) {
        [_glassScrollView3 scrollHorizontalRatio:-ratio + 2];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    BTGlassScrollView *glass = [self currentGlass];
    
    //can probably be optimized better than this
    //this is just a demonstration without optimization
    [_glassScrollView1 scrollVerticallyToOffset:glass.foregroundScrollView.contentOffset.y];
    [_glassScrollView2 scrollVerticallyToOffset:glass.foregroundScrollView.contentOffset.y];
    [_glassScrollView3 scrollVerticallyToOffset:glass.foregroundScrollView.contentOffset.y];
}

- (BTGlassScrollView *)currentGlass
{
    BTGlassScrollView *glass;
    switch (_page) {
        case 0:
            glass = _glassScrollView1;
            break;
        case 1:
            glass = _glassScrollView2;
            break;
        case 2:
            glass = _glassScrollView3;
        default:
            break;
    }
    return glass;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self viewWillAppear:YES];
}

@end
