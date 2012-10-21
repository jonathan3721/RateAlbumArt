#import "_JLAlbum.h"

@interface JLAlbum : _JLAlbum {}
+(JLAlbum*)albumWithTitle:(NSString*)title imageURLString:(NSString*)imageURLString artistName:(NSString*)artistName;
-(BOOL)isEqualToRecord:(JLAlbum*)record;

@end
