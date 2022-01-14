//
//  UIViewController+Present.m
//  changeIconTest
//
//  Created by 陈培爵 on 2022/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (AppIconPresent)

@end

NS_ASSUME_NONNULL_END


//#import "UIViewController+AppIconPresent.h"
#import <objc/runtime.h>

@implementation UIViewController (AppIconPresent)

+ (void)load {
    static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
            Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(lq_presentViewController:animated:completion:));
            
            method_exchangeImplementations(presentM, presentSwizzlingM);
        });
}

- (void)lq_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
//        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
//        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        }
    }
    
    [self lq_presentViewController:viewControllerToPresent animated:flag completion:completion];
}


@end
