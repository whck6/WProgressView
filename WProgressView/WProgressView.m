//
//
//  Created by Wenhao Ho on 3/8/16.
//  Copyright © 2016 Edison lai. All rights reserved.
//

#import "WProgressView.h"

@interface WProgressView ()

@property (nonatomic) CAShapeLayer *shapeLayer;

@property (nonatomic) UILabel *progressLabel;

@end

@implementation WProgressView

- (void)initProgressView {
    _annular = YES;
    _progress = 0.0;
    _lineWidth = 6.0;
    
    self.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initProgressView];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initProgressView];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (_annular) {
        UIBezierPath *processBackgroundPath = [UIBezierPath bezierPath];
        processBackgroundPath.lineWidth = _lineWidth;
        processBackgroundPath.lineCapStyle = kCGLineCapRound;
        CGPoint center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
        CGFloat radius = (self.bounds.size.width - _lineWidth) / 2.0;
        CGFloat startAngle = 3 * (float)M_PI / 2;
        CGFloat endAngle = startAngle + (2.0 * (float)M_PI);
        [processBackgroundPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        UIColor *strokeColor = [UIColor lightGrayColor];
        [strokeColor setStroke];
        [processBackgroundPath stroke];
        
        // Draw progress
        UIBezierPath *processPath = [UIBezierPath bezierPath];
        processPath.lineCapStyle = kCGLineCapRound;
        processPath.lineWidth = _lineWidth;
        endAngle = startAngle + ((3.6 * _progress * 100.0 / 180.0) * (float)M_PI);
        [processPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        if (!_shapeLayer) {
            _shapeLayer = [CAShapeLayer layer];
            [self.layer addSublayer:_shapeLayer];
        }
        
        _shapeLayer.lineWidth = _lineWidth;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        if (_progress > 0.99) {
            _shapeLayer.strokeColor = [UIColor colorWithRed:1.0 green:0.84 blue:0.0 alpha:1.0].CGColor;
        } else if (_progress > 0.5) {
            _shapeLayer.strokeColor = [UIColor colorWithRed:0.6 green:0.8 blue:0.19 alpha:1.0].CGColor;
        } else {
            _shapeLayer.strokeColor = [UIColor darkGrayColor].CGColor;
        }
        
        _shapeLayer.path = processPath.CGPath;
        _shapeLayer.lineCap = kCALineCapRound;
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.fromValue = @(0);
        animation.duration = 1.0;
        [_shapeLayer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    }
    
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
        [self addSubview:_progressLabel];
    }
    
    _progressLabel.text = [NSString stringWithFormat:@"%.f%%", _progress * 100.0];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    [self setNeedsDisplayInRect:self.bounds];
}

@end
