//
//  TrollStarMarkView.m
//  TrollStarMark
//
//  Created by Troll on 15/10/28.
//  Copyright © 2015年 Troll. All rights reserved.
//

#import "TrollStarMarkView.h"
#import "TrollStarView.h"

static CGFloat const star_blank_width = 5.0f;
static CGFloat const star_blank_top_bottom = 2.0f;

@interface TrollStarMarkView()<TrollStarViewDelegate>

@property (nonatomic, assign, readwrite) NSInteger starCount;
@property (nonatomic, assign) CGSize starSize;
@property (nonatomic, strong) NSMutableArray *starArray;
@property (nonatomic, assign, readwrite) NSInteger mark;
@property (nonatomic, assign) NSInteger moveOnMark;

@end

@implementation TrollStarMarkView

- (NSMutableArray *)starArray{
    if(!_starArray){
        _starArray = [NSMutableArray array];
    }
    
    return _starArray;
}

- (instancetype)initWithFrame:(CGRect)frame starCount:(NSInteger)count{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor orangeColor];
        _starCount = count;
        CGFloat width = (CGRectGetWidth(frame)-(count+1)*star_blank_width)/count;
        CGFloat height = CGRectGetHeight(frame)-2*star_blank_top_bottom;
        if(height < width){
            _starSize = CGSizeMake(height, height);
        }else{
            _starSize = CGSizeMake(width, width);
        }
        [self createStarView];
        
    }
    
    return self;
}

- (void)createStarView{
    for(NSInteger i=0; i<_starCount; i++){
        TrollStarView *starView = [[TrollStarView alloc] initWithFrame:CGRectMake((star_blank_width+_starSize.width)*i, (CGRectGetHeight(self.frame)-2*star_blank_top_bottom)>_starSize.height?(CGRectGetHeight(self.frame)-_starSize.height)/2.0:star_blank_top_bottom, _starSize.width, _starSize.height)];
        starView.delegate = self;
        starView.index = i;
        [self.starArray addObject:starView];
        [self addSubview:starView];
    }
}

- (void)markedToIndex:(NSInteger)index{
    for(NSInteger i=0; i<self.starArray.count; i++){
        TrollStarView *starView = self.starArray[i];
        if(i <= index){
            starView.ratio = 1;
            _moveOnMark = index;
        }else{
            starView.ratio = 0;
        }
        [starView setNeedsDisplay];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self];
    for(NSInteger i=0; i<self.starArray.count; i++){
        TrollStarView *starView = self.starArray[i];
        CGPoint starView_point = [self.layer convertPoint:pt toLayer:starView.layer];
        if([starView.layer containsPoint:starView_point]){
            [self markedToIndex:i];
            break;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _mark = _moveOnMark + 1;
}

#pragma mark - TrollStarViewDelegate

- (void)starView:(TrollStarView *)starView didClickOnAtIndex:(NSInteger)index{
    [self markedToIndex:index];
    _mark = index+1;
}

@end
