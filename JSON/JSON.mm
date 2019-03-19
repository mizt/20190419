#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[]) {
    @autoreleasepool {
        NSError *error = nil;
        NSString *path  = [NSString stringWithFormat:@"%@/color.json",[[NSBundle mainBundle] bundlePath]];
        NSString *json= [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        if(error==nil) {
            NSData *jsonData = [json dataUsingEncoding:NSUnicodeStringEncoding];
            error = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
            if(error==nil) {
                int ch = 3;
                if([[dict[@"background"] className] compare:@"__NSArrayI"]==NSOrderedSame) {
                    if(dict[@"background"]&&[dict[@"background"] count]==ch) {                    
                        unsigned int color = 0xFF000000;
                        for(int k=0; k<ch; k++) {
                            if([[dict[@"background"][k] className] compare:@"__NSCFNumber"]==NSOrderedSame) {
                                int tmp = [dict[@"background"][k] intValue];
                                if(tmp>0&&tmp<0x100) {
                                    color|=tmp<<(8*(ch-k-1));
                                }
                            }
                        }
                        NSLog(@"0x%X",color);
                    }
                }               
            }
        }
    }
}