//
//  MapView.m
//  BTGlassScrollViewExample
//
//  Created by Jonathan Spooner on 12/16/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "MapView.h"

@implementation MapView

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
    UIImageView *mapView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map"]];
    [mapView setFrame:CGRectMake(5, 5, 300, 250)];
    [self addSubview:mapView];

    UIButton *flagButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 255, 300, 44)];
    [flagButton setTitle:@"Flag Location" forState:UIControlStateNormal];
    [self addSubview:flagButton];
}

@end
