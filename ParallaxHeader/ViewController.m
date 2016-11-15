//
//  ViewController.m
//  ParallaxHeader
//
//  Created by sushrut dhanandhare on 08/11/16.
//  Copyright © 2016 Sushrut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableVw.tableHeaderView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200) imageName:@"traffic.jpg"];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    HeaderView *headerView =(HeaderView*) _tableVw.tableHeaderView;
    [headerView scrollViewDidScroll:scrollView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld",(long)indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
