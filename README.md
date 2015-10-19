# DKParseAuth

Simple Parse Authentication

# Installation

## [CocoaPods](https://cocoapods.org/)

``` ruby
platform :ios, '8.0'
pod 'DKParseAuth'
```

## Manual

Add the files in the DKParseAuth folder to your project.

## Usage

``` objc
// Add Parse authentication to your app with just a few lines

[[DKParseAuth sharedInstance] configureWithParseClientId:kParseClientId parseClientKey:kParseClientKey];

UIViewController *controller = [[DKParseAuth sharedInstance] authViewControllerWithPasswordLength:8 hud:nil successBlock:^(id user, BOOL signup) {
  NSLog(@"success 😎 %@ with user %@", signup?@"signup":@"login", user);        
}];
    
[self presentViewController:controller animated:YES completion:nil];
```

# Demo

DKParseAuth includes a demo project.

# Thanks

This project uses `Parse`, `ParseTwitterUtils` and [more](DKParseAuth.podspec).

# Contact

- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)

# License

DKParseAuth is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
