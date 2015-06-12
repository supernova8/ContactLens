//
//  DetailViewController.h
//  ContactLens
//
//  Created by Sonova Middleton on 6/11/15.
//  Copyright (c) 2015 supernova8productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic,strong) Contacts *currentContact;


@end
