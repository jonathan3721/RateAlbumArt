// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JLAlbum.m instead.

#import "_JLAlbum.h"

const struct JLAlbumAttributes JLAlbumAttributes = {
	.albumArt = @"albumArt",
	.artistName = @"artistName",
	.rating = @"rating",
	.title = @"title",
};

const struct JLAlbumRelationships JLAlbumRelationships = {
};

const struct JLAlbumFetchedProperties JLAlbumFetchedProperties = {
};

@implementation JLAlbumID
@end

@implementation _JLAlbum

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Album";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Album" inManagedObjectContext:moc_];
}

- (JLAlbumID*)objectID {
	return (JLAlbumID*)[super objectID];
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
