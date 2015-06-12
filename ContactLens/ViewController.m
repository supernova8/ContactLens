//
//  ViewController.m
//  ContactLens
//
//  Created by Sonova Middleton on 6/11/15.
//  Copyright (c) 2015 supernova8productions. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Contacts.h"
#import <CoreData/CoreData.h>
#import "DetailViewController.h"


@interface ViewController ()

@property (nonatomic,strong) AppDelegate *appDelegate;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic,strong) NSArray *contactArray;
@property (nonatomic,strong) IBOutlet UITableView *contactTableView;




@end

@implementation ViewController

int addCounterInt = 0;
//int initCounterInt = 0;


#pragma mark - Interactivity methods

- (IBAction)addButtonPressed:(id)sender {
    
    NSLog(@"Add Pressed");
    addCounterInt++;
    [self performSegueWithIdentifier:@"listToDetailSegue" sender:self];
    
}

#pragma mark - Database Methods

- (void)tempAddRecords {
    
    NSLog(@"Add!");
    
    
    //NSDate *today = [NSDate date];
    //NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //[dateFormat setDateFormat:@"dd/MM/yyyy"];
    //NSString *dateString = [dateFormat stringFromDate:today];
    //NSLog(@"date: %@", dateString);
    
//    NSDateFormatter *tempFormatter = [[[NSDateFormatter alloc]init]autorelease];
//    [tempFormatter setDateFormat:@"yyyy-mm-dd hh:mm:ss"];
//    NSDate *temp = [tempFormatter dateFromString:@"2011-01-01 09:00:00"];
    
    Contacts *newContact = (Contacts *)[NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:_managedObjectContext];
    
    //Record 1
    [newContact setContactFirstName:@"Sonova"];
    [newContact setContactLastName:@"Middleton"];
    [newContact setContactCategory:[NSNumber numberWithInt:0]];
    [newContact setContactEmail:@"puddin88@gmail.com"];
    [newContact setContactMobilePhone:@"202-277-6080"];
    [newContact setContactHomePhone:@"718-774-3989"];
    [newContact setContactAddressStreet:@"550 14th Road, South"];
    [newContact setContactAddressStreet2:@"Apt. 1613"];
    [newContact setContactAddressCity:@"Arlington"];
    [newContact setContactAddressState:@"VA"];
    [newContact setContactAddressPostal:@"22202"];
    [newContact setContactBirthdayDate:[NSDate date]];
    
    [newContact setContactDateEntered:[NSDate date]];
    [newContact setContactDateUpdated:[NSDate date]];
    
    //code for image later
    //[newContact setContactImage:[];
  
    
    //Record 2
    Contacts *newContact1 = (Contacts *)[NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:_managedObjectContext];
    
   
    [newContact1 setContactFirstName:@"Sholpan"];
    [newContact1 setContactLastName:@"Yestekov"];
    [newContact1 setContactCategory:[NSNumber numberWithInt:1]];
    [newContact1 setContactEmail:@"sholayes@yahoo.com"];
    [newContact1 setContactMobilePhone:@"202-555-9090"];
    [newContact1 setContactHomePhone:@"301-435-7896"];
    [newContact1 setContactAddressStreet:@"23 Mockingbird Lane"];
    [newContact1 setContactAddressStreet2:@""];
    [newContact1 setContactAddressCity:@"Germantown"];
    [newContact1 setContactAddressState:@"MD"];
    [newContact1 setContactAddressPostal:@"23434"];
    [newContact1 setContactBirthdayDate:[NSDate date]];
    
    [newContact1 setContactDateEntered:[NSDate date]];
    [newContact1 setContactDateUpdated:[NSDate date]];
    
    //code for image later
    //[newContact setContactImage:[];
    
    //Record 3
    Contacts *newContact2 = (Contacts *)[NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:_managedObjectContext];
    
   
    [newContact2 setContactFirstName:@"Steve"];
    [newContact2 setContactLastName:@"Woods"];
    [newContact2 setContactCategory:[NSNumber numberWithInt:2]];
    [newContact2 setContactEmail:@"swoods@gmail.com"];
    [newContact2 setContactMobilePhone:@"301-456-6789"];
    [newContact2 setContactHomePhone:@"301-345-2345"];
    [newContact2 setContactAddressStreet:@"2 Mayberry Road"];
    [newContact2 setContactAddressStreet2:@"Apt. 3"];
    [newContact2 setContactAddressCity:@"Vienna"];
    [newContact2 setContactAddressState:@"VA"];
    [newContact2 setContactAddressPostal:@"11234"];
    [newContact2 setContactBirthdayDate:[NSDate date]];
    
    [newContact2 setContactDateEntered:[NSDate date]];
    [newContact2 setContactDateUpdated:[NSDate date]];
    
    //code for image later
    //[newContact setContactImage:[];
    
    //Record 4
    Contacts *newContact3 = (Contacts *)[NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:_managedObjectContext];
    
        [newContact3 setContactFirstName:@"Dwayne"];
    [newContact3 setContactLastName:@"Johnson"];
    [newContact3 setContactCategory:[NSNumber numberWithInt:3]];
    [newContact3 setContactEmail:@"therock@gmail.com"];
    [newContact3 setContactMobilePhone:@"357-465-9876"];
    [newContact3 setContactHomePhone:@"718-345-0987"];
    [newContact3 setContactAddressStreet:@"123 Forrest Way"];
    [newContact3 setContactAddressStreet2:@"Apt. 1613"];
    [newContact3 setContactAddressCity:@"Dallas"];
    [newContact3 setContactAddressState:@"TX"];
    [newContact3 setContactAddressPostal:@"11121"];
    [newContact3 setContactBirthdayDate:[NSDate date]];
    
    [newContact3 setContactDateEntered:[NSDate date]];
    [newContact3 setContactDateUpdated:[NSDate date]];
    
    //code for image later
    //[newContact setContactImage:[];
    
    [_appDelegate saveContext];
    
    
    
}

