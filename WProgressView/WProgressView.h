//
//  WProgressView.h
//  WProgressView
//
//  Created by Wenhao Ho on 6/11/17.
//  Copyright © 2017 wstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for WProgressView.
FOUNDATION_EXPORT double WProgressViewVersionNumber;

//! Project version string for WProgressView.
FOUNDATION_EXPORT const unsigned char WProgressViewVersionString[];

IB_DESIGNABLE

@interface WProgressView : UIView

@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
@property (nonatomic, assign) IBInspectable CGFloat progress;
@property (nonatomic, assign) BOOL annular;

@end
