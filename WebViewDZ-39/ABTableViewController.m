//
//  ABTableViewController.m
//  WebViewDZ-39
//
//  Created by Александр on 23.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import "ABTableViewController.h"
#import "ViewController.h"

@interface ABTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSDictionary *dataDictionary;

@end

@implementation ABTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *dataArray = @[@"Apple Watch.pdf", @"iPhone.pdf", @"MacBook Air.pdf", @"http://www.apple.com", @"http://developer.apple.com", @"http://vk.com/iosdevcourse"];
    
    NSMutableArray *urlArray = [NSMutableArray array];
    
    NSMutableArray *pdfArray = [NSMutableArray array];
    
    for (NSString *string in dataArray) {
        
        if([[string lowercaseString] hasPrefix:[@"http://" lowercaseString]]) {
            [urlArray addObject:string];
        } else {
             [pdfArray addObject:string];
        }
    }
    
    NSArray *objectsArray = @[pdfArray, urlArray];
    
    NSArray *keysArray = @[@"PDF", @"URL"];
    
    self.dataDictionary = [[NSDictionary alloc] initWithObjects:objectsArray forKeys:keysArray];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[self.dataDictionary allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *sectionKeys = [self.dataDictionary allKeys];
    NSString *currentKey = [sectionKeys objectAtIndex:section];
    NSArray *currentObjects = [self.dataDictionary objectForKey:currentKey];
    return currentObjects.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *sectionKeys = [self.dataDictionary allKeys];
    return [sectionKeys objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];

        NSString *string = [self stringFromDictionary:self.dataDictionary andIndexPath:indexPath];
       
        if([[string lowercaseString] hasPrefix:[@"http://" lowercaseString]]) {
            cell.textLabel.text = [string substringWithRange:NSMakeRange(7, [string length]-7)];
        } else {
            cell.textLabel.text = string;
        }
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    vc.stringViewController = [self stringFromDictionary:self.dataDictionary andIndexPath:indexPath];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSString*)stringFromDictionary:(NSDictionary*)dictionary andIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *sectionKeys = [dictionary allKeys];
    
    NSString *currentKey = [sectionKeys objectAtIndex:indexPath.section];
    
    NSArray *currentObjects = [dictionary objectForKey:currentKey];
    
    return [currentObjects objectAtIndex:indexPath.row];
}


@end
