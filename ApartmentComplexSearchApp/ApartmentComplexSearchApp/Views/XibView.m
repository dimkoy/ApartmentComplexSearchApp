//
//  HeaderView.m
//  ApartmentComplexSearchApp
//
//  Created by Dmitriy on 18/04/2018.
//  Copyright © 2018 Dmitriy. All rights reserved.
//

#import "XibView.h"

@interface XibView ()

@property (nonatomic, strong) UIView *loadedView;

@end

@implementation XibView

#pragma mark - Private (Static)

+ (UIView *)loadViewFromXIBWithOwner:(UIView *)ownerView frame:(CGRect)frame
{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
    UIView *loadedView = ([[nib instantiateWithOwner:ownerView options:nil] firstObject]);
    
    if (CGRectIsEmpty(frame))
    {
        ownerView.frame = CGRectMake(0, 0,
                                     CGRectGetWidth(loadedView.bounds),
                                     CGRectGetHeight(loadedView.bounds));
    }
    
    loadedView.frame = ownerView.bounds;
    loadedView.translatesAutoresizingMaskIntoConstraints = false;
    
    [ownerView addSubview:loadedView];
    
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:ownerView
                                                                  attribute:NSLayoutAttributeLeading
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:loadedView
                                                                  attribute:NSLayoutAttributeLeading
                                                                 multiplier:1.0
                                                                   constant:0.0];
    [ownerView addConstraint:leadingConstraint];
    
    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:ownerView
                                                                  attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:loadedView
                                                                  attribute:NSLayoutAttributeTrailing
                                                                 multiplier:1.0
                                                                   constant:0.0];
    [ownerView addConstraint:trailingConstraint];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:ownerView
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:loadedView
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:0.0];
    [ownerView addConstraint:topConstraint];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:ownerView
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:loadedView
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:0.0];
    [ownerView addConstraint:bottomConstraint];
    
    [ownerView setNeedsLayout];
    
    return loadedView;
}

#pragma mark - Public (Init)

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.loadedView = [self.class loadViewFromXIBWithOwner:self frame:frame];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.loadedView = [self.class loadViewFromXIBWithOwner:self frame:self.frame];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

@end
