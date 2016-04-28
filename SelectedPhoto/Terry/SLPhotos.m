//
//  SLPhotos.m
//  sign
//
//  Created by 收付宝－胜利 on 15/11/4.
//  Copyright (c) 2015年 收付宝－胜利. All rights reserved.
//

#import "SLPhotos.h"
#import "UIActionSheet+SL.h"


@interface SLPhotos ()
<UIImagePickerControllerDelegate,
 UINavigationControllerDelegate,
 UIActionSheetDelegate>{
    
    
}

@end

@implementation SLPhotos {
    
    UIViewController *ws;
}



- (id)init {
    
    self = [super init];
    if (self) {
        
        [self showWithViewController:self.navVC];
    }
    
    return self;
}



- (void)showWithViewController:(UINavigationController *)vc {
    
//    ws = vc;
    __weak SLPhotos *wws = self;
    [UIActionSheet showActionSheetWithTitle:nil
                          cancelButtonTitle:@"取消"
                           otherButtonTitle:@[@"拍照",@"从相册中选择"]
                                     inView:wws.navVC.view
                                  onDismiss:^(int buttonIndex) {
                                      if (buttonIndex == 1) {
                                          
                                          [self LocalPhoto]; /// 这里不应该这样使用，需要优化
                                      } else {
                                          
                                          [self takePhoto];
                                      }
                                  } onCancel:^{
                                      
                                  }];
    
}

    /// 打开相机
-(void)takePhoto {
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        
        NSString * mediaType = AVMediaTypeVideo;
        AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
        
        if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus != AVAuthorizationStatusDenied) {
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
                //设置拍照后的图片可被编辑
            picker.allowsEditing = self.allowsEditing;
            picker.sourceType = sourceType;
            [self.navVC presentViewController:picker animated:YES completion:nil];
        } else {
            
        }
    } else {
        
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

    /// 打开本地相册
-(void)LocalPhoto {
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
            //设置选择后的图片可被编辑
        picker.allowsEditing = self.allowsEditing;
        
        [self.navVC presentViewController:picker animated:YES completion:nil];
    } else {
        
        NSLog(@"模拟其中无法使用，请在真机中使用");
    }
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    [self.navVC dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"]) {
        
        //先把图片转成NSData
        UIImage* image;
            //[info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (picker.allowsEditing) {
            
            image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        } else {
            
            image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        }
        
//        data = UIImageJPEGRepresentation(image, .5);
        data = UIImagePNGRepresentation(image);
        
//        if (UIImagePNGRepresentation(image) == nil) {
//        } else {
//        }
        
//        //这里将图片放在沙盒的documents文件夹中
//        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//        
//        //文件管理器
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//
//        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
//        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
//        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        
        [self.delegate photosWithImgData:data];
        [self.navVC dismissViewControllerAnimated:YES completion:^{

        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self.navVC dismissViewControllerAnimated:YES completion:^{
    
        
    }];
}


@end
