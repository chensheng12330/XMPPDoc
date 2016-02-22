//
//  ListViewController.m
//  GifPlay4Badminton
//
//  Created by sherwin on 15-1-23.
//  Copyright (c) 2015年 sherwin. All rights reserved.
//

#import "ListViewController.h"
#import "SHWebViewController.h"

#define SH_LibraryDir ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0])
#define SH_FileMag ([NSFileManager defaultManager])

@interface ListViewController ()
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) NSString *imageHostPath;

@property (nonatomic, weak) SHWebViewController *webVC;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[NSURL URLWithString:@""]
    // Do any additional setup after loading the view.
    //[SH_LibraryDir stringByAppendingPathComponent:@"badm.bundle\/"]
    self.imageHostPath = [[NSBundle mainBundle] pathForResource:@"XMPP_DOC" ofType:@"bundle"];
    
    self.dataSource = [SH_FileMag subpathsAtPath:self.imageHostPath];
    
    self.title = @"XMPP协议列表";
    
    return;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    self.webVC = (SHWebViewController*) segue.destinationViewController;
}


#pragma mark - UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell.imageView setImage:[UIImage imageWithContentsOfFile:[self.imageHostPath stringByAppendingPathComponent:self.dataSource[indexPath.row]]]];
    [cell.imageView setFrame:CGRectMake(0, 0, 50, 50)];
    [cell.imageView setAutoresizesSubviews:NO];
    
    cell.textLabel.text = self.dataSource[indexPath.row]; //[NSString stringWithFormat:@"Cell %d", indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.webVC.gifImagePath = [self.imageHostPath stringByAppendingPathComponent:self.dataSource[indexPath.row]];
    self.webVC.title = self.dataSource[indexPath.row];
}

@end
