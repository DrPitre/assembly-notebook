int putchar(int c);

int main(void) {
    const char *msg = "HELLO, WORLD!\r";
    while (*msg)
        putchar(*msg++);
    return 0;
}
