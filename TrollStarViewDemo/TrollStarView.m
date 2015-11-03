//
//  TrollStarView.m
//  TrollStarMark
//
//  Created by Troll on 15/10/28.
//  Copyright © 2015年 Troll. All rights reserved.
//

#import "TrollStarView.h"

#define Bottom_Left    1.0/5
#define Bottom_Right    4.0/5
#define Left_Right_Aside    5.0/13
#define X_Top_Left          5.0/13
#define X_Top_Right         8.0/13
#define Y_Bottom        5.0/8
#define X_Bottom_Left          5.0/16
#define X_Bottom_Right         11.0/16
#define Y_Bottom_Center        10.0/13
#define X_Bottom_Center        1.0/2

#define line_one_function(x) (-(10.0/3)*(x)+5.0/3)
#define line_two_function(x)    (10.0/3*(x)-5.0/3)
#define line_three_function(x)  (10.0/13*(x)+5./13)
#define line_four_function(x)  (-10.0/13*(x)+15.0/13)


@implementation TrollStarView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        [self addTapGesture];
    }
    
    return self;
}

- (void)addTapGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnStarView:)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
}

- (void)tapOnStarView:(UITapGestureRecognizer *)tap{
    
    if(_delegate && [_delegate respondsToSelector:@selector(starView:didClickOnAtIndex:)]){
        [_delegate starView:self didClickOnAtIndex:_index];
    }
}

