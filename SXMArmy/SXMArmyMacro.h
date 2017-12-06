//
//  SXMArmyMacro.h
//  SXMArmyDemo
//
//  Created by syn on 2017/12/6.
//  Copyright © 2017年 sxm. All rights reserved.
//

#ifndef SXMArmyMacro_h
#define SXMArmyMacro_h

#ifndef SXMSYNTH_DUMMY_CLASS
#define SXMSYNTH_DUMMY_CLASS(_name_) \
@interface SXMSYNTH_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation SXMSYNTH_DUMMY_CLASS_ ## _name_ @end
#endif

#endif /* SXMArmyMacro_h */
