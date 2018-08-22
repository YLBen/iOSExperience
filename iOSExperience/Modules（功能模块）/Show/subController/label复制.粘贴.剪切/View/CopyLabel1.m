//
//  CopyLabel1.m
//  1111
//
//  Created by Ben Lv on 2018/8/22.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "CopyLabel1.h"
@interface CopyLabel1 ()

@property (nonatomic, strong) UIPasteboard *pasteBoard;

@end
@implementation CopyLabel1

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.numberOfLines = 0;
        [self attachLongPress];
        self.pasteBoard = [UIPasteboard generalPasteboard];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.numberOfLines = 0;
    [self attachLongPress];
    self.pasteBoard = [UIPasteboard generalPasteboard];
    
    
}

- (void)attachLongPress{
    self.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longPress];
}
- (void)longPress:(UILongPressGestureRecognizer *)sender {
    // 防止长按之后连续触发该事件
            if (sender.state == UIGestureRecognizerStateBegan) {
                [self becomeFirstResponder];
                UIMenuItem *copyMenuItem = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copyAction:)];
                UIMenuItem *pasteMenueItem = [[UIMenuItem alloc]initWithTitle:@"粘贴" action:@selector(pasteAction:)];
                UIMenuItem *cutMenuItem = [[UIMenuItem alloc]initWithTitle:@"剪切" action:@selector(cutAction:)];
                UIMenuController *menuController = [UIMenuController sharedMenuController];
                [menuController setMenuItems:[NSArray arrayWithObjects:copyMenuItem, pasteMenueItem,cutMenuItem, nil]];
                [menuController setTargetRect:self.frame inView:self.superview];
                [menuController setMenuVisible:YES animated:YES];
    
}
}


- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copyAction:)) {
        return YES;
    }
    if (action == @selector(pasteAction:)) {
        return YES;
    }
    if (action == @selector(cutAction:)) {
        return YES;
    }
    return NO; //隐藏系统默认的菜单项
}

- (void)copyAction:(id)sender {
    self.pasteBoard.string = self.text;
    NSLog(@"粘贴的内容为%@", self.pasteBoard.string);
}

- (void)pasteAction:(id)sender {
    self.text = self.pasteBoard.string;
}

- (void)cutAction:(id)sender  {
    self.pasteBoard.string = self.text;
    self.text = nil;
}



@end
