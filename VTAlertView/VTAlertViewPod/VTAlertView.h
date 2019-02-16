//
//  VTAlertView.h
//  Vanthink_stu
//
//  Created by xiaolifeidao on 2019/1/10.
//  Copyright © 2019 MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VTAlertView : NSObject
/**
 * 一个按钮 没有动作
 */
+(UIAlertController *)showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type textAlignment:(NSInteger)textAlignment withActionTitle:(NSString *)actionTitle;

/**
 * 一个按钮 一个动作
 */
+(UIAlertController *)showOneAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withActionTitle:(NSString *)actionTitle withDoneAction:(void(^)(void))doneAction;
/**
 * 一个按钮 一个取消 按钮有动作
 */
+(UIAlertController *)showOneActionOneCancelAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withActionTitle:(NSString *)actionTitle withOneAction:(void(^)(void))oneAction withCancelTitle:(NSString *)cancelTitle;
/**
 * 两个按钮 两个动作
 */
+(UIAlertController *)showActionAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(void))oneAction withAnotherActionTitle:(NSString *)anotherActionTitle withAnotherAction:(void(^)(void))anotherAction;
/**
 * 两个按钮 一个取消 按钮有动作
 */
+(UIAlertController *)showActionCancelAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(void))oneAction withAnotherActionTitle:(NSString *)anotherActionTitle withAnotherAction:(void(^)(void))anotherAction withCancelName:(NSString *)cancelName;
/**
 * 一个输入框 一个确认
 */
+(UIAlertController *)showTextFieldWithPlaceholder:(NSString *)placeholder withText:(NSString *)text withSecureTextEntry:(BOOL)secureTextEntry  withTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(id response))oneAction withCancelName:(NSString *)cancelName;
/**
 * 三个按钮 一个取消 按钮有动作
 */
+(UIAlertController *)showThreeActionOneCancelAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(void))oneAction withTwoActionTitle:(NSString *)twoActionTitle withTwoAction:(void(^)(void))twoAction withThreeActionTitle:(NSString *)threeActionTitle withThreeAction:(void(^)(void))threeAction withCancelName:(NSString *)cancelName;
/**
 * 四个按钮 一个取消 按钮有动作
 */
+(UIAlertController *)showFourActionOneCancelAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message withType:(NSInteger)type withOneActionTitle:(NSString *)oneActionTitle withOneAction:(void(^)(void))oneAction withTwoActionTitle:(NSString *)twoActionTitle withTwoAction:(void(^)(void))twoAction withThreeActionTitle:(NSString *)threeActionTitle withThreeAction:(void(^)(void))threeAction withFourActionTitle:(NSString *)fourActionTitle withFourAction:(void(^)(void))fourAction withCancelName:(NSString *)cancelName;
@end
