//
//  SkateparkPage.m
//  BTGlassScrollViewExample
//
//  Created by Jonathan Spooner on 12/15/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "SkateparkPage.h"

@implementation SkateparkPage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        boxes = [[NSMutableArray alloc] init];
        [self buildCustomView];
    }
    return self;
}

-(void)addBox:(BoxView*)box
{
    BoxView *lastBox = [boxes lastObject];
    [self addSubview:box];
    if (lastBox != nil) {
        [box setFrame:CGRectMake(box.bounds.origin.x,
                                 lastBox.bounds.origin.y+lastBox.bounds.size.height+10,
                                 box.bounds.size.width,
                                 box.bounds.size.height)];
    }

    [boxes addObject:box];
}

- (void)buildCustomView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 310, 120)];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setNumberOfLines:4];
    [label setText:@"Alex Rd. Oceanside Skate Park"];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:50]];
    [label setShadowColor:[UIColor blackColor]];
    [label setShadowOffset:CGSizeMake(1, 1)];
    [self addSubview:label];
    
    AddressView *box1 = [[AddressView alloc] initWithFrame:CGRectMake(5, 140, 310, 100)];
    [self addBox:box1];
    
//    //    UIImageView *shareView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"share"]];
//    //    [shareView setFrame:CGRectMake(5, 125, 300, 50)];
//    //    [view addSubview:shareView];
//    
//    UIView *box1 = [[UIView alloc] initWithFrame:CGRectMake(5, 140, 310, 155)];
//    box1.layer.cornerRadius = 3;
//    box1.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
//    [self addSubview:box1];
//    [box1 addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"address"]]];
//
//    UIView *box2 = [[UIView alloc] initWithFrame:CGRectMake(5, 300, 310, 380)];
    BoxView *box2 = [[BoxView alloc] initWithFrame:CGRectMake(5, 5, 310, 120)];
    [self addBox:box2];
//    box2.layer.cornerRadius = 3;
//    box2.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
//    [self addSubview:box2];
//    
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"New", @"Popular"]];
//    [segmentedControl setFrame:CGRectMake(5, 5, 300, 44)];
//    [segmentedControl setTintColor:[UIColor whiteColor]];
//    [segmentedControl setTitleTextAttributes:@{
//                                               NSForegroundColorAttributeName: [UIColor whiteColor],
//                                               NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:14]
//                                               }
//                                    forState:UIControlStateNormal];
//    [segmentedControl setSelectedSegmentIndex:0];
//    [box2 addSubview:segmentedControl];
//    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 54, 300, 250)];
//    [scrollView setPagingEnabled:YES];
//    [scrollView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]]];
//    UIImageView *secondImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
//    [secondImage setFrame:CGRectMake(300, 0, 300, 250)];
//    [scrollView addSubview:secondImage];
//    [scrollView setContentSize:CGSizeMake(600, 250)];
//    [box2 addSubview:scrollView];
//    
//    UILabel *imageCount = [[UILabel alloc] initWithFrame:CGRectMake(5, 300, 300, 44)];
//    [imageCount setText:@"1 of 2 images"];
//    [imageCount setTextColor:[UIColor whiteColor]];
//    [imageCount setTextAlignment:NSTextAlignmentCenter];
//    [imageCount setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:14]];
//    [imageCount setShadowColor:[UIColor blackColor]];
//    [box2 addSubview:imageCount];
//    
//    UIButton *uploadButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 335, 300, 44)];
//    [uploadButton setTitle:@"Upload Photos" forState:UIControlStateNormal];
//    [box2 addSubview:uploadButton];
//    
//    UIView *box3 = [[UIView alloc] initWithFrame:CGRectMake(5, 690, 350, 300)];
//    box3.layer.cornerRadius = 3;
//    box3.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
//    [self addSubview:box3];
//    
//    UIImageView *mapView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map"]];
//    [mapView setFrame:CGRectMake(5, 5, 300, 250)];
//    [box3 addSubview:mapView];
//    
//    UIButton *flagButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 255, 300, 44)];
//    [flagButton setTitle:@"Flag Location" forState:UIControlStateNormal];
//    [box3 addSubview:flagButton];
//    
//    
//    UIView *box4 = [[UIView alloc] initWithFrame:CGRectMake(5, 995, 310, 150)];
//    box4.layer.cornerRadius = 3;
//    box4.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
//    [self addSubview:box4];
}

//-(void)resizeToFitSubviews
//{
//    float w = 0;
//    float h = 0;
//    
//    for (UIView *v in [self subviews]) {
//        float fw = v.frame.origin.x + v.frame.size.width;
//        float fh = v.frame.origin.y + v.frame.size.height;
//        w = MAX(fw, w);
//        h = MAX(fh, h);
//    }
//    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, w, h)];
//}

@end
