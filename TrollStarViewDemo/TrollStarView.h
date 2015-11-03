//
//  TrollStarView.h
//  TrollStarMark
//
//  Created by Troll on 15/10/28.
//  Copyright © 2015年 Troll. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrollStarView;

@protocol TrollStarViewDelegate <NSObject>

@optional
- (void)starView:(TrollStarView *)starView didClickOnAtIndex:(NSInteger)index;

@end

@interface TrollStarView : UIView

@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *strokColor;
@property (nonatomic, assign) CGFloat ratio;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, weak) id<TrollStarViewDelegate>delegate;

@end


