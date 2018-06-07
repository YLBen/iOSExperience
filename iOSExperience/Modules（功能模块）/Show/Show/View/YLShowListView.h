//
//  YLShowListView.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLShowListView;
@protocol YLShowListViewDelegate <NSObject>
-(void)YLShowListView:(YLShowListView *)showListView WithTag:(NSString *)tag;

@end
@interface YLShowListView : UIView
@property(nonatomic,strong)NSArray *dataSouce;
@property(nonatomic,weak)id<YLShowListViewDelegate> delegate;
@property(nonatomic,strong)UITableView *tableView;
@end
