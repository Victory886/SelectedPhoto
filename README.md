# SelectedPhoto
图片选择器


@property (nonatomic, weak) id<SLPhotosDelegate>delegate;       //!< 代理方法

@property (nonatomic, strong) UINavigationController *navVC;    //!< 导航控制器

@property (nonatomic, assign) BOOL allowsEditing;               //!< 图片是否可以编辑

@property (nonatomic, assign) int alterBtnCount;                //!< alter按钮的个数

暂时先做了这些参数后期会慢慢更新上去。



使用非常方便
    SLPhotos *photo = [[SLPhotos alloc] init];
    
    photo.delegate = self;
    
    photo.navVC = (UINavigationController *)self;
    
    photo.allowsEditing = YES;
    
    
    
    /// 代理方法设置好就ok。
    - (void)photosWithImgData:(NSData *)imgData {
    
       self.img.image = [UIImage imageWithData:imgData];
    }
    
    
    
    Go   Go~~
    
    
    
