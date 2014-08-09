NSObject-Debounce
=================

How To Use
----------

just copy two files(NSObject+debounce.h NSObject+debounce.m) into your project.


    @implementation ViewController
    
    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
            
        }
        
        return self;
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


