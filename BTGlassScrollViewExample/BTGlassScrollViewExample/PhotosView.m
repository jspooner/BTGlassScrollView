//
//  PhotosView.m
//  BTGlassScrollViewExample
//
//  Created by Jonathan Spooner on 12/16/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "PhotosView.h"

@implementation PhotosView

-(id)initWithTitle:(NSString*)title
{
    self = [super initWithTitle:title];
    if (self) {
        [self buildDemo];
        [self sizeToFit];
    }
    return self;
    
}

-(void)buildDemo
{
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"New", @"Popular"]];
    [segmentedControl setFrame:CGRectMake(5, 40, 300, 40)];
    [segmentedControl setTintColor:[UIColor whiteColor]];
    [segmentedControl setTitleTextAttributes:@{
                                               NSForegroundColorAttributeName: [UIColor whiteColor],
                                               NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:14]
                                               }
                                    forState:UIControlStateNormal];
    [segmentedControl setSelectedSegmentIndex:0];
    [self addSubview:segmentedControl];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 90, 300, 250)];
    [scrollView setPagingEnabled:YES];
    [scrollView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]]];
    UIImageView *secondImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    [secondImage setFrame:CGRectMake(300, 0, 300, 250)];
    [scrollView addSubview:secondImage];
    [scrollView setContentSize:CGSizeMake(600, 250)];
    [self addSubview:scrollView];

    UILabel *imageCount = [[UILabel alloc] initWithFrame:CGRectMake(5, 335, 300, 44)];
    [imageCount setText:@"1 of 2 images"];
    [imageCount setTextColor:[UIColor whiteColor]];
    [imageCount setTextAlignment:NSTextAlignmentCenter];
    [imageCount setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:14]];
    [imageCount setShadowColor:[UIColor blackColor]];
    [self addSubview:imageCount];

    UIButton *uploadButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 365, 300, 44)];
    [uploadButton setTitle:@"Upload Photos" forState:UIControlStateNormal];
    [self addSubview:uploadButton];
}

@end
