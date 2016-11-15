//
//  HeaderView.m
//  ParallaxHeader
//
//  Created by sushrut dhanandhare on 08/11/16.
//  Copyright © 2016 Sushrut. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName{
    self = [super initWithFrame:frame];
    if (self) {
        containerView = [[UIView alloc]init];
        [self addSubview:containerView];
        [containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[containerView]|" options:0 metrics:nil views:@{@"containerView":containerView}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[containerView]|" options:0 metrics:nil views:@{@"containerView":containerView}]];

        containerLayoutConstraint = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
        
        imgView = [[UIImageView alloc]init];
        imgView.image = [UIImage imageNamed:imageName];
        imgView.backgroundColor = [UIColor whiteColor];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.clipsToBounds = YES;
        [containerView addSubview:imgView];
        [imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imgView]|" options:0 metrics:nil views:@{@"imgView":imgView}]];
        
        bottomLayoutConstraint = [NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [containerView addConstraint:bottomLayoutConstraint];
        
        heightLayoutConstraint  = [NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
        [containerView addConstraint:heightLayoutConstraint];
    
    }
    return self;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    containerLayoutConstraint.constant = scrollView.contentInset.top;
    float offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top);
    containerView.clipsToBounds = offsetY <= 0;
    bottomLayoutConstraint.constant = offsetY >= 0 ? 0 : -offsetY / 2;
    heightLayoutConstraint.constant = fmax(offsetY + scrollView.contentInset.top, scrollView.contentInset.top);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
