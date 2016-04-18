# AutoLayoutDemo
An auto-layout demo for iOS using Visual Format Language

Visual Format Language (VFL) is very useful for iOS developers who like writing iPhone/iPad UI codes without XIB or Storyboard.

Though Apple Inc recommeds to use storyboard to construct UI, I don't like it. Reason as below:
1. Time to load storyboard file is long, especially when UI is complex.
2. Reusability is not good.

Using VFL is excellent for me, such as:
1. UI constraints parameters can be easily modified
2. Good reusability

#How to use
1. Construct your UI components using codes only (XIB also supported)
2. Write VFL to constraint UI components
3. Add VFL constraints to UI components

#Demo
The demo shows a common login UI, screenshot as below:
 <p>![image](https://github.com/AiguangLi/AutolayoutDemo/blob/master/screenshot.png)</p>
 The UI can work well when rotate the device.

#Sample code
    NSDictionary *views = NSDictionaryOfVariableBindings(_loginButton, _registerButton, _usernameTextField,
                                                         _passwordTextField, _usernameLine, _passwordLine);
                                                         
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
