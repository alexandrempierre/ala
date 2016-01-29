function[C] = calculaCosseno(a,b)
      C = // ?
endfunction


function[autovalor,autovetor]  = MetodoPot(M,tol)
    [n,n] = size(M)   //Pega tamanho da matriz. Assumindo que só matrizes quadradas serão fornecidas
    X_1 = rand(n,1)   // Definindo um vetor de "chute inicial"
    X_1 = X_1/norm(X_1)  // Normalizando o vetor (trabalhar com vetores normalizados é fundamental para extração do autovalor)
    
    
    
    while()        // Coloque a condição de convergência do método               
        
        
                 
    end
       
    autovetor = // ?
    autovalor = // ?
    
endfunction    



tol = 10^-15 // Tolerância do método. Não se importar muito com este valor.


[autovalor,autovetor] = MetodoPot(M,tol)
disp('O autovalor de maior módulo encontrado foi: ')
disp(autovalor)
disp('E seu autovetor associado foi (normalizado): ')
disp(autovetor)
