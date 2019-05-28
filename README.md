# OPERAÇÕES DE MATRIZES 
Criação de uma biblioteca para operações com matrizes e operações com matrizes em bloco, ambas com e sem threads em OpenMP.

# BIBLIOTECA DE MATRIZES 
Utiliza-se uma biblioteca para manipulação de matrizes (`matriz.h`).

# PASSOS PARA INICIALIZAÇÃO E COMPILAÇÃO
1. Realize a extração dos arquivos MatrizOpenMP.zip em um diretório de sua escolha.
2. Localize o diretório através do Terminal (comando cd)
3. Ao acessar o diretório, execute o comando make (ex.: `~/Documentos/C/MatrizOpenMP$ make`) para compilar os arquivos. Será exibido no terminal algo semelhante a:
```
user@machine:~/Documentos/C/GitHub/c-matrix-openmp$ make
gcc -Wall  -c main_matriz_openmp.c -fopenmp
gcc -Wall  -c matriz.c -fopenmp
gcc -Wall  -c toolsv2.c -fopenmp
gcc -Wall  -c matriz-operacoes-openmp.c -fopenmp
gcc -Wall  matriz-operacoes-openmp.o matriz.o toolsv2.o main_matriz_openmp.c -o main_matriz_openmp -fopenmp
gcc -Wall  matriz.o toolsv2.o gera_matriz2.c -o gera_matriz2 -fopenmp


####### Exemplo de Execução #######
./gera_matriz2 100 100
./main_matriz_openmp 100x100-mat.map 100x100-mat.map 2
```
4. Caso seja necessária uma recompilação, é aconselhavel a utilização do comando `make clean` antes da execução de um novo camando `make`, para que os arquivos executáveis sejam excluídos. (ex.: `~/Documentos/C/MatrizOpenMP$ make clean`)

# PASSOS PARA GERAÇÃO
1. Para gerar um arquivo, é necessário executar o comando gera_matriz2, passando os parâmetros de linha e coluna. (ex.: `./gera_matriz2 100 100`: Gera um arquivo com uma matriz 100x100 nomeado _100x100-mat.map_)

# PASSOS PARA EXECUÇÃO
1. Para a execução do arquivo main, é necessário executar o camando main_matriz_openmp, passandos os parâmetros de 'matriz a' e 'matriz b', que devem indicar o nome dos arquivos, e 'thread', que deve indicar o número de Threads a serem executadas. (ex.: `./main_matriz_thread 100x100-mat.map 100x100-mat.map 2`)

# DESCRIÇÃO DAS FUNÇÕES
* `gera_matriz2`: Função responsável por gerar os arquivos .map a serem lidos pela main.
    | Parâmetros  | Descrição     |
    |-|-|
    |linhas|Número de Linhas|
    |colunas|Número de Colunas|
* `main_matriz_openmp`: Função principal, responsável por executar as operações.
    | Parâmetros  | Descrição     |
    |-|-|
    |matrizA|Matriz A que será utilizada para as operações|
    |matrizB|Matriz B que será utilizada para as operações|
    |thread|Número de Threads a ser executado|

# OBSERVAÇÕES
* A função `gera_matriz2` gera um arquivo de nome fixo. Caso seja necessária a geração de dois arquivos, deverão ser ajustados manualmente o nome desses arquivos.
* Devido as tratativas realizadas de validação de Alocação de Matriz e de Compatibilidade de Matrizes, tanto o arquivo `main_matriz.c` quando a biblioteca `matriz-operacoes.c` foram ajustados (em específicos os parâmetros a serem passados). Com isso, caso seja necessário a alteração do programa `main_matriz_openmp.c` é importante se atentar aos parâmetros e posições dos mesmos.

# EXEMPLO DE EXECUÇÃO
```
user@machine:~/Documentos/C/GitHub/c-matrix-openmp$ ./main_matriz_openmp 500x500-mat.map 500x500-mat.map 4
Inicio Multiplicação Sequencial.... Execuções: 0 1 2 3 4 5 6 7 8 9 
Inicio Multiplicação Sequencial em Bloco.... Execuções: 0 1 2 3 4 5 6 7 8 9 
Inicio Multiplicação OpenMP.... Execuções: 0 1 2 3 4 5 6 7 8 9 
Inicio Multiplicação OpenMP em Bloco.... Execuções: 0 1 2 3 4 5 6 7 8 9 


	Compara Matriz Sequencial x Matriz Bloco
VERIFICADO: Matrizes identicas
Runtime: 0.001284

	Compara Matriz Sequencial x Matriz Sequencial OpenMP
VERIFICADO: Matrizes identicas
Runtime: 0.001498

	Compara Matriz Bloco x Matriz Bloco OpenMP
VERIFICADO: Matrizes identicas
Runtime: 0.001181

	Tempo Médio Multiplicação IKJ: 0.550216
	Tempo Médio Multiplicação IKJ OpenMP: 0.204009

	Tempo Médio Multiplicação Bloco: 0.586460
	Tempo Médio Multiplicação Bloco OpenMP: 0.245840

	SpeedUp IKJ: 2.697023
	SpeedUp Bloco: 2.385533

```