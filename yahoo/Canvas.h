//
//  Canvas.h
//  yahoo
//
//  Created by 张 玺 on 13-4-23.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Page.h"
#import "math.h"
#import "Menu.h"

@interface Canvas : UIViewController<PageDelegate,MenuDelegate,UIScrollViewDelegate>
{
    int count;
    UIScrollView *scroll;
    NSArray *pages;
    
    BOOL canDrag;
    float speed;
    CGPoint lastPoint;
    
}

-(void)showMenu;
-(void)hideMenu;

@end
