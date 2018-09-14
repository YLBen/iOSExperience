//
//  YLMineDefaultCell.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/9/11.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLMineDefaultCell.h"
@interface YLMineDefaultCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *promptIcon;
@property (weak, nonatomic) IBOutlet UILabel *detaillabel;


@end

@implementation YLMineDefaultCell



#pragma mark - life cycle
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


#pragma mark - public methods

#pragma mark - private methods

//    NSDictionary *dic1 = @{@"icon":@"name",@"textLabel":@"昵称",@"promptIcon":@"右箭头",@"detaillabel":@"Ben"};
#pragma mark - getter && setter
- (void)setDataSouce:(NSDictionary *)dataSouce {
    _dataSouce = dataSouce;
    if (dataSouce[@"icon"]) {
        self.icon.image = [UIImage imageNamed:dataSouce[@"icon"]];
    }
    if (dataSouce[@"textLabel"]){
        self.titleLabel.text = dataSouce[@"textLabel"];
    }
     if (dataSouce[@"promptIcon"]){
        self.promptIcon.image = [UIImage imageNamed:dataSouce[@"promptIcon"]];
    }
     if (dataSouce[@"detaillabel"]){
        self.detaillabel.text = dataSouce[@"detaillabel"];
        
    }
    
}
#pragma mark - lazy loading



@end
