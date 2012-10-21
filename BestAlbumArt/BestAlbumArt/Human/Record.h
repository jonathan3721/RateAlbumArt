#import "_Record.h"

@interface Record : _Record {}
+(Record*)recordWithTitle:(NSString*)title imageURLString:(NSString*)imageURLSTring artistName:(NSString*)artistName;
-(BOOL)isEqualToRecord:(Record*)record;

@end
