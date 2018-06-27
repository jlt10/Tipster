//
//  ViewController.m
//  Tipster
//
//  Created by Jamie Tan on 6/26/18.
//  Copyright © 2018 codepath. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *infoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:0.15 forKey:@"default_tip"];
    double doubleValue = [defaults doubleForKey:@"default_tip"];
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip"];
    //self.tipControl.selectedSegmentIndex
    NSLog(@"View did appear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.mealBillField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage*bill;
    double total = bill+tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame = CGRectMake(self.mealBillField.frame.origin.x, self.mealBillField.frame.origin.y - 213, self.mealBillField.frame.size.width, self.mealBillField.frame.size.height);
        
        self.infoView.alpha = 1;
        
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.mealBillField.frame;
    newFrame.origin.y += 213;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame = newFrame;
        
        self.infoView.alpha = 0;
    }];
}

@end
