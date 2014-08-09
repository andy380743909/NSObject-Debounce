//
//  ViewController.m
//  NSObjectDebounceDemo
//
//  Created by Cui Andy on 14-7-26.
//  Copyright (c) 2014年 Cui Andy. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+debounce.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
        
    }
    
    return self;
}

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

- (void)displayResultWithText:(NSString *)text{
    self.resultTextLabel.text = text;
}

#pragma mark Text Field Text Did Change Notification

- (void)textFieldTextDidChanged:(NSNotification *)notification{
    UITextField *textField = (UITextField *)[notification object];
    
    self.normalResultLabel.text = textField.text;
    [self debounceAction:@selector(displayResultWithText:) object:textField.text delay:0.5];
    
}

#pragma mark - UITextfieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    return YES;
}

@end
