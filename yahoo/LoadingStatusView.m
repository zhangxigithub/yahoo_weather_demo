//
//  LoadingStatusView.m
//  yahoo
//
//  Created by 张 玺 on 13-4-24.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import "LoadingStatusView.h"

@implementation LoadingStatusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setValue:(float)value
{
    _value = value;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    
    [[UIColor whiteColor] setStroke];
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(),4);
    
    
    [self drawArcFromCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
                     radius:self.bounds.size.width/2-2
                 startAngle:-PI/2
                   endAngle:2*PI*self.value-PI/2
                  clockwise:YES];
    
    

}

@end