- (void)drawRect:(CGRect)rect{
    
    /*
        line1: y=-(10/3)*x+5/3
        line2: y=10/3*x-5/3
        line3: y=10/13*x+5/13
        line4: y=-10/13*x+15/13
     */
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect frame = self.frame;
    
    if(_ratio<0){
        return;
    }else if(_ratio == 0){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);
        
        NSArray *points = @[[NSValue valueWithCGPoint:two_point],
                            [NSValue valueWithCGPoint:three_point],
                            [NSValue valueWithCGPoint:four_point],
                            [NSValue valueWithCGPoint:five_point],
                            [NSValue valueWithCGPoint:six_point],
                            [NSValue valueWithCGPoint:seven_point],
                            [NSValue valueWithCGPoint:eight_point],
                            [NSValue valueWithCGPoint:nine_point],
                            [NSValue valueWithCGPoint:ten_point]];
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
        
    }else if(_ratio<Bottom_Left){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_three_function(_ratio)));
        
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:@[[NSValue valueWithCGPoint:two_point],[NSValue valueWithCGPoint:three_point]] withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);
        CGPoint eleven_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        CGPoint twelve_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);
        
        NSArray *points = @[[NSValue valueWithCGPoint:four_point],
                            [NSValue valueWithCGPoint:five_point],
                            [NSValue valueWithCGPoint:six_point],
                            [NSValue valueWithCGPoint:seven_point],
                            [NSValue valueWithCGPoint:eight_point],
                            [NSValue valueWithCGPoint:nine_point],
                            [NSValue valueWithCGPoint:ten_point],
                            [NSValue valueWithCGPoint:eleven_point],
                            [NSValue valueWithCGPoint:twelve_point],
                            [NSValue valueWithCGPoint:three_point]];
        
        [self drawPathOnContenxt:context fromPoint:two_point toPoints:points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
        
    }else if(_ratio<X_Bottom_Left){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_three_function(_ratio)));
        
        NSArray *first_points = @[[NSValue valueWithCGPoint:two_point],
                                  [NSValue valueWithCGPoint:three_point]];
        
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:first_points withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_one_function(_ratio)));
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_four_function(_ratio)));
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        
        NSArray *second_points = @[[NSValue valueWithCGPoint:five_point],
                                 [NSValue valueWithCGPoint:six_point],
                                 ];
        
        [self drawPathOnContenxt:context fromPoint:four_point toPoints:second_points withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint eleven_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint twelve_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint thirteen_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        CGPoint fourteen_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);
        CGPoint fifteen_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);
        
        NSArray *blank_points = @[[NSValue valueWithCGPoint:seven_point],
                                  [NSValue valueWithCGPoint:eight_point],
                                  [NSValue valueWithCGPoint:nine_point],
                                  [NSValue valueWithCGPoint:ten_point],
                                  [NSValue valueWithCGPoint:eleven_point],
                                  [NSValue valueWithCGPoint:twelve_point],
                                  [NSValue valueWithCGPoint:thirteen_point],
                                  [NSValue valueWithCGPoint:fourteen_point],
                                  [NSValue valueWithCGPoint:five_point],
                                  [NSValue valueWithCGPoint:four_point],
                                  [NSValue valueWithCGPoint:fifteen_point],
                                  [NSValue valueWithCGPoint:three_point]];
        [self drawPathOnContenxt:context fromPoint:two_point toPoints:blank_points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
        
        
    }else if(_ratio<Left_Right_Aside){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_four_function(_ratio)));
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);
        
        NSArray *first_points = @[[NSValue valueWithCGPoint:two_point],
                                  [NSValue valueWithCGPoint:three_point],
                                  [NSValue valueWithCGPoint:four_point],
                                  [NSValue valueWithCGPoint:five_point]];
        
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:first_points withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint eleven_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        CGPoint twelve_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);

        NSArray *blank_point = @[[NSValue valueWithCGPoint:six_point],
                                 [NSValue valueWithCGPoint:seven_point],
                                 [NSValue valueWithCGPoint:eight_point],
                                 [NSValue valueWithCGPoint:nine_point],
                                 [NSValue valueWithCGPoint:ten_point],
                                 [NSValue valueWithCGPoint:eleven_point],
                                 [NSValue valueWithCGPoint:twelve_point],
                                 [NSValue valueWithCGPoint:three_point]];
        
        [self drawPathOnContenxt:context fromPoint:two_point toPoints:blank_point withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
    
    }else if(_ratio<X_Bottom_Center){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_one_function(_ratio)));
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_four_function(_ratio)));
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);
        
        NSArray *first_points = @[[NSValue valueWithCGPoint:two_point],
                                  [NSValue valueWithCGPoint:three_point],
                                  [NSValue valueWithCGPoint:four_point],
                                  [NSValue valueWithCGPoint:five_point],
                                  [NSValue valueWithCGPoint:six_point]];
        
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:first_points withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint eleven_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        CGPoint twelve_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);
        
        NSArray *blank_points = @[[NSValue valueWithCGPoint:seven_point],
                                  [NSValue valueWithCGPoint:eight_point],
                                  [NSValue valueWithCGPoint:nine_point],
                                  [NSValue valueWithCGPoint:ten_point],
                                  [NSValue valueWithCGPoint:eleven_point],
                                  [NSValue valueWithCGPoint:twelve_point],
                                  [NSValue valueWithCGPoint:four_point]];
        
        [self drawPathOnContenxt:context fromPoint:three_point toPoints:blank_points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
    
    }else if(_ratio<X_Top_Right){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_two_function(_ratio)));
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_three_function(_ratio)));
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);
        
        NSArray *first_points = @[[NSValue valueWithCGPoint:two_point],
                                  [NSValue valueWithCGPoint:three_point],
                                  [NSValue valueWithCGPoint:four_point],
                                  [NSValue valueWithCGPoint:five_point],
                                  [NSValue valueWithCGPoint:six_point],
                                  [NSValue valueWithCGPoint:seven_point],
                                  [NSValue valueWithCGPoint:eight_point]];
        
        
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:first_points withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint eleven_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint twelve_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        
        NSArray *blank_points = @[[NSValue valueWithCGPoint:nine_point],
                                  [NSValue valueWithCGPoint:ten_point],
                                  [NSValue valueWithCGPoint:eleven_point],
                                  [NSValue valueWithCGPoint:twelve_point],
                                  [NSValue valueWithCGPoint:five_point]];
        
        [self drawPathOnContenxt:context fromPoint:four_point toPoints:blank_points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
        
    }else if(_ratio<X_Bottom_Right){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_three_function(_ratio)));
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);
        
        NSArray *first_points = @[[NSValue valueWithCGPoint:two_point],
                                  [NSValue valueWithCGPoint:three_point],
                                  [NSValue valueWithCGPoint:four_point],
                                  [NSValue valueWithCGPoint:five_point],
                                  [NSValue valueWithCGPoint:six_point],
                                  [NSValue valueWithCGPoint:seven_point],
                                  [NSValue valueWithCGPoint:eight_point],
                                  [NSValue valueWithCGPoint:nine_point]];
        
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:first_points withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint eleven_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint twelve_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        
        NSArray *blank_points = @[[NSValue valueWithCGPoint:ten_point],
                                  [NSValue valueWithCGPoint:eleven_point],
                                  [NSValue valueWithCGPoint:twelve_point],
                                  [NSValue valueWithCGPoint:six_point]];
        
        [self drawPathOnContenxt:context fromPoint:five_point toPoints:blank_points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
        
    }else if(_ratio<Bottom_Right){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_four_function(_ratio)));
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_two_function(_ratio)));
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_three_function(_ratio)));
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);
        CGPoint elevent_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        CGPoint twelve_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);
        
        NSArray *first_points = @[[NSValue valueWithCGPoint:two_point],
                                  [NSValue valueWithCGPoint:three_point],
                                  [NSValue valueWithCGPoint:four_point],
                                  [NSValue valueWithCGPoint:five_point],
                                  [NSValue valueWithCGPoint:six_point],
                                  [NSValue valueWithCGPoint:seven_point],
                                  [NSValue valueWithCGPoint:eight_point],
                                  [NSValue valueWithCGPoint:nine_point],
                                  [NSValue valueWithCGPoint:ten_point],
                                  [NSValue valueWithCGPoint:elevent_point],
                                  [NSValue valueWithCGPoint:twelve_point]];
        
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:first_points withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint thirteen_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        
        NSArray *first_blank_points = @[[NSValue valueWithCGPoint:thirteen_point],
                                        [NSValue valueWithCGPoint:six_point]];
        
        [self drawPathOnContenxt:context fromPoint:five_point toPoints:first_blank_points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint fourteen_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        
        NSArray *second_blank_points = @[[NSValue valueWithCGPoint:fourteen_point],
                                         [NSValue valueWithCGPoint:nine_point]];
        
        [self drawPathOnContenxt:context fromPoint:eight_point toPoints:second_blank_points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
        
    }else if(_ratio<=1){
        CGPoint one_point = CGPointMake(0, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint two_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Left, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint three_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, 0);
        CGPoint four_point = CGPointMake(CGRectGetWidth(frame)*X_Top_Right, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint five_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*Left_Right_Aside);
        CGPoint six_point = CGPointMake(CGRectGetWidth(frame)*_ratio, CGRectGetHeight(frame)*(line_four_function(_ratio)));
        CGPoint seven_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Right, CGRectGetHeight(frame)*Y_Bottom);
        CGPoint eight_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Right, CGRectGetHeight(frame));
        CGPoint nine_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Center, CGRectGetHeight(frame)*Y_Bottom_Center);
        CGPoint ten_point = CGPointMake(CGRectGetWidth(frame)*Bottom_Left, CGRectGetHeight(frame));
        CGPoint elevent_point = CGPointMake(CGRectGetWidth(frame)*X_Bottom_Left, CGRectGetHeight(frame)*Y_Bottom);

        
        NSArray *first_points = @[[NSValue valueWithCGPoint:two_point],
                                  [NSValue valueWithCGPoint:three_point],
                                  [NSValue valueWithCGPoint:four_point],
                                  [NSValue valueWithCGPoint:five_point],
                                  [NSValue valueWithCGPoint:six_point],
                                  [NSValue valueWithCGPoint:seven_point],
                                  [NSValue valueWithCGPoint:eight_point],
                                  [NSValue valueWithCGPoint:nine_point],
                                  [NSValue valueWithCGPoint:ten_point],
                                  [NSValue valueWithCGPoint:elevent_point]];
        
        [self drawPathOnContenxt:context fromPoint:one_point toPoints:first_points withLineWidth:1 fillColor:[UIColor redColor] strokeColor:[UIColor redColor]];
        
        CGContextSaveGState(context);
        
        CGPoint twelve_point = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame)*Left_Right_Aside);
        
        NSArray *blank_points = @[[NSValue valueWithCGPoint:twelve_point],
                                  [NSValue valueWithCGPoint:six_point]];
        
        [self drawPathOnContenxt:context fromPoint:five_point toPoints:blank_points withLineWidth:1 fillColor:nil strokeColor:[UIColor redColor]];
        
    }
}

- (void)drawPathOnContenxt:(CGContextRef)context
                 fromPoint:(CGPoint)startPoint
                 toPoints:(NSArray *)points
            withLineWidth:(CGFloat)lineWidth
                fillColor:(UIColor *)fillColor
              strokeColor:(UIColor *)strokeColor
{
    if(context == nil || points == nil || points.count == 0 || ((fillColor == nil)&&(strokeColor == nil))) return;
    if(lineWidth == 0){
        lineWidth = 1;
    }
    
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    for(NSValue *pt_value in points){
        CGPoint pt = [pt_value CGPointValue];
        CGContextAddLineToPoint(context, pt.x, pt.y);
    }
    CGContextClosePath(context);
    
    if(fillColor && strokeColor){
        CGContextSetFillColorWithColor(context, fillColor.CGColor);
        CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
        CGContextDrawPath(context, kCGPathFillStroke);
    }else{
        if(fillColor){
            CGContextSetFillColorWithColor(context, fillColor.CGColor);
            CGContextFillPath(context);
        }else if (strokeColor){
            CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
            CGContextStrokePath(context);
        }
    }
}

@end
