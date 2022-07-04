# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jelarose <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/04 12:31:59 by jelarose          #+#    #+#              #
#    Updated: 2020/04/28 17:13:12 by jelarose         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RM = rm -f
LIB = ar rcs
CC = gcc
CCFLAGS = -g -Wall -Wextra -Werror -fomit-frame-pointer
NASM = nasm
NASMFLAGS = -felf64
NAME = libasm.a
ASMSRC = ft_strlen.s\
		ft_strcpy.s\
		ft_strcmp.s\
		ft_write.s\
		ft_read.s\
		ft_strdup.s
ASMSRC_BONUS = ft_atoi_base_bonus.s\
		ft_list_push_front_bonus.s\
		ft_list_size_bonus.s\
		ft_list_sort_bonus.s\
		ft_list_remove_if_bonus.s
ASMOBJ = $(ASMSRC:.s=.o)
ASMOBJ_BONUS = $(ASMSRC_BONUS:.s=.o)
all: $(NAME)
$(NAME): $(ASMOBJ)
	$(LIB) $(NAME) $(ASMOBJ)
bonus: $(ASMOBJ) $(ASMOBJ) $(ASMOBJ_BONUS)
	$(LIB) $(NAME) $(ASMOBJ) $(ASMOBJ_BONUS)
.s.o:
	$(NASM) $(NASMFLAGS) -s $< -o $(<:.s=.o)
clean:
	$(RM) $(ASMOBJ) $(ASMOBJ_BONUS)
fclean: clean
	$(RM) $(NAME)
re: fclean all
