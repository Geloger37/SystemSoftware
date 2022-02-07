#include <stdio.h>
//#include "fact.h"

fact(int n) {
	return n == 0 ? 1 : n*fact(n-1);
}

main() {
	int n = 10;
	puts("Hello, world!");
	printf("Fact of %d is %d", n, fact(n));
	return 0;
}
