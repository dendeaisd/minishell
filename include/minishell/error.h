/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ramoussa <ramoussa@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/16 18:52:50 by ramymoussa        #+#    #+#             */
/*   Updated: 2024/02/18 00:02:54 by ramoussa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef ERROR_H
# define ERROR_H

# include <unistd.h>
# include <errno.h>
# include "minishell/minishell.h"

void    print_builtin_error(char *cmd, char *arg, char *msg);
void	print_execve_error(char *cmd, char *msg);
void	err_io(char *cmd, char *msg, int exit_code, t_minishell *ms);
void	err(char *cmd, char *msg, int code, t_minishell *ms);

#endif