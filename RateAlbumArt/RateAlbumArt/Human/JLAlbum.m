#import "JLAlbum.h"

@implementation JLAlbum

+(JLAlbum*)albumWithTitle:(NSString*)title imageURLString:(NSString*)imageURLString artistName:(NSString*)artistName
{
    NSPredicate* existingRecordPredicate = [NSPredicate predicateWithFormat:@"title == %@ AND artistName == %@", title, artistName];
    JLAlbum* existingRecord = [JLAlbum findFirstWithPredicate:existingRecordPredicate];
    JLAlbum* newRecord = nil;
    if (existingRecord) {
        newRecord = existingRecord;
    }
    else{
        NSURL* imageURL = [NSURL URLWithString:imageURLString];
        NSData* imageData = [NSData dataWithContentsOfURL:imageURL];
        newRecord = [JLAlbum createEntity];
        newRecord.title = title;
        newRecord.albumArt = [UIImage imageWithData:imageData];
        newRecord.artistName = artistName;
        newRecord.rating = @0;
    }
    return newRecord;
    
}

-(BOOL)isEqualToRecord:(JLAlbum*)record
{
    BOOL areEqual = NO;
    areEqual = record.title == self.title && record.artistName == self.artistName;
    
    return areEqual;
}

@end
