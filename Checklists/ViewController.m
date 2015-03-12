//
//  ViewController.m
//  Checklists
//
//  Created by 黄舸 on 15-3-9.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import "ViewController.h"
#import "ChecklistItem.h"

@interface ViewController ()

@end

@implementation ViewController{
    
    NSMutableArray *_items;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _items = [[NSMutableArray alloc]initWithCapacity:20];
    ChecklistItem *item;
    item = [[ChecklistItem alloc]init];
    item.text =@"观看嫦娥⻜飞天和⽟玉兔升空的视频"; item.checked = NO;
    [_items addObject:item];
    item = [[ChecklistItem alloc]init];
    item.text =@"了解Sony a7和MBP的最新价格"; item.checked = NO;
    [_items addObject:item];
    item = [[ChecklistItem alloc]init]; item.text =@"复习苍⽼老师的经典视频教程"; item.checked = NO;
    [_items addObject:item];
    item = [[ChecklistItem alloc]init]; item.text =@"去电影院看地⼼心引⼒力"; item.checked = NO;
    [_items addObject:item];
    item = [[ChecklistItem alloc]init]; item.text =@"看⻄西甲巴萨新败的⽐比赛回放"; item.checked = NO;
    [_items addObject:item];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count]; }

-(void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
 
    if(item.checked){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone; }
    
}
-(void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    UILabel *label = (UILabel *)[cell viewWithTag:1000]; label.text = item.text;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    ChecklistItem *item = _items[indexPath.row];
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath]; ChecklistItem *item = _items[indexPath.row];
    [item toggleChecked];
    [self configureCheckmarkForCell:cell withChecklistItem:item]; [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}




- (IBAction)addItem:(id)sender {
    
    NSInteger newRowIndex = [_items count]; ChecklistItem *item =[[ChecklistItem alloc]init];
    item.text = @"我是新来的菜⻦鸟,求照顾求虐"; item.checked = NO;
    [_items addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0]; NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil; }

-(void)tableView:(UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
