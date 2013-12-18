//
//  SkateparkPage.m
//  BTGlassScrollViewExample
//
//  Created by Jonathan Spooner on 12/15/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "SkateparkPage.h"

@implementation SkateparkPage

#define PADDING 5
#define BOX_START_Y 140

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        boxes = [[NSMutableArray alloc] init];
        [self buildCustomView];
        [self sizeToFit];
    }
    return self;
}

-(void)addBox:(BoxView*)box
{
    [self addSubview:box];
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
    
    AddressView *box1 = [[AddressView alloc] initWithTitle:@"Address & Directions"];
    [self addBox:box1];
    
    PhotosView *box2 = [[PhotosView alloc] initWithTitle:@"Photos"];
    [self addBox:box2];

    MapView *box3 = [[MapView alloc] initWithTitle:@"Map"];
    [self addBox:box3];

    DescriptionView *box4 = [[DescriptionView alloc] initWithTitle:@"Description"];
    [self addBox:box4];

    BoxView *box5 = [[BoxView alloc] initWithTitle:@"Share"];
    [self addBox:box5];
}


/*
 * Position all of the boxes
 */
-(void)sizeToFit
{
    BoxView *lastBox = nil;
    for (int x = 0; x < [boxes count]; x++) {
//        NSLog(@"sizeToFit %@", [[boxes objectAtIndex:x] class] );
        if (x-1 >= 0) {
            lastBox = [boxes objectAtIndex:x-1];
        }
        BoxView *box = [boxes objectAtIndex:x];
        if (lastBox == nil) {
            [box setFrame:CGRectMake(0,
                                     BOX_START_Y,
                                     box.frame.size.width,
                                     box.frame.size.height)];
        } else {
            [box setFrame:CGRectMake(0,
                                     lastBox.frame.origin.y+lastBox.frame.size.height+PADDING,
                                     box.frame.size.width,
                                     box.frame.size.height)];
        }
    }
    [super sizeToFit];
}

-(CGSize)sizeThatFits:(CGSize)size
{
    float w = 0;
    float h = 0;
    
    for (UIView *v in [self subviews]) {
        float fw = v.frame.origin.x + v.frame.size.width;
        float fh = v.frame.origin.y + v.frame.size.height;
        w = MAX(fw, w);
        h = MAX(fh, h);
    }
    
    NSLog(@"SkateparkPage.sizeThatFits %f, %f", w-PADDING, h+PADDING);
    return CGSizeMake(w-PADDING, h+PADDING);
}
@end
