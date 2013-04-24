//
//  Page.h
//  yahoo
//
//  Created by 张 玺 on 13-4-23.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingStatusView.h"

#define kPageWidth 325.0f



@class Page;

@protocol PageDelegate <NSObject>

-(void)needShowMenu:(Page *)page;

@end

@interface Page : UIView<UIScrollViewDelegate>
{
    UIImageView *bg;
    int index;
    UIScrollView *scroll;
    
    
    UIButton *menuButton;
    UIView *loadingView;
    LoadingStatusView *loadingStatus;
    
    CGPoint startPoint;
}
-(id)initWithIndex:(int)index;
-(void)moveBackgroundImage:(float)aIndex;
//-()



@property(nonatomic,weak) id<PageDelegate> delegate;
@end
