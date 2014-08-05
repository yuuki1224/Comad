// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CMDUser.h instead.

#import <CoreData/CoreData.h>


extern const struct CMDUserAttributes {
	__unsafe_unretained NSString *name;
} CMDUserAttributes;

extern const struct CMDUserRelationships {
} CMDUserRelationships;

extern const struct CMDUserFetchedProperties {
} CMDUserFetchedProperties;




@interface CMDUserID : NSManagedObjectID {}
@end

@interface _CMDUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CMDUserID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _CMDUser (CoreDataGeneratedAccessors)

@end

@interface _CMDUser (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
