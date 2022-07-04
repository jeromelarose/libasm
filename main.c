/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jelarose <jelarose@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/22 23:42:53 by jelarose          #+#    #+#             */
/*   Updated: 2020/04/28 17:30:38 by jelarose         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <inttypes.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

typedef struct s_list
{
	char *data;
	struct s_list *next;
} t_list;


size_t	ft_strlen(const char *str);
ssize_t	ft_write(int fd, const void *str, size_t size);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_read(int fd, void *buff, size_t size);
char	*ft_strdup(const char *str);
int		ft_atoi_base(char *nbr, char *base);
void	ft_list_push_front(t_list **list, void	*data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

void	free_list(t_list *list)
{
	if (list)
	{
		free_list(list->next);
		if (list->data)
			free(list->data);
		free(list);
	}
}

int		main(void)
{
	char	str[500];
	char	str2[500];
	char	cpy[500];
	char	*data;
	char	*str_null;
	int		i;
	int		status;
	int		errno;
	int		std;
	int		nb;
	t_list	*list;
	t_list	*tmp;

	str_null = NULL;
	status = 1;
	printf("\nentre q pour passer a une fonction suivante, sinon suivre les indications demander \n\n");
	while (status)
	{
		printf("\n__________FT_STRLEN__________\n\n");
		printf("entre une chaine de caractere\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		if (ft_strcmp(str, "null") == 0)
		{
			printf("\nFT_STRLEN retourne : %lu\n", ft_strlen(str_null));
			printf("STRLEN retourne : %lu\n\n", strlen(str_null));
		}
		else
		{
			errno = 0;
			printf("\nFT_STRLEN retourne : %lu\n", ft_strlen(str));
			printf("errno = %d\n", errno);
			errno = 0;
			printf("STRLEN retourne : %lu\n\n", strlen(str));
			printf("errno = %d\n", errno);
		}
	}
	while (status)
	{
		printf("\n__________FT_STRCOPY__________\n\n");
		printf("entre une premiere chaine de caractere\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		printf("entre une deuxieme chaine de caractere\n");
		scanf("%s", str2);
		if (ft_strcmp(str2, "q") == 0)
			break ;
		if (ft_strcmp(str, "null") == 0)
		{
			errno = 0;
			strcpy(cpy, str_null);
			printf("\nchaine retourner par FT_STRCOPY : %s\n", ft_strcpy(str_null, str2));
			printf("premiere chaine rentrer apres FT_STRCPY: %s\n", str_null);
			printf("deuxieme chaine rentrer apres FT_STRCPY: %s\n\n", str2);
			printf("errno = %d\n", errno);
			errno = 0;
			printf("chaine retourner par STRCOPY : %s\n", strcpy(str_null, str2));
			printf("premiere chaine rentrer apres STRCPY: %s\n", str_null);
			printf("deuxieme chaine rentrer apres STRCPY: %s\n", str2);
			printf("errno = %d\n", errno);
		}
		else if (ft_strcmp(str2, "null") == 0)
		{
			errno = 0;
			strcpy(cpy, str_null);
			printf("\nchaine retourner par FT_STRCOPY : %s\n", ft_strcpy(str_null, str2));
			printf("premiere chaine rentrer apres FT_STRCPY: %s\n", str_null);
			printf("deuxieme chaine rentrer apres FT_STRCPY: %s\n\n", str2);
			printf("errno = %d\n", errno);
			errno = 0;
			printf("chaine retourner par STRCOPY : %s\n", strcpy(str_null, str2));
			printf("premiere chaine rentrer apres STRCPY: %s\n", str_null);
			printf("deuxieme chaine rentrer apres STRCPY: %s\n", str2);
			printf("errno = %d\n", errno);
		}
		else
		{
			errno = 0;
			strcpy(cpy, str);
			printf("\nchaine retourner par FT_STRCOPY : %s\n", ft_strcpy(str, str2));
			printf("premiere chaine rentrer apres FT_STRCPY: %s\n", str);
			printf("deuxieme chaine rentrer apres FT_STRCPY: %s\n\n", str2);
			printf("errno = %d\n", errno);
			errno = 0;
			printf("chaine retourner par STRCOPY : %s\n", strcpy(str, str2));
			printf("premiere chaine rentrer apres STRCPY: %s\n", str);
			printf("deuxieme chaine rentrer apres STRCPY: %s\n", str2);
			printf("errno = %d\n", errno);
		}
	}
	while (status)
	{
		printf("\n__________FT_STRCMP__________\n\n");
		printf("entre une premiere chaine de caractere\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		printf("entre une deuxieme chaine de caractere\n");
		scanf("%s", str2);
		if (ft_strcmp(str2, "q") == 0)
			break ;
		if (ft_strcmp(str, "null") == 0)
		{
			errno = 0;
			printf("\nLa valeur retourner par FT_STRCMP est : %d\n\ni", ft_strcmp(str_null, str2));
			printf("errno = %d\n", errno);
			errno = 0;
			printf("La valeur retourner par STRCMP est : %d\n\n", strcmp(str_null, str2));
			printf("errno = %d\n", errno);
		}
		else if (ft_strcmp(str2, "null") == 0)
		{
			errno = 0;
			printf("\nLa valeur retourner par FT_STRCMP est : %d\n\n", ft_strcmp(str2, str_null));
			printf("errno = %d\n", errno);
			errno = 0;
			printf("La valeur retourner par STRCMP est : %d\n", strcmp(str2, str_null));
			printf("errno = %d\n", errno);
		}
		else
		{
			errno = 0;
			printf("\nLa valeur retourner par FT_STRCMP est : %d\n\n", ft_strcmp(str, str2));
			printf("errno = %d\n", errno);
			errno = 0;
			printf("La valeur retourner par STRCMP est : %d\n", strcmp(str, str2));
			printf("errno = %d\n", errno);
		}
	}
	std = 1;
	while (status)
	{
		i = 0;
		printf("\n__________FT_WRITE__________\n\n");
		printf("entre une chaine de caractere\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		if (ft_strcmp(str, "null") == 0)
		{
			errno = 0;
			write(1 ,"\nFT_WRITE affiche : ", 20);
			i = ft_write(1, str, i);
			printf("\nFT_WRITE return : %d\n", i);
			printf("errno = %d\n\n", errno);
			printf("errno = %d\n", errno);
			errno = 0;
			write(1 ,"\nWRITE affiche : ", 16);
			i = write(1, str, i);
			printf("\nWRITE return : %d\n", i);
			printf("errno = %d\n\n", errno);
			printf("errno = %d\n", errno);
		}
		else
		{
		//	nb = 0;
	//		std = 50;
			nb = ft_strlen(str);
			write(1 ,"\nFT_WRITE affiche : ", 20);
			i = ft_write(std, str, nb);
			printf("\nFT_WRITE return : %d\n", i);
			printf("errno = %d\n\n", errno);
			printf("errno = %d\n", errno);
			errno = 0;
			write(1 ,"\nWRITE affiche : ", 16);
			i = write(std, str, nb);
			printf("\nWRITE return : %d\n", i);
			printf("errno = %d\n\n", errno);
			printf("errno = %d\n", errno);
		}
	}
	std = 1;
	while (status)
	{
		errno = 0;
		printf("\n__________FT_READ__________\n\n");
		printf("entre un nom de fichier\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		std = open(str, O_RDONLY);
		nb = 50;
		i = ft_read(std, str2, nb);
		printf("\nFT_READ affiche : %s", str2);
		printf("\nFT_READ return : %d\n", i);
		printf("errno = %d\n\n", errno);
		close(std);
		printf("errno = %d\n", errno);
		errno = 0;
		std = open(str, O_RDONLY);
		i = read(std, str2, nb);
		printf("\nREAD affiche : %s", str2);
		printf("\nREAD return : %d\n", i);
		printf("errno = %d\n\n", errno);
		close(std);
		printf("errno = %d\n", errno);
	}
	while (status)
	{
		printf("\n__________FT_STRDUP__________\n\n");
		printf("entre une chaine de caractere\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		char *s1;
		char *s2;
		if (ft_strcmp(str, "null") == 0)
		{
			errno = 0;
			s1 = ft_strdup(str_null);
			printf("\nFT_STRDUP retourne : %s\n", s1);
			printf("errno = %d\n", errno);
			errno = 0;
			s2 = strdup(str_null);
			printf("STRDUP retourne : %s\n\n", s2);
			printf("errno = %d\n", errno);
		}
		else
		{
			errno = 0;
			s1 = ft_strdup(str);
			printf("\nFT_STRDUP retourne : %s\n", s1);
			printf("errno = %d\n", errno);
			errno = 0;
			s2 = strdup(str);
			printf("STRDUP retourne : %s\n\n", s2);
			printf("errno = %d\n", errno);
		}
		free(s1);
		free(s2);
	}
	printf("\n__________PARTIE BONUS__________\n\n");
	while (status)
	{
		printf("\n__________FT_ATOI_BASE__________\n\n");
		printf("entre la chaine de caractere contenant le nombre\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		printf("entre la chaine de caractere contenant la base\n");
		scanf("%s", str2);
		if (ft_strcmp(str2, "q") == 0)
			break ;
		if (ft_strcmp(str, "null") == 0)
		{
			errno = 0;
			printf("\nFT_ATOI_BASE retourne : %d\n", ft_atoi_base(str_null, str2));
			printf("errno = %d\n", errno);
		}
		else if (ft_strcmp(str2, "null") == 0)
		{
			errno = 0;
			printf("\nFT_ATOI_BASE retourne : %d\n", ft_atoi_base(str2, str_null));
			printf("errno = %d\n", errno);
		}
		else
		{
			errno = 0;
			printf("\nFT_ATOI_BASE retourne : %d\n", ft_atoi_base(str, str2));
			printf("errno = %d\n", errno);
		}
	}
	list = NULL;
	while (status)
	{
		printf("\n__________FT_LIST_PUSH_FRONT__________\n\n");
		printf("entre une donnee a inserer dans la liste\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		if (ft_strcmp(str, "null") == 0)
		{
			errno = 0;
			ft_list_push_front(&list, str_null);
			printf("errno = %d\n", errno);
		}
		else
		{
			errno = 0;
			data = strdup(str);
			ft_list_push_front(&list, data);
			printf("errno = %d\n", errno);
		}
		write(1, "\n", 1);
		tmp = list;
		if (tmp)
		{
			while (tmp)
			{
				printf("%s\n", (char*)tmp->data);
				tmp = tmp->next;
			}
		}
	}
	printf("\n__________FT_LIST_SIZE__________\n\n");
	printf("la taille de la liste est de %d\n\n", ft_list_size(list));
	printf("\n__________FT_LIST_SORT__________\n\n");
	ft_list_sort(&list, ft_strcmp);
	write(1, "\n", 1);
	tmp = list;
	if (tmp)
	{
		while (tmp)
		{
			printf("%s\n", (char*)tmp->data);
			tmp = tmp->next;
		}
	}	
	while (status)
	{
		printf("\n__________FT_LIST_REMOVE_IF__________\n\n");
		printf("entre la donnee a supprimer de la liste\n");
		scanf("%s", str);
		if (ft_strcmp(str, "q") == 0)
			break ;
		if (ft_strcmp(str, "null") == 0)
		{
			errno = 0;
			ft_list_remove_if(&list, str_null, ft_strcmp, free);
			printf("errno = %d\n", errno);
		}
		else
		{
			errno = 0;
			ft_list_remove_if(&list, str, ft_strcmp, free);
			printf("errno = %d\n", errno);
		}
		write(1, "\n", 1);
		tmp = list;
		if (tmp)
		{
			while (tmp)
			{
				printf("%s\n", (char*)tmp->data);
				tmp = tmp->next;
			}
		}
	}

	free_list(list);

	return (0);
}
