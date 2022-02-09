#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

fact(n) {
	return n == 0 ? 1 : n*fact(n-1);
}

main() {
	int n = 10;
	puts("Hello, world!");
	//printf("Fact of %d is %d\n", n, fact(n));
	char f[1024];
	char* hello = "I am a system call!";
	int pipefd[2];
	pipe(pipefd);
	int pid = fork();
	if(pid == -1) {
		perror("Process is crashed!");
		exit(EXIT_FAILURE);
	}
	else if(pid) {
		close(pipefd[1]);
		wait(NULL);
		read(pipefd[0], f, 1024);
		write(STDOUT_FILENO, f, strlen(f));
		write(STDOUT_FILENO, hello, strlen(hello));
		close(pipefd[0]);
		exit(EXIT_SUCCESS);
	}
	else if(!pid) {
		close(pipefd[0]);
		int length = snprintf(f, 1024, "Fact of %d is %d\n", n, fact(n));
		write(pipefd[1], f, strlen(f));
		close(pipefd[1]);
		_exit(EXIT_SUCCESS);
	}
	return 0;
}
