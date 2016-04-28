//
//  ViewController.m
//  SelectedPhoto
//
//  Created by 收付宝－胜利 on 16/4/28.
//  Copyright © 2016年 胜利_Terry. All rights reserved.
//

#import "ViewController.h"
#import "SLPhotos.h"

@interface ViewController ()
<SLPhotosDelegate>

@property (nonatomic, copy) UIImageView *img;   //!< 图片

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    [self.view addSubview:self.img];
    
    self.navigationItem.title = @"点击调用";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    SLPhotos *photo = [[SLPhotos alloc] init];
    photo.delegate = self;
    photo.navVC = (UINavigationController *)self;
    photo.allowsEditing = YES;
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
