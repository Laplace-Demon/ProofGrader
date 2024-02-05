all: theoremParser

theoremParser: cjson/cJSON.o M.tab.o flex.o func.o main.o
	gcc cjson/cJSON.o M.tab.o flex.o func.o main.o -o theoremParser -g

cjson/cJSON.o: cjson/cJSON.c
	gcc cjson/cJSON.c -c -o cjson/cJSON.o

M.tab.o: M.tab.c
	gcc M.tab.c -c

flex.o: flex.c
	gcc flex.c -c

func.o: func.c
	gcc func.c -c

main.o: main.c
	gcc main.c -c

M.tab.h M.tab.c: M.y
	bison -d M.y

flex.c flex.h: M.l
	flex M.l