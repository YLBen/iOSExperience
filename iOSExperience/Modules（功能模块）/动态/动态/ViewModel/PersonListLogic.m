//
//  PersonListLogic.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/7/14.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "PersonListLogic.h"
//#import "GetWaterFallListAPI.h"
#import "PersonModel.h"

@interface PersonListLogic()
@property (nonatomic,copy) NSArray * imgArray;
@property (nonatomic,copy) NSArray * nickNameArray;
@property (nonatomic,copy) NSArray * hobbysArray;
@property (nonatomic,copy) NSArray * fromArray;
@end

@implementation PersonListLogic


-(instancetype)init{
    self = [super init];
    if (self) {
        _dataArray = @[].mutableCopy;
        _imgArray = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544753317&di=8668e1ac386d723ba139fa23d48f843c&imgtype=jpg&er=1&src=http%3A%2F%2Fy3.ifengimg.com%2Fa%2F2014_44%2Ffd9944f3217a56d.bmp",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544158713952&di=383f011dbdd689dfb3ed497a4ea20ee0&imgtype=0&src=http%3A%2F%2F2f.zol-img.com.cn%2Fproduct%2F126_501x2000%2F673%2FceOYMP0c3yklU.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544753559&di=34ecb72ce712db76a14a7ae7e3f7c165&imgtype=jpg&er=1&src=http%3A%2F%2Fhimg2.huanqiu.com%2Fattachment2010%2F2014%2F1218%2F20141218051316888.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544158898590&di=f30ed646fec52cd4bad30d20317005de&imgtype=0&src=http%3A%2F%2Fimages.shichai.cnfol.com%2Fcaiji%2F20181026%2F2f4267471ab893e60828b7e2cccad1fd.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544158951275&di=e0002a662c354b9abc3693ba1e61512d&imgtype=0&src=http%3A%2F%2Fy1.ifengimg.com%2Fd47e2ec01c553301%2F2013%2F0428%2Frdn_517d0f276d9f6.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544158983136&di=903aef15fad0be8dcb9c0f4ddab85032&imgtype=0&src=http%3A%2F%2Ftc.sinaimg.cn%2Fmaxwidth.800%2Ftc.service.weibo.com%2Fimages_blogchina_com%2F06494c5ff912e3450e9293c8c1b0fcc5.jpeg",@"http://img0.imgtn.bdimg.com/it/u=4250181148,722853480&fm=26&gp=0.jpg",@"http://img5.iqilu.com/c/u/2017/1204/thumb_950__1512346468333.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544159312289&di=0cf1773aa595fa60d96472451dfbaa88&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20180721%2F003b68f491504dd9a78df930dc1b1cae.jpeg",@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1330366243,3725524793&fm=26&gp=0.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544754500&di=87c2f634483d967d1d337aacea71e87f&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.cnmo-img.com.cn%2F1576_600x1000%2F1575093.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544755219&di=08d3a03b404082d06d9bf84dc7c03334&imgtype=jpg&er=1&src=http%3A%2F%2Fimage.kejixun.com%2F2015%2F1020%2F20151020055557809.jpg"];
        _nickNameArray = @[@"wyang",@"mafia",@"如是我闻",@"Heather",@"YoYo产品经理",@"尚里昂",@"非黑莫白"];
        _hobbysArray = @[@"来杭州也有几年了",@"人之初性本善，玩心眼都滚蛋",@"基本都是隔断房水费,电费一个月300多（我其他同事都是一个月100多点),这样看还不如多花点钱租更好点的,tooyoung too simple",@"弹琴，跳舞，书法，古筝，茶艺我都不会，我只会打王者荣耀",@"喜欢电影，音乐，旅游，爬山，徒步，淘宝，摄影，画画，话剧，美食，吹的我都累了",@"健身，游泳，阅读，打游戏",@"只想起这么多，想到再说"];
        _fromArray = @[@"北京 学生",@"上海 模特",@"青岛 美容师",@"四川 八线小演员",@"新疆 卖羊肉串的",@"东北 二人转演员"];
    }
    return self;
}

#pragma mark ————— 拉取数据 —————
-(void)loadData{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //模拟成功
        if (_page == 0) {
            [_dataArray removeAllObjects];
        }
        for (int i = 0; i < 10; i++) {
            
            PersonModel *model = [PersonModel new];
            model.picture = _imgArray[arc4random()%_imgArray.count];
            model.headImg = _imgArray[arc4random()%_imgArray.count];
            model.nickName = _nickNameArray[arc4random()%_nickNameArray.count];
            model.hobbys = _hobbysArray[arc4random()%_hobbysArray.count];
            model.age = @"28岁";
            model.city = _fromArray[arc4random()%_fromArray.count];
            model.juli = i%2==0 ? @"0.5km" : @"1800km";
            
            model.width = 150;
            model.height = 150;
            
            [_dataArray addObject:model];
        }
        if (self.delegagte && [self.delegagte respondsToSelector:@selector(requestDataCompleted)]) {
            [self.delegagte requestDataCompleted];
        }

    });
    
    //发起请求 示例
//    GetWaterFallListAPI *req = [GetWaterFallListAPI new];
//    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"请求成功");
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"请求失败 %@",req.message);
//    }];
}

@end
