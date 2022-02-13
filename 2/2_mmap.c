#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>

fact(n) {
	return n == 0 ? 1 : n*fact(n-1);
}

main() {
	int n = 10;
	puts("Hello, world!");
	//printf("Fact of %d is %d\n", n, fact(n));
	char f[1024];
	char* hello = "I am a system call!";
	char* address = NULL;
	unlink("/tmp/fifo00.1");
	if(mkfifo("/tmp/fifo00.1", S_IWUSR | S_IRUSR) == -1) {
		perror("File is not created!");
		exit(EXIT_FAILURE);
	}
	int pid = fork();
	if(pid == -1) {
		perror("Process is crashed!");
		exit(EXIT_FAILURE);
	}
	else if(pid) {
		int readfile = open("/tmp/fifo00.1", O_RDONLY);
		address = mmap(NULL, 1024, PROT_READ|PROT_WRITE, MAP_SHARED, readfile, 0);
		wait(NULL);
		read(readfile, f, 1024);
		write(STDOUT_FILENO, f, strlen(f));
		write(STDOUT_FILENO, hello, strlen(hello));
		munmap(address, 1024);
		close(readfile);
		unlink("/tmp/fifo00.1");
		exit(EXIT_SUCCESS);
	}
	else if(!pid) {
		int length = snprintf(f, 1024, "Fact of %d is %d\n", n, fact(n));
		//int writefile = open("/tmp/fifo00.1", O_WRONLY);
		write(address, f, strlen(f));
		//close(writefile);
		_exit(EXIT_SUCCESS);
	}
	return 0;
}
