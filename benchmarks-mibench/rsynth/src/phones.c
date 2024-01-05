#include "config.h"
#include <stdio.h>
#include "phones.h"

#ifdef __STDC__
#define PHONE(nm,br,am,ex) #nm,
#else
#define PHONE(nm,br,am,ex) "nm",
#endif
const char *ph_name[] =
{" ",
#include "phones.def"
 NULL};
#undef PHONE

#define PHONE(nm,br,am,ex) br,
const char *ph_br[] =
{" ",
#include "phones.def"
 NULL};
#undef PHONE

#define PHONE(nm,br,am,ex) am,
const char *ph_am[] =
{" ",
#include "phones.def"
 NULL};
#undef PHONE
