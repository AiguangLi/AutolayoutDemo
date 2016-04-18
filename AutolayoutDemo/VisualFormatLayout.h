//
//  VisualFormatLayout.h
//  AutolayoutDemo
//
//  Created by kimi on 16/4/18.
//  Copyright © 2016年 mooeen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VisualFormatLayout : NSObject

+ (void)autoLayout:(UIView *)superview visualFormats:(NSArray *)formats metrics:(NSDictionary *)metrics views:(NSDictionary *)views;

@end
