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
        //scroll.userInteractionEnabled = NO;
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
        
        loadingStatus = [[LoadingStatusView alloc] initWithFrame:CGRectMake(50, 100, 40, 40)];
        loadingStatus.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
        [loadingView addSubview:loadingStatus];
        loadingStatus.value = 0;
        
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(90, 100, kContent_Width-90*2, 40)];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont systemFontOfSize:25];
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor whiteColor];
        title.text = @"demo";
        [loadingView addSubview:title];
        
    }
    return self;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if(scrollView.contentOffset.y < -scrollView.contentInset.top)
    {
        float y = -scrollView.contentInset.top -scrollView.contentOffset.y;
        
        
        if(y>40)
        {
            float value = (y-40)*2/40;
            //NSLog(@"%f",value);
        loadingStatus.value = value;
        }
        menuButton.frame  = CGRectMake(10, 10+y, 30, 30);
        loadingView.frame = CGRectMake(0, -150+y, kContent_Width, 150);
        //scrollView.frame = CGRectMake(0, 44+y, kContent_Width, kContent_Height-44-y);
        
    }else if(scrollView.contentOffset.y < 0)
    {
        menuButton.frame  = CGRectMake(10, 10, 30, 30);
        loadingView.frame = CGRectMake(0, -150, kContent_Width, 150);
    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"%f",scrollView.contentOffset.y);
     //[scrollView setContentOffset:scrollView.contentOffset animated:NO];
    NSLog(@"end");
    if(scrollView.contentOffset.y+scrollView.contentInset.top<-59)
    {
        scrollView.delegate = nil;

        //[scrollView setContentOffset:CGPointMake(0, -316) animated:YES];
        [UIView animateWithDuration:0.3
                         animations:^{
                             menuButton.frame  = CGRectMake(10, 10+60, 30, 30);
                             loadingView.frame = CGRectMake(0, -150+60, kContent_Width, 150);
                         } completion:^(BOOL finished) {
                             //scroll.delegate = self;
                             scroll.frame = CGRectMake(0, 44+59, kContent_Width, kContent_Height-44);
                             UIEdgeInsets insets = scroll.contentInset;
                             insets.top -= 59;
                             scroll.contentInset = insets;
                         }];
        
        [self performSelector:@selector(finishLoad)
                   withObject:nil
                   afterDelay:2];
        
        //scrollView.frame = CGRectMake(0, 44+59+200, kContent_Width, kContent_Height-44-59);
        //scrollView.contentInset = UIEdgeInsetsMake(260, 0, 0, 0);
        //scrollView.bounces = NO;
        //scrollView.scrollEnabled = NO;
        //scrollView.userInteractionEnabled = NO;
        //[scrollView setContentOffset:CGPointMake(0, -300) animated:NO];
        //[scrollView scrollRectToVisible:CGRectMake(0, -200, 320, 200) animated:NO];
        //scrollView.delegate = self;
        //scrollView.contentOffset = scrollView.contentOffset;
        //scrollView.scrollEnabled = NO;
        //scrollView.contentOffset = CGPointMake(0, -300);
        //ALERT(@"ff");
    }
}
-(void)finishLoad
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         menuButton.frame  = CGRectMake(10, 10, 30, 30);
                         loadingView.frame = CGRectMake(0, -150, kContent_Width, 150);
                         
                         scroll.frame = CGRectMake(0, 44, kContent_Width, kContent_Height-44);
                         UIEdgeInsets insets = scroll.contentInset;
                         insets.top += 59;
                         scroll.contentInset = insets;
                         
                     } completion:^(BOOL finished) {
                         /*
                         scroll.frame = CGRectMake(0, 44-59, kContent_Width, kContent_Height-44);
                         UIEdgeInsets insets = scroll.contentInset;
                         insets.top += 59;
                         scroll.contentInset = insets;
                         */
                         scroll.delegate = self;
                     }];
    
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    startPoint = [touch locationInView:self];
//}
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self];
//    float moveDistance = point.y-startPoint.y;
//
//    CGPoint offset = scroll.contentOffset;
//    offset.y -= moveDistance;
//    scroll.contentOffset = offset;
//    
//    startPoint = point;
//}

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
