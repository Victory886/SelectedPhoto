//
//  UIActionSheet+CH.m
//  NorthAmericaEducation
//
//  Created by Win on 15/4/8.
//  Copyright (c) 2015年 Win. All rights reserved.
//

#import "UIActionSheet+SL.h"

@implementation UIActionSheet (SL)
static ActionSheetDismissBlock _dismissBlock;
static ActionSheetCancelBlock _cancelBlock;

+ (UIActionSheet *)showActionSheetWithTitle:(NSString *)title
                          cancelButtonTitle:(NSString *)cancelButtonTitle
                           otherButtonTitle:(NSArray *)otherButtons
                                     inView:(UIView *)view
                                  onDismiss:(ActionSheetDismissBlock)dismissed
                                   onCancel:(ActionSheetCancelBlock)cancelled {
    
    _cancelBlock = [cancelled copy];
    _dismissBlock = [dismissed copy];
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title
                                                       delegate:[self self]
                                              cancelButtonTitle:cancelButtonTitle
                                         destructiveButtonTitle:nil
                                              otherButtonTitles: nil];
    for (NSString *buttonTitle in otherButtons) {
        [sheet addButtonWithTitle:buttonTitle];
    }
    [sheet showInView:view];
    return sheet;
}

+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [actionSheet cancelButtonIndex]) {
        _cancelBlock();
    } else {
        _dismissBlock((int)buttonIndex - 1);
    }
}

@end
