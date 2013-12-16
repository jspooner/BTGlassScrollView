//
//  BoxView.m
//  BTGlassScrollViewExample
//
//  Created by Jonathan Spooner on 12/15/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "BoxView.h"

@implementation BoxView

#define PADDING 5

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBoxBackground];
        [self buildHeader];
        [self sizeToFit];
    }
    return self;
}

-(void)buildHeader
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, PADDING, 310, 20)];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setText:@"Address & Directions"];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    [self addSubview:label];
}

-(void)initBoxBackground
{
    self.layer.cornerRadius = 3;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
}

#pragma mark - Overrides

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

//    return self.bounds.size;
    return CGSizeMake(w-PADDING, h+PADDING);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 1.0);
    
    CGContextMoveToPoint(context, PADDING, 30); //start at this point
    CGContextAddLineToPoint(context, self.bounds.size.width-PADDING, 30); //draw to this point
    
    // and now draw the Path!
    CGContextStrokePath(context);
}

@end
