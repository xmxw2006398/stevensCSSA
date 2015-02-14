//
//  ShareViewController.h
//  Stevens
//
//  Created by weixiao on 2/13/15.
//  Copyright (c) 2015 wxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>
@interface ShareViewController : UIViewController
<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *postText;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
- (IBAction)selectImage:(id)sender;
- (IBAction)sendPost:(id)sender;
- (IBAction)btnClick:(id)sender;

@end
