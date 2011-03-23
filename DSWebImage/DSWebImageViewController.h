//
//  DSWebImageViewController.h
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DSWebImage;

@interface DSWebImageViewController : UIViewController
{
    
  DSWebImage *img;
}
@property (nonatomic, retain) IBOutlet DSWebImage *img;

@end
