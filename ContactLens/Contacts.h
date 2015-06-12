//
//  Contacts.h
//  ContactLens
//
//  Created by Sonova Middleton on 6/11/15.
//  Copyright (c) 2015 supernova8productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contacts : NSManagedObject

@property (nonatomic, retain) NSString * contactFirstName;
@property (nonatomic, retain) NSString * contactMobilePhone;
@property (nonatomic, retain) NSString * contactHomePhone;
@property (nonatomic, retain) NSString * contactAddressStreet;
@property (nonatomic, retain) NSString * contactAddressCity;
@property (nonatomic, retain) NSString * contactAddressState;
@property (nonatomic, retain) NSString * contactAddressPostal;
@property (nonatomic, retain) NSString * contactAddressStreet2;
@property (nonatomic, retain) NSDate * contactBirthdayDate;
@property (nonatomic, retain) NSString * contactEmail;
@property (nonatomic, retain) NSData * contactImage;
@property (nonatomic, retain) NSDate * contactDateEntered;
@property (nonatomic, retain) NSDate * contactDateUpdated;
@property (nonatomic, retain) NSNumber * contactCategory;
@property (nonatomic, retain) NSString * contactLastName;

@end
