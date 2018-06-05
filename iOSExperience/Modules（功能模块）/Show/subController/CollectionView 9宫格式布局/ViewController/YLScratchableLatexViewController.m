//
//  YLScratchableLatexViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLScratchableLatexViewController.h"
// model
#import "YLScratchableLatexModel.h"
// View
#import "YLScratchableLatexView.h"
// ViewModel

// third party
#import <Masonry.h>


@interface YLScratchableLatexViewController ()
@property(nonatomic,strong)YLScratchableLatexView *myView;
@end

@implementation YLScratchableLatexViewController

#pragma mark - life cycle
-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myView];
    [self initConstraint];
}
#pragma mark - Lazy loading
-(YLScratchableLatexView *)myView
{
    if (!_myView) {
        _myView = [[YLScratchableLatexView alloc] init];
        _myView.dataSouce = [self getDataSouce];
    }
    return _myView;
}
#pragma mark - getter && setter
#pragma mark -  private methods
- (void)initConstraint
{
    [self.myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
-(NSArray *)getDataSouce
{

    NSArray *dicArr = @[@{
                            title : @"活动",
                            image : @"performance_action_activity"
                            },
                        @{
                            title : @"活动",
                            image : @"performance_action_activity"
                            },
                        @{
                            title : @"活动",
                            image : @"performance_action_activity"
                            },
                        @{
                            title : @"活动",
                            image : @"performance_action_activity"
                            },
                        @{
                            title : @"活动",
                            image : @"performance_action_activity"
                            },
                        @{
                            title : @"活动",
                            image : @"performance_action_activity"
                            }];
    NSArray *ModelArray = [YLScratchableLatexModel decodeFromDicArray:dicArr];
    return ModelArray;
}
@end
