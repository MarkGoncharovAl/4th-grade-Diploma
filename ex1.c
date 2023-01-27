#include <stddef.h>
size_t strlen5(const char *s)
{
    const char *s1 = s - 1;
    char c;
    do {
        c = *++s1;
    } while (c != 0);

	return (size_t)(s1 - s);
}
