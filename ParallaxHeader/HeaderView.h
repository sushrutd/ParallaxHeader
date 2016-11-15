//
//  HeaderView.h
//  ParallaxHeader
//
//  Created by sushrut dhanandhare on 08/11/16.
//  Copyright © 2016 Sushrut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView
{
    UIView *containerView;
    UIImageView *imgView;
    NSLayoutConstraint *heightLayoutConstraint;
    NSLayoutConstraint *bottomLayoutConstraint;
    NSLayoutConstraint *containerLayoutConstraint;
}
-(id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;
-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
@end
