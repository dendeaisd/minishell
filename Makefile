# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ramymoussa <ramymoussa@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/15 20:55:14 by ramoussa          #+#    #+#              #
#    Updated: 2023/12/19 19:39:33 by ramymoussa       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME:= minishell

CFLAGS	:= -lreadline -Wextra -Wall -Werror -g
HEADERS := -I ./include -I ${BASELIB}/include
BASELIB := ./lib/ft-baselib
SRC_ERROR := error/execution_error.c error/parser_error.c
SRC_BUILTINS := execution/builtins/pwd.c
SRC_MAIN := main.c 

SRCS := $(SRC_ERROR) $(SRC_BUILTINS) $(SRC_MAIN) 

OBJS := ${addprefix src/, ${SRCS:.c=.o}}
LIBS := ${BASELIB}/baselib.a

all: BASELIB ${NAME}

%.o: %.c
	@$(CC) $(HEADERS) -o $@ -c $<

${NAME}: ${OBJS}
	@$(CC) $(CFLAGS) $(OBJS) $(LIBS) $(HEADERS) -o $(NAME) && echo "Successful $(NAME) build...!"

BASELIB:
	@if [ -d ${BASELIB} ]; then\
		echo "${BASELIB} already exists... proceeding to next step.";\
	else\
		mkdir lib;\
		git clone git@github.com:letsgogeeky/ft-baselib.git ${BASELIB};\
	fi
	make --directory=${BASELIB}

clean:
	@rm -rf $(OBJS)

fclean: clean
	@$(MAKE) fclean --directory=${BASELIB}
	rm -f ${NAME}

re: fclean all

.PHONY: all clean fclean re
