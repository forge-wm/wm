#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>


void wm_panic(char *msg) {
	puts(msg);
	exit(EXIT_FAILURE);
	printf("\nDon't Panic! - The HitchHikers Guide To The Galaxy has you covered, refer to page 42 for more.\n");
}
