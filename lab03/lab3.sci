// Pergunta 1
//
// Que o pivô (a1) é diferente de zero
//
// Pergunta 2
//
// c = - aij/ajj, porque esse escalar multiplicado pela linha j e o
// resultado somado à linha i, zera aij que é imediatamente anterior à diagonal
// principal e é o primeiro elemento não-nulo da linha i
//
//
//
//

function [E] = elementar(tam, lin_alfa, col_alfa, alfa)
    E = eye(tam, tam)  // Crio uma matriz tam x tam preenchida com 1's na diagonal principal e com 0's nas outras posições (identidade)
    E(lin_alfa, col_alfa) = -alfa //Mudo um elemento específico para o inverso de um número passado como parâmetro
endfunction

function [A] = eliminacao(A)
    [m, n] = size(A) // número de linhas e colunas da Matriz utilizada

    for j = 1:m-1 // Percorrer as linhas até a penúltima para escolher os pivôs
        pivo = A(j,j) // Escolher o pivô da linha na diagonal principal da matriz
        for i = j+1:m // Percorre as linhas da seguinte ao pivô até o final
            alfa = A(i,j) / pivo // Define o escalar que vai multiplicar a linha do pivô no próximo passo
            
            // Subtrai da linha corrente o produto escalar entre alfa (ajj/aij) e a linha do pivô
            // Opera sobre as linhas apenas nos elementos a partir da coluna do pivô (os anteriores devem necessariamente ser iguais a zero)
            A(i, j:n) = A(i, j:n) - alfa*A(j, j:n)
        end
    end
endfunction

function [x] = subsreversa (U)
    [m, n] = size(U)
    x = zeros(m, 1)
    for j = m:-1:1 // Percorrer as linhas da Matriz, da última para a primeira
        x(j) = U(j, n) // Pega o valor do lado direito da igualdade na linha atual
        for i = m:-1:j+1 // Percorrer as colunas da Matriz, do último coeficiente (linha) até a linha atual
            x(j) = x(j) - U(j,i)*x(i) //Subtrai do valor do lado direito os produtos entre coeficientes e variáveis já conhecidas
            // Na penúltima linha de uma matriz 3x3 irá subtrair c*z do valor que está à direita da igualdade
        end
        x(j) = x(j)/U(j,j)  // Divide resultado pelo coeficiente que multiplica a variável desconhecida, caso esse valor seja diferente de zero, a variável passa a ser conhecida
    end
endfunction
