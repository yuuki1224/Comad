// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CMDUser.m instead.

#import "_CMDUser.h"

const struct CMDUserAttributes CMDUserAttributes = {
	.name = @"name",
};

const struct CMDUserRelationships CMDUserRelationships = {
};

const struct CMDUserFetchedProperties CMDUserFetchedProperties = {
};

@implementation CMDUserID
@end

@implementation _CMDUser

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CMDUser" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CMDUser";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CMDUser" inManagedObjectContext:moc_];
}

- (CMDUserID*)objectID {
	return (CMDUserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;











@end
