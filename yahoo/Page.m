//
//  Page.m
//  yahoo
//
//  Created by 张 玺 on 13-4-23.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import "Page.h"

@implementation Page

-(id)initWithIndex:(int)aIndex
{
    self = [super initWithFrame:CGRectMake(0, 0, kContent_Width, kContent_Height)];
    if (self) {
        index = aIndex;
        self.clipsToBounds = YES;
    
        
        bg = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                           0,
                                                           440,
                                                           1200/2)];
        
        bg.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic%d.jpg",index%4]];
        [self addSubview:bg];
        
        
        scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, kContent_Width, kContent_Height-44)];
        scroll.delegate = self;
        scroll.decelerationRate = 0.1;



        scroll.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.6];
        scroll.backgroundColor = [UIColor clearColor];
        scroll.contentInset = UIEdgeInsetsMake(kContent_Height-160-44, 0, 0, 0);

        scroll.showsVerticalScrollIndicator = NO;
        scroll.contentSize = CGSizeMake(kContent_Width, kContent_Height+100);

        [self addSubview:scroll];
        
        
        
        UILabel *label= [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 160, 160)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = [NSString stringWithFormat:@"%d",index];
        label.font =[UIFont systemFontOfSize:100];
        [scroll addSubview:label];
        
        
        
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        menuButton.frame = CGRectMake(10, 10, 30, 30);
        [menuButton setImage:[UIImage imageNamed:@"sidebar_icon"]
                    forState:UIControlStateNormal];
        [menuButton addTarget:self
                       action:@selector(showMenu)
             forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:menuButton];
        
        
        loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, -150, kContent_Width, 150)];
        loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self addSubview:loadingView];
        
        
        
    }
    return self;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.y < -scrollView.contentInset.top)
    {
        float y = -scrollView.contentInset.top -scrollView.contentOffset.y;
        
        
        menuButton.frame  = CGRectMake(10, 10+y, 30, 30);
        loadingView.frame = CGRectMake(0, -150+y, kContent_Width, 150);
    }else if(scrollView.contentOffset.y < 0)
    {
        menuButton.frame  = CGRectMake(10, 10, 30, 30);
        loadingView.frame = CGRectMake(0, -150, kContent_Width, 150);
    }
}

-(void)moveBackgroundImage:(float)aIndex
{

    float distance = ((aIndex-index*kPageWidth)/3);

    
    if(distance < - 60) distance = -60;
    if(distance >   20) distance =  20;
        
    

    
    CGRect frame = bg.frame;
    frame.origin.x = distance;
    bg.frame = frame;
}
-(void)showMenu
{
    [self.delegate needShowMenu:self];
}



@end
