//
//  ViewController.m
//  NSObjectDebounceDemo
//
//  Created by Cui Andy on 14-7-26.
//  Copyright (c) 2014年 Cui Andy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextfieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    
    return YES;
}

@end
