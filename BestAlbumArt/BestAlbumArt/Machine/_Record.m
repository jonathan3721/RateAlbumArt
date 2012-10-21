// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Record.m instead.

#import "_Record.h"

const struct RecordAttributes RecordAttributes = {
	.albumArt = @"albumArt",
	.artistName = @"artistName",
	.rating = @"rating",
	.title = @"title",
};

const struct RecordRelationships RecordRelationships = {
};

const struct RecordFetchedProperties RecordFetchedProperties = {
};

@implementation RecordID
@end

@implementation _Record

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Record";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Record" inManagedObjectContext:moc_];
}

- (RecordID*)objectID {
	return (RecordID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"ratingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rating"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic albumArt;






@dynamic artistName;






@dynamic rating;



- (int32_t)ratingValue {
	NSNumber *result = [self rating];
	return [result intValue];
}

- (void)setRatingValue:(int32_t)value_ {
	[self setRating:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveRatingValue {
	NSNumber *result = [self primitiveRating];
	return [result intValue];
}

- (void)setPrimitiveRatingValue:(int32_t)value_ {
	[self setPrimitiveRating:[NSNumber numberWithInt:value_]];
}





@dynamic title;











@end
