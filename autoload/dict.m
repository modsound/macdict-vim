#import <Cocoa/Cocoa.h>
#import <CoreServices/CoreServices.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

NSArray *DCSGetActiveDictionaries(); 
NSArray *DCSCopyAvailableDictionaries(); 
NSString *DCSDictionaryGetName(DCSDictionaryRef dictID); 
NSString *DCSDictionaryGetShortName(DCSDictionaryRef dictID); 

int main(int argc, char** argv) {
  int opt;
  // set default dictionary
  NSString *dictname = @"Japanese-English";
  // set dictionary by an argument
  while ((opt = getopt(argc, argv, "jwafgte")) != -1) {
    switch (opt) {
 	    case 'j':
 	      dictname = @"Japanese";
 	      break;
      case 'w':
        dictname = @"Wikipedia";
        break;
 	    case 'a':
 	      dictname = @"Apple";
 	      break;
      case 'f':
        dictname = @"French";
        break;
      case 'g':
        dictname = @"German";
        break;
      case 't':
        dictname = @"American Engish Thesaurus";
        break;
      case 'e':
        dictname = @"American Engish";
        break;
    }
  }
  argc -= optind;
  argv += optind;

  @autoreleasepool{

    NSString* word;
    word = [NSString stringWithUTF8String:argv[0]];
  
    // substitute an variable for dictionary
    DCSDictionaryRef dict = NULL;
    NSArray *dicts = DCSCopyAvailableDictionaries();
    for (NSObject *aDict in dicts) {
   	  NSString *aShortName = DCSDictionaryGetShortName((DCSDictionaryRef)aDict);
   	  if ([aShortName isEqualToString:dictname]) {
   	    dict = (DCSDictionaryRef)aDict;
   	  }
    }
  
    // consult dictionaries
    CFStringRef result = NULL;
    CFRange range = DCSGetTermRangeInString(dict, (CFStringRef)word, 0);
    result = DCSCopyTextDefinition(dict, (CFStringRef)word, range);
    if (result) {
      printf("Result: %s\n", [(NSString*)result UTF8String]);
    }
    else {
      printf("No such word.\n");
    }

//    // function show dictionaries you have
//    char detail();{
//      NSArray *availables = DCSCopyAvailableDictionaries();
//      for (NSObject *d in availables) {
//        NSString *sn = DCSDictionaryGetShortName((DCSDictionaryRef)d);
//        printf("%s\n", [sn UTF8String]);
//      }
//    }

  }

  return 0;
}
