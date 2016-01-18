// O ponto do quadrado correspondente à extremidade de um vetor w do plano 
// será desenhado como a extremidade do vetor u0+M*w

function [] = desenhaQuad (M, u0)
    a = gca() //obtem posição dos eixos
    a.isoview = "on" //usa a mesma escala nos dois eixos
//    a.axes_visible = "on"
    
    //defina o vetor w0 da translação que centra os eixos
    w0 = [1,1]'
    
    //defina a matriz V dos vértices
    V = [ [0,0]',[1,0]',[0,1]',[1,1]' ]
    
    //defina a matriz U0 = [u0-w0, u0-w0, u0-w0, u0-w0]
    U0 = [u0-w0, u0-w0, u0-w0, u0-w0]
    
    //defina o escalar b
    b = 2
    
    //calcule C=(M*V+U0)/b
    C = (M*V + U0)/b
    
    //  0   1   0   1
    //  0   0   1   1
      
//    xsegs([V(1,1), V(1,2)], [V(2,1), V(2,2)]) // x0 = 0, x1 = 1, y0 = 0, y1 = 0
//    xsegs([V(1,1), V(1,3)], [V(2,1), V(2,3)]) // x0 = 0, x1 = 0, y0 = 0, y1 = 1
//    
//    xsegs([V(1,2), V(1,4)], [V(2,2), V(2,4)]) // x0 = 1, x1 = 1, y0 = 0, y1 = 1
//    xsegs([V(1,3), V(1,4)], [V(2,3), V(2,4)]) // x0 = 0, x1 = 1, y0 = 1, y1 = 1
//    
//    xsegs([V(1,4), V(1,2)], [V(2,4), V(2,2)])
//    xsegs([V(1,4), V(1,3)], [V(2,4), V(2,3)])
    
    
    for i=1:2
        //plote dois lados do quadrilátero
        xsegs([C(1,i^2), C(1,2)], [C(2,i^2), C(2,2)])
        
        //plote os outros dois lados do quadrilátero
        xsegs([C(1,i^2), C(1,3)], [C(2,i^2), C(2,3)])
    end
    
endfunction

function [] = I ()
    // segmento vertical
    M = [0, 0; 
          1, 0]   // zera o tamanho dos segmentos horizontais
    U = [.25,0]' // desloca o segmento 0.5 unidade para a direita
    desenhaQuad(M, U)
    
    // segmento horizontal inferior
    M = [.5, 0; // deixa o segmento horizontal inferior com 0.5 unidade de comprimento
          0, 0]  // zera o tamanho dos segmentos verticais
    U = [0,0]'  // não desloca o segmento
    desenhaQuad(M, U)
    
    // segmento horizontal superior
    M = M
    U = [0,1]' // desloca o segmento 1 unidade para cima
    desenhaQuad(M, U)
endfunction

function [] = I_italico ()
    // segmento vertical
    M = [0, sin(%pi/10); // zera o tamanho dos segmentos horizontais 
          0, 1]          // e inclina o segmento vertical em 18 graus no sentido horario
    U = [0,0]' // não desloca o segmento
    desenhaQuad(M, U)
    
    // segmento horizontal inferior
    M = [.6, 0;   // deixa o segmento horizontal inferior com 0.5 unidade de comprimento
          0, 0]    // zera o tamanho dos segmentos verticais
    U = [-.3,0]' // desloca o segmento 0.3 unidade para a esquerda
    desenhaQuad(M, U)
    
    // segmento horizontal superior
    M = M
    U = [0,1]' // desloca o segmento 1 unidade para cima
    desenhaQuad(M, U)
endfunction

function [] = L ()
    // segmento vertical
    M = [0, 0; 
          1, 0] // zera o tamanho dos segmentos horizontais
    U = [,0]'  // desloca o segmento 0.5 unidade para a direita
    desenhaQuad(M, U)
    
    // segmento horizontal inferior
    M = [.6, 0; // deixa o segmento horizontal inferior com 0.5 unidade de comprimento
          0, 0]  // zera o tamanho dos segmentos verticais
    U = [0,0]'  // não desloca o segmento
    desenhaQuad(M, U)
endfunction

