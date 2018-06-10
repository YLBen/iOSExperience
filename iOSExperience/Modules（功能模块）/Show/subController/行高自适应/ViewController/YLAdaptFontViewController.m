//
//  YLAdaptFontViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/10.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLAdaptFontViewController.h"
#import "YLAdaptFontCell.h"
#import <Masonry.h>
@interface YLAdaptFontViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray<YLJParagraphModel *> *paragraphs;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation YLAdaptFontViewController

#pragma mark - life cycle
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = self.tableView.backgroundColor = [UIColor whiteColor];
    [self initConstraints];
    
}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    
    return title;
}
- (NSMutableArray<YLJParagraphModel *> *)paragraphs
{
    if(!_paragraphs)
    {
        NSArray *datas = [NSMutableArray arrayWithArray:@[@"罗永浩以一如既往的超红人气举办了锤子科技6周年新品发布会，次世代旗舰手机坚果R1声势浩大，引人瞩目。",@"当此之际，却有一些媒体和大v杀气腾腾的将罗永浩昔日个别话语断章截句、掐头去尾，仅凭个别字眼就认定罗永浩“精日”卖国，大肆污名谩骂，号召抵制锤子科技，实在是恶意构陷、愚弄民众。",@"爱国是高尚的，但每个人爱国的方式可以不同。制止他人滥用“支那”侮辱中国是爱国，罗永浩自许国际主义嘲讽国人劣习，反对滥用“印度阿三”也应该是爱国。抗议日本修改教科书歪曲历史是爱国，罗永浩指出国内历史课本的不实之处也应该是爱国。为中国的辉煌进步自豪是爱国，罗永浩标榜工匠精神，宣扬学习日本工业设计制造的文化精粹，创业参与国内手机市场竞争也是爱国。当然，要守法经营，依法纳税。而相反，远的如清末义和团滥杀教士、烧洋店、毁铁路，近的如西安打砸日产车主、青岛烧4s店，还有国产抗日神剧手斯鬼子等等，绝对不是爱国，而是误国殃民，愚弄民众。",@"罗永浩昔日赞赏日本美学文化、批评中国国民劣习的言论，尖刻过火之处指责争论皆可，却绝对没有“精日”卖国。如果杀气腾腾的罔顾罗永浩当时言论的语景、语义，盲目大扣“精日”卖国的污名，不过是历史上臭名昭彰“文字狱”手法，莫须有却杀人不见血。",@"我说侵略当然不好，但不能单看这坏的一面，另一面日本帮了我们中国的大忙。假如日本不占领大半个中国，中国人民不会觉醒起来。在这一点上，我们要感谢日本皇军。”——摘自《毛泽东外交文选》，如果指责罗永浩“精日”卖国的上述媒体、大V以同样手法来歪曲抹黑，可以构陷怎样悚人听闻、十恶不赦的污名？“文字狱”手法是中国历史上的恶之花，愿所有国人都思之慎之，锤粉锤黑都不要人云亦云，沦为乌合之众。实事求是的说，罗永浩已经从网络名人成功跨界为个性鲜明的科技企业家，而不是戏谑的手机界相声大师，其中艰辛和业绩让人敬佩。真心希望罗永浩的锤子科技越来赿好，因为这也是一个给年轻人励志的奇迹。当然，受他影响因他改变的年轻人已经很多很久了，我也算是其中一员，从阅读他曾经创办的嫣牛博开始的。"]];
        
        _paragraphs = [NSMutableArray array];
        
        [datas enumerateObjectsUsingBlock:^(NSString  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            YLJParagraphModel *pa = [[YLJParagraphModel alloc] init];
            pa.words = obj;
            NSDate *date = [NSDate date];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd ss"];
            [formatter setLocale:[NSLocale currentLocale]];
            NSString *dateString = [formatter stringFromDate:date];
            pa.date = dateString;
            [self->_paragraphs addObject:pa];
        }];
    }
    return _paragraphs;
}
#pragma mark - getter && setter

#pragma mark - lazy loading
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}
#pragma mark - dataSouce

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.paragraphs.count;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.paragraphs[indexPath.row].height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLAdaptFontCell *cell = [YLAdaptFontCell adaptFontCellWithTableView:tableView];
    
    cell.paragraph = self.paragraphs[indexPath.row];
    
    return cell;
}
@end
