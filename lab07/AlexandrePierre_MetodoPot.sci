
A = [20, -1; 
     0, 4]

v0 = [1; 
      1]
      
function [versor] = normalizar(v)
    versor = v / norm(v)
endfunction

function [v] = Vi(A, v0, i)
    v = (A^i)*v0
endfunction

v1 = Vi(A, v0, 1)
v2 = Vi(A, v0, 2)
v3 = Vi(A, v0, 3)
v6 = Vi(A, v0, 6)
v7 = Vi(A, v0, 7)
v19 = Vi(A, v0, 19)
v20 = Vi(A, v0, 20)

function [cosseno] = CalculaCosseno (v1, v2)
    num = v1' * v2
    den = norm(v1) * norm(v2)
    cosseno = num / den
endfunction

function [autovalor, autovetor] = MetodoPot (M, tol)
    [n, n] = size(M)
    
    i = 1
    v0 = normalizar( rand(n,1) )
    v1 = normalizar( Vi(M, v0, i) )
    
    while( CalculaCosseno(v0, v1)^2 < (1 - tol)^2 )
        i = i + 1
        v0 = v1
        v1 = normalizar( Vi(M, v0, i) )
    end
    
    autovetor = v0
    autovalor = autovetor' * (M * autovetor)
endfunction

tol = 10^-15

// Questão 3:
// Para A - 5*I, encontrei autovalor=15 e autovetor=[1, 4.822D-13]'
// Para A^-1, encontrei autovalor=0.25 e autovetor=[0.0623783, 0.9980526]'

// Questão 4:
T = [29, 34, 46 ; 25, 29, 26 ; 38, 17, 56]

function [] = autoCoisasT()
    [avl1, avt1] = MetodoPot(T, tol)
    
    [n, n] = size(T)
    [avl2, avt2] = MetodoPot(T - avl1*eye(n, n), tol)
    
    [avl3, avt3] = MetodoPot(T^-1, tol)
    avl3 = 1 / avl3
    
    autovalores = [avl1, avl2, avl3]
    autovetores = [avt1, avt2, avt3]
    
    disp("Autovalores:")
    disp(avl1, avl2, avl3)
    disp("Autovetores:")
    disp(avt1', avt2', avt3')
endfunction
    
