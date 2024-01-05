#define PHONE(nm,br,am,ex) nm,
enum phone_e { SIL,
#include "phones.def"
END };
#undef PHONE
extern const char *ph_name[];
extern const char *ph_br[];
extern const char *ph_am[];
