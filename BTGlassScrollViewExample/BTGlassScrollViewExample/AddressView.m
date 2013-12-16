//
//  AddressView.m
//  BTGlassScrollViewExample
//
//  Created by Jonathan Spooner on 12/15/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "AddressView.h"

@implementation AddressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildAddress];
        [self buildMapButtons];
        [self sizeToFit];
    }
    return self;
}

-(void)buildAddress
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 35, 310, 40)];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setNumberOfLines:2];
    [label setText:@"San Luis Rey River Trail\nOceanside, California"];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    [self addSubview:label];
}

-(void)buildMapButtons
{
    [self addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"address"]]];
}

@end
