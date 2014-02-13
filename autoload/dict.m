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
  int o;
  // set default dictionary
  NSString *dictname = @"Japanese-English";
  // set dictionary by an argument
  while ((o = getopt(argc, argv, "jfgte")) != -1) {
    switch (o) {
       case 'j':
         dictname = @"Japanese";
         break;
      // case 'w':
        // dictname = @"Wikipedia";
        // break;
       // case 'a':
         // dictname = @"Apple";
         // break;
      case 'f':
        dictname = @"French";
        break;
      case 'g':
        dictname = @"German";
        break;
      case 't':
        dictname = @"American English Thesaurus";
        break;
      case 'e':
        dictname = @"American English";
        break;
      case '?':
        printf("Unknown argument option.\n");
        return 1;
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
    CFRange range = DCSGetTermRangeInString(dict, (CFStringRef)word, 0);
    NSString *def = (NSString *)DCSCopyTextDefinition(dict, (CFStringRef)word, range);
    if (def) {
      NSString *result = [def stringByReplacingOccurrencesOfString:@"▸" withString:@"\n▸"];
      printf("Result: %s\n", [(NSString*)result UTF8String]);
    }
    else {
      printf("Not found.\n");
    }

//    // function show dictionaries you have
//    int detail(); {
//      NSArray *availables = DCSCopyAvailableDictionaries();
//      for (NSObject *d in availables) {
//        NSString *sn = DCSDictionaryGetShortName((DCSDictionaryRef)d);
//        printf("%s\n", [sn UTF8String]);
//      }
//    return 0;
//    }

  }

  return 0;
}
