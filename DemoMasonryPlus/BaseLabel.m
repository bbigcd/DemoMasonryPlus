//
//  BaseLabel.m
//  DemoMasonryPlus
//
//  Created by liushiq on 15/12/22.
//  Copyright © 2015年 chendi. All rights reserved.
//

#import "BaseLabel.h"

@implementation BaseLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGSize)intrinsicContentSize{
    CGSize size = [super intrinsicContentSize];
    NSLog(@"%@",NSStringFromCGSize(size));
    return size;
}
@end
