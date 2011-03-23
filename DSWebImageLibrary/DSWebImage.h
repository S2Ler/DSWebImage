//
//  DSWebImage.h
//  DSWebImage
//
//  Created by Alexander Belyavskiy on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSImageViewProtocol.h"

@protocol DSWebImageDelegate;

@interface DSWebImage : UIImageView<DSImageViewProtocol> {
  id<DSWebImageDelegate> delegate_;
  NSURL *url_;
}

- (id)initWithURL:(NSURL *)anURL;

@end
