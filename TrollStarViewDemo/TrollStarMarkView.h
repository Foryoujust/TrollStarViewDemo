//
//  TrollStarMarkView.h
//  TrollStarMark
//
//  Created by Troll on 15/10/28.
//  Copyright © 2015年 Troll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrollStarMarkView : UIView

@property (nonatomic, assign, readonly) NSInteger starCount;
@property (nonatomic, assign, readonly) NSInteger mark;

- (instancetype)initWithFrame:(CGRect)frame starCount:(NSInteger)count;

@end
