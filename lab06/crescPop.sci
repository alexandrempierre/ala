// Nessa funcao assumo que os valores em p0 sao em unidades (1000000) e nao em milhoes (1)
function [] = crescPop (p0, k)
    a = gca()
//    a.isoview = "on"; // preciso quebrar a simetria entre os eixos de modo que apareçam 30 unidades em X e um numero potencialmente muito alto em Y
    
    L = [
        0, 0, 45 ; 
        0.05, 0.62095734448, 0 ;
        0, 0.01, 0.05
    ]
    A = L^1 // L passado um ano
    t = [0:k]
    pk = [p0] // L^0 * p0 --> leitura inicial
    
    for i=1:k
        pk(:,$+1) = A * p0 // acrescenta uma coluna aos resultados com o vetor calculado que vai corresponder 
        A = A*L // com as voltas do loop o valor de A sera igual ao de L^i para cada i de 1 a k
    end
    
    pk = int(pk) // sendo uma contagem de indivíduos, os números tem que ser inteiros
    
    plot(t, pk(1,:), 'k-o') // população de 0-1 ano numa linha preta
    plot(t, pk(2,:), 'b-o') // população de 1-10 anos numa linha azul
    plot(t, pk(3,:), 'r-o') // população de 11+ anos numa linha vermelha
endfunction

//function [] = popestavel(L, u0) //u0 = vetor de distribuição da população inicial ex: [p0;p1;p2]
//    
//    i = 1 //inicializa i
//    k = i // k = i = 1
//    f = 0 // fator de proporcionalidade "lambda"
//    
//    while i == k
//        i = i + 1   //i diferente de k
//        
//        u = L^(k+1)*u0    //lado esquerdo da expressão
//        
//        if u == f*L^k*u0  then  //lado direito da expressão
//            disp(u) //vetor final da distribuição estável
//            disp(f) 
//            break
//        end
//        
//        k = k + 1 // k == 1, continua o loop
//    end
//endfunction


function [u, lambda] = popestavel(L, u0)
    n = norm(u0)
    u = u0
    v = L*u0
    lambda = norm(v)
    v = v/lambda
    
    if v == u then
        return
    end
    
    while ~(v == u)
        u = v
        v = L*u
        lambda = norm(L*u)
        v = v/lambda
    end
    
    u = u * n
    
endfunction
