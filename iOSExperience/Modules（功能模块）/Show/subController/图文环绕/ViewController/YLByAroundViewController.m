//
//  YLByAroundViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/8/22.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLByAroundViewController.h"

@interface YLByAroundViewController ()
@property (nonatomic, strong) UITextView * textView;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation YLByAroundViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
     self.edgesForExtendedLayout=UIRectEdgeNone;
    [self.view addSubview:self.textView];
    [self.view addSubview:self.imageView];
    
    CGRect rect = CGRectMake(10, 0, 100, 100);
    
    //设置环绕的路径
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:rect];
    self.textView.textContainer.exclusionPaths = @[path];
    
    
}
#pragma mark - public methods

#pragma mark - private methods
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width-10 , [UIScreen mainScreen].bounds.size.height - 40 - 44 )];
        _textView.text = @"2008 年 11 月，中本聪发表了比特币的白皮书《比特币：一种点对点的电子现金系统》，接下来的时间中本聪实现了他所描述的比特币系统。2009 年 1 月 3 日，比特币网络正式开始运行。中本聪在创始区块中写道“The Times 03/Jan/2009 Chancellor on brink of second bailout for banks”。这句话有两层意义，第一层意思是表示了中本聪没有预先挖矿，毕竟这是当天泰晤士报的新闻，中本聪显然不可能预先获知泰晤士报将要报道些什么。通常对这句话第二层意思的解读是：认为中本聪嘲讽了当下的中心化银行体系。2009 年 1 月 9 日，Bitcoin v0.1 版本发布，12 日中本聪进行了第一次交易，这一次交易中，中本聪给海尔发送了 10 个比特币2009 年秋天, 一个叫“新自由标准”的用户通过 Paypal 支付了 5.02 美元，购买了 5050 个比特币，折合 0.000994 美元一个比特币，这是比特币和法币的第一次兑换。2009 年到 2010 年初，已经有一些其他的开发者被逐渐吸引过来，大家一起开发、维护、挖矿，那时候普通电脑还可以挖到比特币。2010 年 4 月, 一个叫拉斯诺的人发现可以使用 GPU 来挖比特币，5 月 22 日，他用挖到的比特币购买了两个比萨，共花费 10000BTC，这是比特币第一次被用于实物支付，也就是著名的比特币披萨事件。";
        _textView.font = [UIFont systemFontOfSize:15];
        _textView.editable = NO;
    }
    return _textView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"pi"];
        
        
    }
    return _imageView;
    
}

#pragma mark - getter && setter

#pragma mark - lazy loading




@end
