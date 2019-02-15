//
//  VTAlertView.m
//  Vanthink_stu
//
//  Created by xiaolifeidao on 2019/1/10.
//  Copyright © 2019 MacBook. All rights reserved.
//

#import "VTAlertView.h"

@implementation VTAlertView

+(UIAlertController *)showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type textAlignment:(NSInteger)textAlignment withActionTitle:(NSString *)actionTitle{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(type? 1: ([VTAlertView getIsIpad] ? 1 : 0))];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    if (textAlignment != NSTextAlignmentCenter) {
        UIView *subView1 = alertController.view.subviews[0];
        UIView *subView2 = subView1.subviews[0];
        UIView *subView3 = subView2.subviews[0];
        UIView *subView4 = subView3.subviews[0];
        UIView *subView5 = subView4.subviews[0];
        // UILabel *title = subView5.subviews[0];//第一个是标题，
        //第二个是message
        UILabel *messag = subView5.subviews[1];
        //改变message的对齐方式
        messag.textAlignment = textAlignment;
    }
    
    return alertController;
}

+(UIAlertController *)showOneAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withActionTitle:(NSString *)actionTitle withDoneAction:(void(^)(void))doneAction{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(type? 1: ([VTAlertView getIsIpad] ? 1 : 0))];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (doneAction) {
            doneAction();
        }
    }];
    [alertController addAction:ok];
    
    if ([title isEqualToString:@"有新版本"]) {
        UIView *subView1 = alertController.view.subviews[0];
        UIView *subView2 = subView1.subviews[0];
        UIView *subView3 = subView2.subviews[0];
        UIView *subView4 = subView3.subviews[0];
        UIView *subView5 = subView4.subviews[0];
        // UILabel *title = subView5.subviews[0];//第一个是标题，
        //第二个是message
        UILabel *messag = subView5.subviews[1];
        //改变message的对齐方式
        messag.textAlignment = NSTextAlignmentLeft;
    }
    
    return alertController;
}

+(UIAlertController *)showOneActionOneCancelAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withActionTitle:(NSString *)actionTitle withOneAction:(void(^)(void))oneAction withCancelTitle:(NSString *)cancelTitle {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(type? 1: ([VTAlertView getIsIpad] ? 1 : 0))];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
    }];
    [alertController addAction:ok];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancel];
    
    return alertController;
}

+(UIAlertController *)showActionAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(void))oneAction withAnotherActionTitle:(NSString *)anotherActionTitle withAnotherAction:(void(^)(void))anotherAction{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(type? 1: ([VTAlertView getIsIpad] ? 1 : 0))];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:oneActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
    }];
    [alertController addAction:cancel];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:anotherActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (anotherAction) {
            anotherAction();
        }
    }];
    [alertController addAction:ok];
    return alertController;
}

+(UIAlertController *)showActionCancelAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(void))oneAction withAnotherActionTitle:(NSString *)anotherActionTitle withAnotherAction:(void(^)(void))anotherAction withCancelName:(NSString *)cancelName{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(type? 1: ([VTAlertView getIsIpad] ? 1 : 0))];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:oneActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
    }];
    [alertController addAction:ok];
    UIAlertAction *ok1 = [UIAlertAction actionWithTitle:anotherActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (anotherAction) {
            anotherAction();
        }
    }];
    [alertController addAction:ok1];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelName style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancel];
    return alertController;
}

+(UIAlertController *)showTextFieldWithPlaceholder:(NSString *)placeholder withText:(NSString *)text withSecureTextEntry:(BOOL)secureTextEntry  withTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(id response))oneAction withCancelName:(NSString *)cancelName{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(type? 1: ([VTAlertView getIsIpad] ? 1 : 0))];
    //定义第一个输入框；
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = text;
        textField.placeholder = placeholder;
        textField.secureTextEntry = secureTextEntry;
    }];
    //增加取消按钮；
    [alertController addAction:[UIAlertAction actionWithTitle:cancelName style:UIAlertActionStyleDefault handler:nil]];
    //增加确定按钮；
    [alertController addAction:[UIAlertAction actionWithTitle:oneActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction(alertController.textFields.firstObject);
        }
    }]];
    
    
    return alertController;
}

+(UIAlertController *)showThreeActionOneCancelAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(void))oneAction withTwoActionTitle:(NSString *)twoActionTitle withTwoAction:(void(^)(void))twoAction withThreeActionTitle:(NSString *)threeActionTitle withThreeAction:(void(^)(void))threeAction withCancelName:(NSString *)cancelName{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(type? 1: ([VTAlertView getIsIpad] ? 1 : 0))];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:oneActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
    }];
    [alertController addAction:ok];
    UIAlertAction *ok1 = [UIAlertAction actionWithTitle:twoActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (twoAction) {
            twoAction();
        }
    }];
    [alertController addAction:ok1];
    UIAlertAction *ok2 = [UIAlertAction actionWithTitle:threeActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (threeAction) {
            threeAction();
        }
    }];
    [alertController addAction:ok2];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelName style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancel];
    return alertController;
}

+(UIAlertController *)showFourActionOneCancelAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(void))oneAction withTwoActionTitle:(NSString *)twoActionTitle withTwoAction:(void(^)(void))twoAction withThreeActionTitle:(NSString *)threeActionTitle withThreeAction:(void(^)(void))threeAction withFourActionTitle:(NSString *)fourActionTitle withFourAction:(void(^)(void))fourAction withCancelName:(NSString *)cancelName{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(type? 1: ([VTAlertView getIsIpad] ? 1 : 0))];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:oneActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneAction) {
            oneAction();
        }
    }];
    [alertController addAction:ok];
    UIAlertAction *ok1 = [UIAlertAction actionWithTitle:twoActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (twoAction) {
            twoAction();
        }
    }];
    [alertController addAction:ok1];
    UIAlertAction *ok2 = [UIAlertAction actionWithTitle:threeActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (threeAction) {
            threeAction();
        }
    }];
    [alertController addAction:ok2];
    UIAlertAction *ok3 = [UIAlertAction actionWithTitle:fourActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (fourAction) {
            fourAction();
        }
    }];
    [alertController addAction:ok3];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelName style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancel];
    return alertController;
}

+ (BOOL)getIsIpad{
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType isEqualToString:@"iPhone"]) {
        //iPhone
        return NO;
    }else if([deviceType isEqualToString:@"iPod touch"]) {
        //iPod Touch
        return NO;
    }else if([deviceType isEqualToString:@"iPad"]) {
        //iPad
        return YES;
    }
    return NO;
}


@end
