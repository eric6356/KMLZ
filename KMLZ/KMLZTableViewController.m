//
//  KMLZTableViewController.m
//  KMLZ
//
//  Created by ERIC on 14/11/2.
//  Copyright (c) 2014年 ERIC. All rights reserved.
//

#import "KMLZTableViewController.h"
#import "zwViewController.h"
#import "kmlzTableViewCell.h"

@interface KMLZTableViewController ()
@end

@implementation KMLZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[kmlzTableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    if (!_zw) {
        _zw = [[KMLZzw alloc]init];
    }
    
    
    
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    int scs = [self.zw.sections count];
    NSLog(@"sections:%d", scs);
    return scs;
    //    if (scs == 1) {
    //        return 0;
    //    }else{
    //        return scs;
    //    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"%d rows in section %d", [[self.zw.sections objectAtIndex:section]integerValue], section);
    return [[self.zw.sections objectAtIndex:section]integerValue];
}


- (kmlzTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    kmlzTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    int idx = 0;
    for (int i = 0; i<indexPath.section; i++) {
        idx += [[self.zw.sections objectAtIndex:i]integerValue];
    }
    cell.textLabel.text = [self.zw.titleArray objectAtIndex:(idx + indexPath.row)];
    cell.detailTextLabel.text = [self.zw.pvArray objectAtIndex:(idx + indexPath.row)];
    NSLog(@"index: %d", idx+indexPath.row);
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.zw.sectionTitle objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int idx = 0;
    for (int i = 0; i<indexPath.section; i++) {
        idx += [[self.zw.sections objectAtIndex:i]integerValue];
    }
    zwViewController *zwVC = [[zwViewController alloc]initWithText: [self.zw.zwArray objectAtIndex:(idx+indexPath.row)]];
    NSString *sct = [self.zw.sectionTitle objectAtIndex:indexPath.section];
    NSString *zwt =  [self.zw.titleArray objectAtIndex:(idx+indexPath.row)];
    zwVC.title = [NSString stringWithFormat:@"%@%@%@", sct, @"·", zwt];
    [self.navigationController pushViewController:zwVC animated:YES];
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
