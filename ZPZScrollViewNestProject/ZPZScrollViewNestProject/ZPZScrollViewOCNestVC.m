//
//  ZPZScrollViewOCNestVC.m
//  ZPZScrollViewNestProject
//
//  Created by zhoupengzu on 2018/4/25.
//  Copyright © 2018年 zhoupengzu. All rights reserved.
//

#import "ZPZScrollViewOCNestVC.h"

@interface ZPZScrollViewOCNestVC ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView * bacScrollView;
@property (nonatomic, strong) UIScrollView * childScrollView;
@property (nonatomic, strong) UIScrollView * hScrollView;

@end

@implementation ZPZScrollViewOCNestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configUI];
}

- (void)configUI {
    _bacScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _bacScrollView.backgroundColor = [UIColor redColor];
    _bacScrollView.delegate = self;
    _bacScrollView.alwaysBounceVertical = YES;
    [self.view addSubview:_bacScrollView];
    
    _childScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _childScrollView.backgroundColor = [UIColor greenColor];
    _childScrollView.delegate = self;
    [_bacScrollView addSubview:_childScrollView];
    _childScrollView.alwaysBounceVertical = YES;
    
    _hScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _childScrollView.frame.size.width, _childScrollView.frame.size.height)];
    _hScrollView.backgroundColor = [UIColor cyanColor];
    _hScrollView.pagingEnabled = YES;
    _hScrollView.delegate = self;
    _hScrollView.alwaysBounceHorizontal = YES;
    [_childScrollView addSubview:_hScrollView];
    _hScrollView.contentSize = CGSizeMake(_hScrollView.frame.size.width * 3, 0);
    {
        UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _hScrollView.frame.size.width, _hScrollView.frame.size.height - 20)];
        view1.backgroundColor = [UIColor orangeColor];
        [_hScrollView addSubview:view1];
        UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(_hScrollView.frame.size.width, 0, _hScrollView.frame.size.width, _hScrollView.frame.size.height - 40)];
        view2.backgroundColor = [UIColor purpleColor];
        [_hScrollView addSubview:view2];
        UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(_hScrollView.frame.size.width * 2, 0, _hScrollView.frame.size.width, _hScrollView.frame.size.height - 10)];
        view3.backgroundColor = [UIColor lightGrayColor];
        [_hScrollView addSubview:view3];
    }
    
    _bacScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_childScrollView.frame));
    //    _childScrollView.contentSize = CGSizeMake(0, [UIScreen mainScreen].bounds.size.height + 100);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _bacScrollView) {
        NSLog(@"%@--bacScrollView", NSStringFromCGPoint(scrollView.contentOffset));
    } else if (scrollView == _childScrollView) {
        NSLog(@"%@--childScrollView", NSStringFromCGPoint(scrollView.contentOffset));
    } else if (scrollView == _hScrollView) {
        NSLog(@"%@--hScrollView", NSStringFromCGPoint(scrollView.contentOffset));
    }
}
@end
