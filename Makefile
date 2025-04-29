NAME        = libftprintf.a

# Dossiers
SRC_DIR     = src
OBJ_DIR     = obj
INC_DIR     = include

# Fichiers sources et objets
SRCS        = $(wildcard $(SRC_DIR)/*.c)
OBJS        = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# Compilation
CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -I$(INC_DIR)

# Commandes
RM          = rm -rf
MKDIR       = mkdir -p

# Règles
all: $(OBJ_DIR) $(NAME)

$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
