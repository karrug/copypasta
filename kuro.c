/** execute shell script on request **/

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


int main(int argc, char *argv[]) {
    struct sockaddr_in sa;
    char *message;
    int socketfd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (socketfd == -1) {
        perror("cannot create socket");
        exit(EXIT_FAILURE);
    }

    memset(&sa, 0, sizeof sa);

    sa.sin_family = AF_INET;
    sa.sin_port = htons(1100);
    sa.sin_addr.s_addr = htonl(INADDR_ANY);

    if (bind(socketfd, (struct sockaddr *) &sa, sizeof sa) == -1) {
        perror("bind failed");
        close(socketfd);
        exit(EXIT_FAILURE);
    }

    if (listen(socketfd, 10) == -1) {
        perror("listen failed");
        close(socketfd);
        exit(EXIT_FAILURE);
    }

    for (;;) {
        int connectfd = accept(socketfd, NULL, NULL);

        if (0 > connectfd) {
            perror("accept failed");
            close(socketfd);
            exit(EXIT_FAILURE);
        }

        system(argv[1]);

        message = "HTTP/1.1 200 OK\r\n";
        send(connectfd, message , strlen(message), 0);

        if (shutdown(connectfd, SHUT_RDWR) == -1) {
            perror("shutdown failed");
            close(connectfd);
            close(socketfd);
            exit(EXIT_FAILURE);
        }
        close(connectfd);
    }

    close(socketfd);
    return EXIT_SUCCESS;
}
