tiny-stack
==========
Dificuldades encontradas

A princípio por mais que tivesse entendido como o processo de criação funcionava, eu não conseguiria fazê-lo por mim mesmo.
Fui atrás de material para entender como desenvolver as partes do projeto e encontrei um tutorial que foi de grande ajuda:
https://beautifulracket.com/basic/

Durante o desenvolvimento do projeto muitas vezes me vi obrigado a deixar o trabalho para assistir aulas, por isso decidi pular
a especificação de testes para o parser, com intuito de ter a lógica implementada até o dia 29/01/2021, mas tendo em mente que
o projeto provavelmente não funcionaria.

Durante a construção do expander, não tinha muita certeza de como implementaria o stack para o programa a solução que encontrei
foi definir uma maquina virtual como a do projeto em: https://www.glossopoeia.com/blog/rapid-instruction-set-prototyping-in-racket
e transformar as expressões da linguagem tiny-stack em uma lista de funções no campo machine-instrs, não sei se funcionou pois
preciso primeiro garantir que o parser está funcionando da maneira que planejei.