- (NSArray *)fetchContacts {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    
    return [_managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _contactArray.count;
}

//Method to push Array Fields into the TableView Cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Fetch!");
    NSString *cellIdentifier =@"Cell"; //we've replaced string with this
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // takes cell that is being recycled and takes it to reuse it.
    
    if (cell ==nil) { //if you don't have an old one, then let's create a new one
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //these Strings need to be the same as line above
        
        // these below are placed here so theyre only done when cell is created
        
    }
    Contacts *currentContact = _contactArray[indexPath.row];
    
    NSString *fname = [currentContact contactFirstName];
    NSString *lname = [currentContact contactLastName];
    
    cell.textLabel.text = [fname stringByAppendingFormat:@" %@", lname];
    
    //Set the Cell Text field with the First and Last name from the Array
    
    NSNumber *catNum = [currentContact contactCategory];
    //[currentContact.contactCategory intValue];
    
    if ([catNum intValue] == 0) {
        cell.detailTextLabel.text = @"Family";
    }else if ([catNum intValue]  == 1){
        cell.detailTextLabel.text = @"Friend";
    }else if ([catNum intValue]  == 2){
        cell.detailTextLabel.text = @"Work";
    }else{
        cell.detailTextLabel.text = @"Other";
    }
    //cell.detailTextLabel.text = [currentContact contactEmail];
    
    //Set the Cell Detail Text with the string for category
    
    
    return cell;
    
}

//Tells the segue that a cell was selected and to do the PrepareforSegue Method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Select");
    
    [self performSegueWithIdentifier:@"listToDetailSegue" sender:self];
}

//This method gives the DetailViewController the data to display
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailViewController *destController = [segue destinationViewController];
    //inits the Controller
    
    if(addCounterInt >= 1) {
        NSLog(@"add");
        Contacts *currentContact;
        destController.currentContact = currentContact;
        addCounterInt = 0;

    }
    else { //Update
        NSLog(@"update");

    NSIndexPath *indexPath = [_contactTableView indexPathForSelectedRow];
    //creates the indexPath
    
    Contacts *currentContact = _contactArray[indexPath.row];
    //creates the current Flavor
    
    destController.currentContact = currentContact;
    //changes the text of the nameSting label to the current flavor
        
    }
}





#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Here");
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
    
//    if(!_managedObjectContext) {
//        NSLog(@"Add Temp Records");
//        //Don't add anymore temp records
//        
//        
        [self tempAddRecords];
//    }
//    else {
//    // Don't add Temp Records
//        NSLog(@"Don't Add Temp Records");
//    }
    //_contactArray = [self fetchContacts];
    NSLog(@"Count: %lu", _contactArray.count);
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    _contactArray = [self fetchContacts];
    [_contactTableView reloadData];
    // to reload the Data in the TableView
    
    //this is where we set the text on the DetailView Controller
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
