//
//  Part4ViewController.m
//  Toeic
//
//  Created by NguyenThanhLuan on 13/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import "Part4ViewController.h"
#import "TLTableViewCell.h"

@interface Part4ViewController ()

@end

@implementation Part4ViewController{
    NSArray      *dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sideBarButton setTarget:revealViewController];
        [self.sideBarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [_tableview setDelegate:self];
    [_tableview setDataSource:self];
    
    [_tableview registerNib:[UINib nibWithNibName:@"TLTableViewCell" bundle:nil] forCellReuseIdentifier:@"idCellNormal"];
    
    NSString *metadataPath = [[NSBundle mainBundle] pathForResource:@"part4metadata" ofType:@"plist"];
    
    dataArr = [[NSArray alloc] initWithContentsOfFile:metadataPath];
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

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArr count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellNormal"];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.textColor = [UIColor grayColor];
    
    NSDictionary *item  = [dataArr objectAtIndex:indexPath.row];
    NSString *title     = [item objectForKey:@"name"];
    NSString *avate     = [item objectForKey:@"avata"];
    
    [cell setDisplayTitle:title];
    [cell setDisplayAvata:avate];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
