//
//  UIActionSheet+SL.h
//  NorthAmericaEducation
//
//  Created by Win on 15/4/8.
//  Copyright (c) 2015年 Win. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (SL)

typedef void (^ActionSheetDismissBlock) (int buttonIndex);
typedef void (^ActionSheetCancelBlock) ();

+ (UIActionSheet *)showActionSheetWithTitle:(NSString *)title
                          cancelButtonTitle:(NSString *)cancelButtonTitle
                           otherButtonTitle:(NSArray *)otherButtons
                                     inView:(UIView *)view
                                  onDismiss:(ActionSheetDismissBlock)dismissed
                                   onCancel:(ActionSheetCancelBlock)cancelled;

@end
