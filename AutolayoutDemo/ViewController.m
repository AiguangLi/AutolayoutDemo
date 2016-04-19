//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by Aiguang Li on 16/4/18.
//  Email: Aiguang.Li@gmail.com
//  Github: https://github.com/AiguangLi/
//  Copyright © 2016年 mooeen. All rights reserved.
//

#import "ViewController.h"
#import "VisualFormatLayout.h"

@interface ViewController ()

@property (nonnull, nonatomic, strong) UIButton *loginButton;
@property (nonnull, nonatomic, strong) UIButton *registerButton;
@property (nonnull, nonatomic, strong) UITextField *usernameTextField;
@property (nonnull, nonatomic, strong) UITextField *passwordTextField;
@property (nonnull, nonatomic, strong) UIView *usernameLine;
@property (nonnull, nonatomic, strong) UIView *passwordLine;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self constructUIComponents];
    [self addUIConstraints];
}

-(void) constructUIComponents
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(doLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(doRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
    _usernameTextField = [[UITextField alloc]init];
    _usernameTextField.placeholder = @"Enter username";
    _usernameTextField.keyboardType = UIKeyboardTypeASCIICapable;
    [self.view addSubview:_usernameTextField];
    
    _passwordTextField = [[UITextField alloc]init];
    _passwordTextField.placeholder = @"Enter password";
    _passwordTextField.secureTextEntry = YES;
    [self.view addSubview:_passwordTextField];
    
    _usernameLine = [[UIView alloc]init];
    [_usernameLine setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
    [self.view addSubview:_usernameLine];
    
    _passwordLine = [[UIView alloc]init];
    [_passwordLine setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0]];
    [self.view addSubview:_passwordLine];
    
    UITapGestureRecognizer* resignKeyboardGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignKeyboard:)];
    [self.view addGestureRecognizer:resignKeyboardGesture];
}

-(void) doLoginButton:(id)sender
{
    NSLog(@"Login");
}

-(void) doRegisterButton:(id)sender
{
    NSLog(@"Register");
}

-(void) resignKeyboard:(id)sender
{
    if([_usernameTextField isFirstResponder]) {
        [_usernameTextField resignFirstResponder];
    }
    else if([_passwordTextField isFirstResponder]) {
        [_passwordTextField resignFirstResponder];
    }
    else {
        //do nothing
    }
}

-(void) addUIConstraints
{
    //Binding views to constraints in VFL
    NSDictionary *views = NSDictionaryOfVariableBindings(_loginButton, _registerButton, _usernameTextField,
                                                         _passwordTextField, _usernameLine, _passwordLine);
    //Constraints parameters, such as margin to super view, padding to neighbour view
    //HMT: horizontal margin of textfield, VM: vertical margin, VP:vertical padding
    //HMB: horizontal margin of button, HP: horizontal padding, HU:height of button and textfield
    //HLI: line height
    //metirc variable name can use any ASCII text, variable value must be a NSNumber class
    //[view]: the view must be binded in views, otherwise will cause an exception
    //"H:" means horisontal constraints
    //"V:" means vertical constaints
    //"|" means screen bounds
    NSDictionary *metrics = @{@"HMT":@20, @"VM":@40, @"VP":@10, @"HMB":@15, @"HP":@20, @"HU":@40, @"HLI":@1};
    NSArray *visualFormats = @[
                                @"H:|-HMT-[_usernameTextField]-HMT-|",
                                @"H:|-HMT-[_usernameLine]|",
                                @"H:|-HMT-[_passwordTextField]-HMT-|",
                                @"H:|[_passwordLine]|",
                                @"H:|-HMB-[_loginButton]-HP-[_registerButton(==_loginButton)]-HMB-|",
                                @"V:|-VM-[_usernameTextField(==HU)]-VP-[_usernameLine(==HLI)]-VP-[_passwordTextField(==HU)]-VP-[_passwordLine(==HLI)]-VP-[_loginButton(==HU)]",
                                @"V:[_passwordLine]-VP-[_registerButton(==HU)]"
                                ];
    [VisualFormatLayout autoLayout:self.view visualFormats:visualFormats metrics:metrics views:views];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
