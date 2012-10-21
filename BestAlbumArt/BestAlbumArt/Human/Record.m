#import "Record.h"

@implementation Record

// Custom logic goes here.

+(Record*)recordWithTitle:(NSString*)title imageURLString:(NSString*)imageURLString artistName:(NSString*)artistName
{
    NSPredicate* existingRecordPredicate = [NSPredicate predicateWithFormat:@"title == %@ AND artistName == %@", title, artistName];
    Record* existingRecord = [Record findFirstWithPredicate:existingRecordPredicate];
    Record* newRecord = nil;
    if (existingRecord) {
        newRecord = existingRecord;
    }
    else{
        NSURL* imageURL = [NSURL URLWithString:imageURLString];
        NSData* imageData = [NSData dataWithContentsOfURL:imageURL];
        newRecord = [Record createEntity];
        newRecord.title = title;
        newRecord.albumArt = [UIImage imageWithData:imageData];
        newRecord.artistName = artistName;
        newRecord.rating = @0;
    }
    return newRecord;
    
}

-(BOOL)isEqualToRecord:(Record*)record
{
    BOOL areEqual = NO;
    areEqual = record.title == self.title && record.artistName == self.artistName;
    
    return areEqual;
}

@end
