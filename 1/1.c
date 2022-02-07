#include <stdio.h>
#include <unistd.h>
#include <string.h>

fact(n) {
	return n == 0 ? 1 : n*fact(n-1);
}

main() {
	int n = 10;
	puts("Hello, world!");
	printf("Fact of %d is %d\n", n, fact(n));
	char* hello = "I am a system call!";
	write(1, hello, strlen(hello));
	return 0;
}
