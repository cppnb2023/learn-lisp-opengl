TARGET = libmy.so

BUILD_DIR = build

CC = gcc

SRC = init.c
INC =
OBJ = ${SRC:%.c=${BUILD_DIR}/%.o}
DEP = ${OBJ:.o=.d}
LIB = -lGL -lglfw

CFLAGS = ${INC} -fPIC
LINK_FLAGS = -shared ${LIB}

-include ${DEP}

.PHONY: all clean run

define SBCL_OPT =
--eval "(require 'asdf)" \
--eval "(push #P\"${PWD}/\" asdf:*central-registry*)" \
--eval "(asdf:load-asd \"day1.asd\")" \
--eval "(asdf:load-system \"day1\")"
endef

all: ${TARGET}

clean:
	rm -rf ${BUILD_DIR}
	rm -f ${TARGET}

run:
	sbcl ${SBCL_OPT}

${BUILD_DIR}:
	mkdir -p $@

${BUILD_DIR}/glad.o:../glad.c | ${BUILD_DIR}
	${CC} ${CFLAGS} -c $< -o $@ -MMD -MF $*.d

${BUILD_DIR}/%.o:%.c | ${BUILD_DIR}
	${CC} ${CFLAGS} -c $< -o $@ -MMD -MF ${BUILD_DIR}/$*.d

${TARGET}: ${OBJ} ${BUILD_DIR}/glad.o
	${CC} ${CFLAGS} ${LINK_FLAGS} $^ -o $@
