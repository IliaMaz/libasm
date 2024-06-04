#include "tester.h"

void test_ft_strlen() {
    char * strings[] = {
        "Hello, World!",
        "Hello, World! ",
        " Hello, World!",
        "",
        "char *",
        NULL
    };

    for (size_t i = 0; strings[i]; ++i) {
        assert(ft_strlen(strings[i]) == strlen(strings[i]));
    }
}

int main() {
    test_ft_strlen();
}