function [] = F ()
    // segmento vertical
    M = [0, 0; 
          1, 0] // zera o tamanho dos segmentos horizontais
    U = [0,0]'  // desloca o segmento 0.5 unidade para a direita
    desenhaQuad(M, U)
    
    // segmento horizontal maior
    M = [.6, 0; // deixa o segmento horizontal maior com 0.5 unidade de comprimento
          0, 0]  // zera o tamanho dos segmentos verticais
    U = [0,1]'  // desloca o segmento 1 unidade para cima
    desenhaQuad(M, U)
    
    // segmento horizontal menor
    M = [.4, 0; // deixa o segmento horizontal menor com 0.25 unidade de comprimento
          0, 0]  // zera o tamanho dos segmentos verticais
    U = [0,.5]'  //não desloca o segmento 0.5 unidade para cima
    desenhaQuad(M, U)
endfunction

function [] = H ()

    M = [0, 0; 
          1, 0]
    U = [0,0]'
    desenhaQuad(M, U)
    
    M = [.5, 0;
          0, 0]
    U = [0,.5]'
    desenhaQuad(M, U)
    
    M = [0, 0; 
          1, 0]
    U = [.5,0]'
    desenhaQuad(M, U)
endfunction

function [] = V ()

    M = [0, sin(%pi/10);
          0, 1]         
    U = [0,0]'
    desenhaQuad(M, U)
    
    M = [0, -sin(%pi/10);
          0, 1]          
    U = [0,0]'
    desenhaQuad(M, U)
endfunction

function [] = Y ()
    M=[0,0;
       0,.5]
    U=[.5,0]'
    desenhaQuad(M,U)
    
    M=[0,-sin(%pi/10);
       0,.5]
    U=[.5,.5]'
    desenhaQuad(M,U)
    
    M=[0,sin(%pi/10);
       0,.5]
    U=[.5,.5]'
    desenhaQuad(M,U)
endfunction

function [] = Y_italico ()
    ita = sin(%pi/20)
    mat_ita = [0,ita;
               0,0]
    M=[0,0;
       0,.5]
    U=[.5-ita,0]'
    desenhaQuad(M+mat_ita,U)
    
    M=[0,-sin(%pi/10);
       0,.5]
    U=[.5,.5]'
    desenhaQuad(M+mat_ita,U)
    
    M=[0,sin(%pi/10);
       0,.5]
    U=[.5,.5]'
    desenhaQuad(M+mat_ita,U)
endfunction

function [] = W ()
    M = [0,-sin(%pi/12);
         0,1]
    U = [0,0]'
    desenhaQuad(M,U)
    
    M = [0,sin(%pi/12);
         0,1]
    U = [.5,0]'
    desenhaQuad(M,U)
    
    M = [0,sin(%pi/12);
         0,.5]
    U = [0,0]'
    desenhaQuad(M,U)
    
    M = [0,-sin(%pi/12);
         0,.5]
    U = [.5,0]'
    desenhaQuad(M,U)
endfunction

function [] = S ()
    M=[0,sin(%pi/6);
       0,.5]
    U=[0,.5]'
    desenhaQuad(M,U)
    
    M=[0,-sin(%pi/6);
       0,.5]
    U=[0,.5]'
    desenhaQuad(M,U)
    
    M=[0,-2*sin(%pi/6);
       0,1]
    U=[.5,1]'
    desenhaQuad(M,U)
    
    M=[0,sin(%pi/6);
       0,.5]
    U=[-.5,2]'
    desenhaQuad(M,U)
    
    M=[0,-sin(%pi/6);
       0,.5]
    U=[.5,2]'
    desenhaQuad(M,U)
endfunction

function letras()
    titlepage(["Letras";"Alexandre Pierre"])
    sleep(1000)
    clf()
    
    I()
    sleep(500)
    clf()
    
    I_italico()
    sleep(500)
    clf()
    
    L()
    sleep(500)
    clf()
    
    F()
    sleep(500)
    clf()
    
    H()
    sleep(500)
    clf()
    
    V()
    sleep(500)
    clf()
    
    Y()
    sleep(500)
    clf()
    
    Y_italico()
    sleep(500)
    clf()
    
    W()
    sleep(500)
    clf()
    
    S()
    sleep(500)
    clf()
    
//    exit(0)
endfunction
