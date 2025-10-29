//The only single header file for this project, as I follow this method with other projects of mine also.
#include "main.h"
Display *dpy; //To connect to X11. 
Window root; //For seeing which window is the root window.


int main(void) { //Don't complain about code inside main.
	dpy = XOpenDisplay(NULL);
	if (dpy == 0) {
		wm_panic("Unable to open a display to connect to X, see stacktrace.");
	}
	
}

// void wm_panic(char *msg) {
	// puts(msg);
	// exit(EXIT_FAILURE);
	// printf("\nDon't Panic! - The HitchHikers Guide To The Galaxy has you covered, refer to page 42 for more.\n");
// }
