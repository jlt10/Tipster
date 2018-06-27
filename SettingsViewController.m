//
//  SettingsViewController.m
//  Tipster
//
//  Created by Jamie Tan on 6/26/18.
//  Copyright © 2018 codepath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)defaultChanged:(id)sender {
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    double defaultTip = [percentages[self.defaultControl.selectedSegmentIndex] doubleValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:defaultTip forKey:@"default_tip"];
    [defaults setInteger:self.defaultControl.selectedSegmentIndex forKey:@"default_idx"];
    [defaults synchronize];
}

@end
