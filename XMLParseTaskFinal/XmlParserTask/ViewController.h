//
//  ViewController.h
//  XmlParserTask
//
//  Created by Greens on 6/23/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    NSXMLParser *xmlParser;
    NSMutableArray *title_array;
    NSMutableArray *pubDate_array;
     NSMutableArray *author_array;
    
    NSMutableString *title_str;
    NSMutableString *pub_date_str;
    NSMutableString *author_str;
   

    
}
@end

