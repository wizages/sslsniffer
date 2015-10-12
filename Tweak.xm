%hookf(void, SSLWrite, id context, const void *data, size_t dataLength, size_t *processed)
{
	NSError *error = nil;
	HBLogDebug(@"SSLWrite( %s, %zu, %zu)", (char*)data, dataLength, *processed);
	NSString *location = (@"/var/mobile/Documents/sslWriteOutput.txt");
	NSString *content = [NSString stringWithFormat:@"%s", (char*) data];
	NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:location];
	[fileHandle seekToEndOfFile];
	NSString *writedStr = [[NSString alloc] initWithContentsOfFile:location encoding:NSUTF8StringEncoding error:nil];
    content = [content stringByAppendingString:@"\0\0\0\0"];
    writedStr = [writedStr stringByAppendingString:content];
    BOOL success = [writedStr writeToFile:location
                        atomically:NO
                          encoding:NSStringEncodingConversionAllowLossy
                             error:&error];
    HBLogDebug(@"Success = %d, error = %@", success, error);
	return %orig();
}

%hookf(void, SSLRead, id context, void *data, size_t dataLength, size_t *processed)
{
	NSError *error = nil;
	HBLogDebug(@"SSLRead( %s, %zu, %zu)", (char*)data, dataLength, *processed);
	NSString *location = (@"/var/mobile/Documents/sslReadOutput.txt");
	NSString *content = [NSString stringWithFormat:@"%s", (char*) data];
	NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:location];
	[fileHandle seekToEndOfFile];
	NSString *writedStr = [[NSString alloc] initWithContentsOfFile:location encoding:NSUTF8StringEncoding error:nil];
    content = [content stringByAppendingString:@"\0\0\0\0"];
    writedStr = [writedStr stringByAppendingString:content];
    BOOL success = [writedStr writeToFile:location
                        atomically:NO
                          encoding:NSStringEncodingConversionAllowLossy
                             error:&error];
    HBLogDebug(@"Success = %d, error = %@", success, error);
	return %orig();
}