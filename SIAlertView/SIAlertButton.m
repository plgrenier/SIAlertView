//
//  SIAlertButton.m
//  SIAlertView
//
//  Created by Kevin Cao on 13-4-29.
//  Copyright (c) 2013年 Sumi Interactive. All rights reserved.
//

#import "SIAlertButton.h"
#import "UIColor+SIAlertView.h"

@interface SIAlertButton ()

@property (strong, nonatomic) UIColor *color;

+ (UIColor *)colorForButtonType:(SIAlertViewButtonType)aType;

@end



@implementation SIAlertButton

@synthesize color;

#pragma mark - Initialization

+ (SIAlertButton *)alertButtonWithTitle:(NSString *)aTitle
                                   type:(SIAlertViewButtonType)aType
                                 action:(SIAlertViewHandler)anAction
                                   font:(UIFont *)aFont
                                    tag:(NSInteger)aTag
{
    SIAlertButton *button = [SIAlertButton buttonWithType:UIButtonTypeCustom];
    button.action = anAction;
	button.tag = aTag;
	button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    button.titleLabel.font = aFont;
	[button setTitle:aTitle forState:UIControlStateNormal];
    button.color = [SIAlertButton colorForButtonType:aType];
    if (aType == SIAlertViewButtonTypeFacebook) {
        [button setBackgroundImage:[UIImage imageNamed:@"fb_button.png"] forState:UIControlStateNormal];
    }
    return button;
}

+ (SIAlertButton *)alertButtonWithTitle:(NSString *)aTitle
                                  color:(UIColor *)aColor
                                 action:(SIAlertViewHandler)anAction
                                   font:(UIFont *)aFont
                                    tag:(NSInteger)aTag
{
    SIAlertButton *button = [SIAlertButton buttonWithType:UIButtonTypeCustom];
    button.action = anAction;
	button.tag = aTag;
	button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    button.titleLabel.font = aFont;
	[button setTitle:aTitle forState:UIControlStateNormal];
    button.color = aColor;
    return button;
}

#pragma mark - Setters

- (void)setColor:(UIColor *)newColor
{
    color = newColor;
    
    if([newColor si_isLightColor]) {
        [self setTitleColor:[UIColor colorWithWhite:0.35f alpha:1.0f] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithWhite:0.35f alpha:0.8f] forState:UIControlStateHighlighted];
    }
    else {
        [self setTitleColor:[UIColor colorWithWhite:1.0f alpha:1.0f] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.8f] forState:UIControlStateHighlighted];
    }
    
    [self setNeedsDisplay];
}

#pragma mark - Utilities
+ (UIColor *)colorForButtonType:(SIAlertViewButtonType)aType
{
    switch (aType) {
        case SIAlertViewButtonTypePrimary:
            return [UIColor colorWithHue:215.0f/360.0f saturation:0.82f brightness:0.84f alpha:1.0f];
        
        case SIAlertViewButtonTypeInfo:
            return [UIColor colorWithHue:194.0f/360.0f saturation:0.75f brightness:0.74f alpha:1.0f];
        
        case SIAlertViewButtonTypeSuccess:
            return [UIColor colorWithHue:116.0f/360.0f saturation:0.5f brightness:0.74f alpha:1.0f];
                    
        case SIAlertViewButtonTypeWarning:
            return [UIColor colorWithHue:35.0f/360.0f saturation:0.90f brightness:0.96f alpha:1.0f];
        
        case SIAlertViewButtonTypeDanger:
            return [UIColor colorWithHue:3.0f/360.0f saturation:0.76f brightness:0.88f alpha:1.0f];
        
        case SIAlertViewButtonTypeInverse:
            return [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.2f alpha:1.0f];
        
        case SIAlertViewButtonTypeTwitter:
            return [UIColor colorWithHue:212.0f/360.0f saturation:0.75f brightness:1.0f alpha:1.0f];
        
        case SIAlertViewButtonTypeFacebook:
            return [UIColor colorWithHue:220.0f/360.0f saturation:0.62f brightness:0.6f alpha:1.0f];
                    
        case SIAlertViewButtonTypePurple:
            return [UIColor colorWithHue:260.0f/360.0f saturation:0.45f brightness:0.75f alpha:1.0f];
        
        case SIAlertViewButtonTypeCancel:
            return [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.7f alpha:1.0f];
        
        case SIAlertViewButtonTypeOK:
        default:
            return [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.94f alpha:1.0f];
    }
}

#pragma mark - UIButton

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    UIColor *fill = (!self.highlighted) ? self.color : [self.color si_darkenColorWithValue:0.06f];
    CGContextSetFillColorWithColor(context, fill.CGColor);
    
    UIColor *border = (!self.highlighted) ? [self.color si_darkenColorWithValue:0.06f] : [self.color si_darkenColorWithValue:0.12f];
    CGContextSetStrokeColorWithColor(context, border.CGColor);
    
    CGContextSetLineWidth(context, 1.0f);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0.5f, 0.5f, rect.size.width-1.0f, rect.size.height-1.0f)
                                                    cornerRadius:3.5f];
    
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextRestoreGState(context);
}

@end
