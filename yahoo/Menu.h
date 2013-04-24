//
//  Menu.h
//  yahoo
//
//  Created by 张 玺 on 13-4-23.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Menu;

@protocol MenuDelegate <NSObject>

-(void)menu:(Menu *)menu didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface Menu : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
}
@property(nonatomic,weak) id<MenuDelegate> delegate;
@end
