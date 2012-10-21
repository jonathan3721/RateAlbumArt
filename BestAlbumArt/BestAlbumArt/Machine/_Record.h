// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Record.h instead.

#import <CoreData/CoreData.h>


extern const struct RecordAttributes {
	__unsafe_unretained NSString *albumArt;
	__unsafe_unretained NSString *artistName;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *title;
} RecordAttributes;

extern const struct RecordRelationships {
} RecordRelationships;

extern const struct RecordFetchedProperties {
} RecordFetchedProperties;


@class NSObject;




@interface RecordID : NSManagedObjectID {}
@end

@interface _Record : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RecordID*)objectID;




@property (nonatomic, strong) id albumArt;


//- (BOOL)validateAlbumArt:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* artistName;


//- (BOOL)validateArtistName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* rating;


@property int32_t ratingValue;
- (int32_t)ratingValue;
- (void)setRatingValue:(int32_t)value_;

//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _Record (CoreDataGeneratedAccessors)

@end

@interface _Record (CoreDataGeneratedPrimitiveAccessors)


- (id)primitiveAlbumArt;
- (void)setPrimitiveAlbumArt:(id)value;




- (NSString*)primitiveArtistName;
- (void)setPrimitiveArtistName:(NSString*)value;




- (NSNumber*)primitiveRating;
- (void)setPrimitiveRating:(NSNumber*)value;

- (int32_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int32_t)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
