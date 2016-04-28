//
//  SLPhotos.h
//  sign
//
//  Created by 收付宝－胜利 on 15/11/4.
//  Copyright (c) 2015年 收付宝－胜利. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@protocol SLPhotosDelegate <NSObject>

    /// 选择完图片之后
- (void)photosWithImgData:(NSData *)imgData;

@end

@interface SLPhotos : NSObject

@property (nonatomic, weak) id<SLPhotosDelegate>delegate;       //!< 代理方法
@property (nonatomic, strong) UINavigationController *navVC;    //!< 导航控制器
@property (nonatomic, assign) BOOL allowsEditing;               //!< 图片是否可以编辑
@property (nonatomic, assign) int alterBtnCount;                //!< alter按钮的个数




@end
