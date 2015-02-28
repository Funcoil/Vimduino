#include <unistd.h>

int main() {
	char buf[256];
	int len;
	while(1) {
		if((len = read(0, buf, 256)) > 0) write(1, buf, len);
	}
	return 0;
}
