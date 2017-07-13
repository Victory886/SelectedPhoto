//
//  ViewController.m
//  SelectedPhoto
//
//  Created by 收付宝－胜利 on 16/4/28.
//  Copyright © 2016年 胜利_Terry. All rights reserved.
//

#import "ViewController.h"
#import "SLPhotos.h"
#import "HealthViewController.h"

#import <MessageUI/MessageUI.h>
#import <PhotosUI/PhotosUI.h>
#import "SLBluetooth.h"

@interface ViewController ()
<SLPhotosDelegate>

@property (nonatomic, copy) UIImageView *img;   //!< 图片

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    [self.view addSubview:self.img];
    
    self.navigationItem.title = @"touchesBegan";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    [self performSelector:@selector(message) withObject:self afterDelay:3];
    
    
    [self performSelector:@selector(goPhoto) withObject:self afterDelay:5];
    
    
}

- (void)goPhoto {
    
    PHLivePhotoView *photoView = [PHLivePhotoView new];
//    photoView.delegate = (id<PHLivePhotoViewDelegate>)self;
    photoView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:photoView];
    
    SLBluetooth *blue = [SLBluetooth new];
    [self.navigationController pushViewController:blue animated:YES];
    
}


- (void)goMessage {
    
    if ([MFMessageComposeViewController canSendText]) {
        
        MFMessageComposeViewController *vc = [MFMessageComposeViewController new];
        vc.recipients = @[@"123456789"];
        vc.body = @"你好我是测试代码";
        vc.navigationItem.title = @"我要发短信";
        vc.messageComposeDelegate = (id<MFMessageComposeViewControllerDelegate>)self;
        
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
}

#pragma mark ~~~~~~~ MFMessageComposeViewControllerDelegate ~~~~~~~
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    [self.navigationController dismissViewControllerAnimated:NO completion:^{
        
        switch (result) {
            case MessageComposeResultSent:
                NSLog(@"成功");
                break;
            case MessageComposeResultFailed:
                NSLog(@"失败");
                break;
            default:
                NSLog(@"取消");
                break;
        }
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch* touch = [[event allTouches] anyObject];
    
    if (touch.tapCount == 2) {
        
        HealthViewController *health = [[HealthViewController alloc] init];
        [self.navigationController pushViewController:health animated:YES];
        
    } else if (touch.tapCount == 1) {
        
        SLPhotos *photo = [[SLPhotos alloc] init];
        photo.delegate = self;
        photo.navVC = (UINavigationController *)self;
        photo.allowsEditing = YES;
    }
    
    
}

- (UIImageView *)img {
    
    if (!_img) {
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(50, 150, 100, 100)];
        img.backgroundColor = [UIColor orangeColor];
        img.contentMode = UIViewContentModeScaleAspectFit;
        _img = img;
    }
    return _img;
}


- (void)photosWithImgData:(NSData *)imgData {
    
    self.img.image = [UIImage imageWithData:imgData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
