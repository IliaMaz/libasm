NAME		:=	libasm
LIBN		:=	$(addsuffix .a, $(NAME))

CC			:=	cc
AS			:=	as

CFLAGS		:=	-Wall -Werror -Wextra
AFLAGS		:=	-arch arm64

AFILES		:=	ft_strlen
OFILES		:=	$(addsuffix .o, $(AFILES))

TESTER_EXE	:=	tester
TESTER_SRC	:=	$(addsuffix .c, $(TESTER_EXE))

RM			:=	/usr/bin/env rm -rf

$(NAME): all

all: $(OFILES) libmake
	$(CC) $(CFLAGS) $(TESTER_SRC) $(LIBN) -o $(TESTER_EXE)

%.o: %.s
	$(AS) $(AFLAGS) $< -c -o $@

libmake:
	ar rc $(LIBN) $(OFILES)

re: fclean all

clean:
	$(RM) $(OFILES)

fclean: clean
	$(RM) $(LIBN)

.PHONY: all re clean fclean
