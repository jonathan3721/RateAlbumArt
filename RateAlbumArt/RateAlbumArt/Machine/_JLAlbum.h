// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JLAlbum.h instead.

#import <CoreData/CoreData.h>


extern const struct JLAlbumAttributes {
	__unsafe_unretained NSString *albumArt;
	__unsafe_unretained NSString *artistName;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *title;
} JLAlbumAttributes;

extern const struct JLAlbumRelationships {
} JLAlbumRelationships;

extern const struct JLAlbumFetchedProperties {
} JLAlbumFetchedProperties;


@class UIImage;




@interface JLAlbumID : NSManagedObjectID {}
@end

@interface _JLAlbum : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (JLAlbumID*)objectID;




@property (nonatomic, strong) UIImage* albumArt;


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

@interface _JLAlbum (CoreDataGeneratedAccessors)

@end

@interface _JLAlbum (CoreDataGeneratedPrimitiveAccessors)


- (UIImage*)primitiveAlbumArt;
- (void)setPrimitiveAlbumArt:(UIImage*)value;




- (NSString*)primitiveArtistName;
- (void)setPrimitiveArtistName:(NSString*)value;




- (NSNumber*)primitiveRating;
- (void)setPrimitiveRating:(NSNumber*)value;

- (int32_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int32_t)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
