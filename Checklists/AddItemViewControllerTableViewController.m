//
//  AddItemViewControllerTableViewController.m
//  Checklists
//
//  Created by 黄舸 on 15-3-9.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import "AddItemViewControllerTableViewController.h"

@interface AddItemViewControllerTableViewController ()

@end

@implementation AddItemViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)cancel:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender {
NSLog(@"当前⽂文本框中所输⼊入的内容是:%@",self.textField.text); [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}

-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil; }
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated]; [self.textField becomeFirstResponder];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if([newText length] >0){
        self.doneBarButton.enabled = YES; }else{
            self.doneBarButton.enabled = NO; }
    return YES;
}

@end
