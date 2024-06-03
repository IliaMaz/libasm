#include <stdio.h>
#include <unistd.h>

extern size_t ft_strlen(char *);

int main() {
  printf("%zu\n", ft_strlen(""));
  printf("%zu\n", ft_strlen("char *"));
}
