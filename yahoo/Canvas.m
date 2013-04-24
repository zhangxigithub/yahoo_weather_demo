//
//  Canvas.m
//  yahoo
//
//  Created by 张 玺 on 13-4-23.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import "Canvas.h"
#import <QuartzCore/QuartzCore.h>

@implementation Canvas

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    count   = 6;
    canDrag = NO;
    
    Menu *menu = [[Menu alloc] initWithFrame:CGRectMake(0, 0, kContent_Width, kContent_Height)];
    menu.delegate = self;
    [self.view addSubview:menu];
    
    
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kPageWidth, kContent_Height)];
    scroll.delegate = self;

    
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.contentSize = CGSizeMake(kPageWidth*count, kContent_Height);
    scroll.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scroll];
    
    
    
    NSMutableArray *array = [NSMutableArray array];
    for(int i = 0;i<count;i++)
    {
        Page *page = [[Page alloc] initWithIndex:i];
        page.delegate = self;
        page.frame = CGRectMake(kPageWidth*i, 0, kContent_Width, kContent_Height);

        [scroll addSubview:page];
        
        [array addObject:page];
    }
    pages = array;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for(Page *page in pages)
    {
        [page moveBackgroundImage:scrollView.contentOffset.x];
    }
}
-(void)menu:(Menu *)menu didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ALERT(@"ok");
    [self hideMenu];
}
-(void)needShowMenu:(Page *)page
{
    [self showMenu];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint  point = [touch locationInView:self.view];
    lastPoint = point;
    
    if(point.x >290)
        canDrag = YES;
    else
        canDrag = NO;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(canDrag == NO) return;
    UITouch *touch = [touches anyObject];
    CGPoint  point = [touch locationInView:self.view];
    
    
    if(canDrag)
    {
        scroll.frame = CGRectMake(point.x<290?point.x:290,
                                  0,
                                  kPageWidth,
                                  kContent_Height);
        speed = (point.x-lastPoint.x);
        lastPoint = point;
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(canDrag == NO) return;
    
    UITouch *touch = [touches anyObject];
    CGPoint  point = [touch locationInView:self.view];
    
    if(point.x <150 || speed<-5)
    {
        scroll.userInteractionEnabled = NO;
        [UIView animateWithDuration:-2/speed
                         animations:^{
                             CGRect frame = scroll.frame;
                             frame.origin.x = 0;
                             scroll.frame = frame;
                         }];
        canDrag = NO;
        scroll.userInteractionEnabled = YES;
    }else
    {
        [self showMenu];
    }
}
-(void)showMenu
{
    scroll.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect frame = scroll.frame;
                         frame.origin.x = 290;
                         scroll.frame = frame;
                     }];
}
-(void)hideMenu
{
    scroll.userInteractionEnabled = YES;
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect frame = scroll.frame;
                         frame.origin.x = 0;
                         scroll.frame = frame;
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end








