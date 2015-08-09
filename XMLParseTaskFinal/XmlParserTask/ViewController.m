//
//  ViewController.m
//  XmlParserTask
//
//  Created by Greens on 6/23/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "webViewController.h"
@interface ViewController ()<NSXMLParserDelegate>
{
     NSString *classElement;
    __weak IBOutlet UITableView *tableview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    title_array=[[NSMutableArray alloc]init];
    pubDate_array=[[NSMutableArray alloc]init];
    author_array=[[NSMutableArray alloc]init];
    
    
    xmlParser    =[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://nshipster.com/feed.xml"]];
    xmlParser.delegate  =self; 
    [xmlParser parse];
    
    
    [super viewDidLoad];
   
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    NSLog(@"The Elememnt is %@",elementName);
    
    classElement= elementName;
    if([elementName isEqualToString:@"item"])
    {
        title_str =[[NSMutableString alloc]init];
        pub_date_str=[[NSMutableString alloc]init];
        
        author_str=[[NSMutableString alloc]init];

        
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //NSLog(@"found characters");

        if([classElement isEqualToString:@"title"])
            
            
        {
            [title_str  appendString:string];
            
            
        }
        if([classElement isEqualToString:@"pubDate"])
            
            
        {
            [pub_date_str  appendString:string];
            
            
        }
        if([classElement isEqualToString:@"author"])
            
            
        {
            [author_str appendString:string];
            
        }
     
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //NSLog(@"end element");
    if([elementName isEqualToString:@"item"])
    {
        
        [title_array addObject:title_str];
        [pubDate_array addObject:pub_date_str];
        [author_array addObject:author_str];
      
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [title_array count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cust_Cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cust_Cell.text1.text=[title_array objectAtIndex:indexPath.row];
    cust_Cell.text2.text=[pubDate_array objectAtIndex:indexPath.row];
    cust_Cell.text3.text=[author_array objectAtIndex:indexPath.row];

        return  cust_Cell;

    


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    webViewController   *second=[self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    [self presentViewController:second animated:YES completion:nil];
    
   }
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 52)];
    headerView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:1.0f];

    headerView.layer.borderWidth = 1.0;
    UILabel* headerLabel = [[UILabel alloc] init];
    headerLabel.frame = CGRectMake(5, 2, tableView.frame.size.width - 5, 18);
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:16.0];
    headerLabel.text = @"Description";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:headerLabel];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    NSLog(@"hhdhj");
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 52)];
    [footerView setBackgroundColor:[UIColor blueColor]];
    UILabel* footerlabel = [[UILabel alloc] init];
    footerlabel.textColor = [UIColor redColor];
    footerlabel.textAlignment = NSTextAlignmentCenter;

    footerlabel.frame = CGRectMake(5, 2, tableView.frame.size.width - 5, 18);
    footerlabel.text =@"copyrights";
     [footerView addSubview:footerlabel];
    return footerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

