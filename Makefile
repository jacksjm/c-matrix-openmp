# GNU Makefile

CC = gcc
CCFLAGS = -Wall #-O3 #-g -llikwid #-funroll-all-loops
LDFLAGS = -fopenmp
TARGET = main_matriz_openmp gera_matriz2 help

all: $(TARGET)

%.o: %.c
	$(CC) $(CCFLAGS) -c $< $(LDFLAGS)

%: %.o
	$(CC) $(LDFLAGS) $^ -o $@

main_matriz_openmp: main_matriz_openmp.o matriz.o toolsv2.o matriz-operacoes-openmp.o
	$(CC) $(CCFLAGS) matriz-operacoes-openmp.o matriz.o toolsv2.o main_matriz_openmp.c -o $@ $(LDFLAGS)

gera_matriz2: matriz.o toolsv2.o gera_matriz2.c
	$(CC) $(CCFLAGS) matriz.o toolsv2.o gera_matriz2.c -o $@ $(LDFLAGS)

help:
	@echo
	@echo
	@echo "####### Exemplo de Execução #######"
	@echo "./gera_matriz2 100 100"
	@echo "./main_matriz_openmp 100x100-mat.map 100x100-mat.map 2"

clean:
	rm -f *.o *~ $(TARGET) *.map *.map-result
