//
//  DetailViewController.m
//  ContactLens
//
//  Created by Sonova Middleton on 6/11/15.
//  Copyright (c) 2015 supernova8productions. All rights reserved.
//

#import "DetailViewController.h"

#import "AppDelegate.h"

@interface DetailViewController ()

@property (nonatomic,strong) AppDelegate *appDelegate;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UITextField *firstNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *lastNameTextField;

@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl *categorySegControl;

@property (nonatomic, weak) IBOutlet UILabel *phoneLabel;
@property (nonatomic, weak) IBOutlet UITextField *mobilePhoneTextField;
@property (nonatomic, weak) IBOutlet UITextField *homePhoneTextField;

@property (nonatomic, weak) IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) IBOutlet UITextField *emailTextField;

@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UITextField *addressStreetTextField;
@property (nonatomic, weak) IBOutlet UITextField *addressStreet2TextField;
@property (nonatomic, weak) IBOutlet UITextField *addressCityTextField;
@property (nonatomic, weak) IBOutlet UITextField *addressStateTextField;
@property (nonatomic, weak) IBOutlet UITextField *addressZipTextField;

@property (nonatomic, weak) IBOutlet UILabel *birthdayDateLabel;
@property (nonatomic, strong) IBOutlet UIDatePicker *birthdayDatePickerView;


//@property (nonatomic, weak) IBOutlet NSArray *reviewArray;

@end

@implementation DetailViewController

#pragma mark - Interactivity Methods

- (IBAction)saveButtonPressed:(id)sender
{
    NSLog(@"Save Button Pressed");
    
    if (_currentContact) {
        NSLog(@"Update Contact");
        
        //compare Date to make sure it's not today's date
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        // Extract date components into components1
        NSDateComponents *components1 = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:_birthdayDatePickerView.date];
        
        // Extract time components into components2
        NSDateComponents *components2 = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
        
        //
        NSDate *bdaydate = [gregorianCalendar dateFromComponents:components1];
        NSDate *todaydate = [gregorianCalendar dateFromComponents:components2];

        if ([bdaydate isEqualToDate: todaydate]) {
            NSLog(@"Today %@",_birthdayDatePickerView.date);

        } else {
            NSLog(@"Not Today %@",_birthdayDatePickerView.date);
            [_currentContact setContactBirthdayDate:_birthdayDatePickerView.date];
        }
        
        
    }
    else{
        
    NSLog(@"New Contact");
        _currentContact = (Contacts *)[NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:_managedObjectContext];
        
        //compare Date to make sure it's not today's date
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        // Extract date components into components1
        NSDateComponents *components1 = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:_birthdayDatePickerView.date];
        
        // Extract time components into components2
        NSDateComponents *components2 = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
        
        //
        NSDate *bdaydate = [gregorianCalendar dateFromComponents:components1];
        NSDate *todaydate = [gregorianCalendar dateFromComponents:components2];
        
        if ([bdaydate isEqualToDate: todaydate]) {
            NSLog(@"Today %@",_birthdayDatePickerView.date);

        } else {
            NSLog(@"Not Today %@",_birthdayDatePickerView.date);
            [_currentContact setContactBirthdayDate:_birthdayDatePickerView.date];
        }

        
    }
    //Record 1
    [_currentContact setContactFirstName:_firstNameTextField.text];
    [_currentContact setContactLastName:_lastNameTextField.text];
    
    [_currentContact setContactCategory:[NSNumber numberWithLong:_categorySegControl.selectedSegmentIndex]];
    
    [_currentContact setContactHomePhone:_homePhoneTextField.text];
    [_currentContact setContactMobilePhone:_mobilePhoneTextField.text];
    
    [_currentContact setContactEmail:_emailTextField.text];
    
    [_currentContact setContactAddressStreet:_addressStreetTextField.text];
    [_currentContact setContactAddressStreet:_addressStreet2TextField.text];
    [_currentContact setContactAddressStreet:_addressCityTextField.text];
    [_currentContact setContactAddressStreet:_addressStateTextField.text];
    [_currentContact setContactAddressStreet:_addressZipTextField.text];
   
    //[_currentContact setContactBirthdayDate:_birthdayDatePickerView.date];
    //[_currentContact setContactDateEntered:[NSDate date]];
    [_currentContact setContactDateUpdated:[NSDate date]];
    
    
    
    [_appDelegate saveContext];
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (IBAction)deleteButtonPressed:(id)sender {
    
    [_managedObjectContext deleteObject:_currentContact];
    [_appDelegate saveContext];
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //method to dismiss the keyboard when hit return
    
    [textField resignFirstResponder];
    
    return true;
}



#pragma mark - Life Cycle Methods


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (_currentContact) {
        NSLog(@"Not nil");
    
    _firstNameTextField.text = _currentContact.contactFirstName;
    _lastNameTextField.text = _currentContact.contactLastName;
    
    [_categorySegControl setSelectedSegmentIndex:[_currentContact.contactCategory intValue]];

    _mobilePhoneTextField.text = _currentContact.contactMobilePhone;
    _homePhoneTextField.text = _currentContact.contactHomePhone;
    
    _emailTextField.text = _currentContact.contactEmail;
    
    _addressStreetTextField.text = _currentContact.contactAddressStreet;
    _addressStreet2TextField.text = _currentContact.contactAddressStreet2;
    _addressCityTextField.text = _currentContact.contactAddressCity;
    _addressStateTextField.text = _currentContact.contactAddressState;
    _addressZipTextField.text = _currentContact.contactAddressPostal;
    
    [_birthdayDatePickerView setDate:_currentContact.contactBirthdayDate];
    
    //this is where we set the text on the DetailView Controller
    }else{
        NSLog(@"nil");
        [_firstNameTextField becomeFirstResponder];
    }
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

@end
