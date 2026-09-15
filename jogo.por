programa {
  //variaveis globais
  inteiro HP = 3, DANO = 5, MAGIA  = 0, DINHEIRO = 100, RESPEITO = 100,  CLASSE, ARMA, DEFESA = 2, ESQUIVA = 5

  funcao inicio() {

    //escreva introduçao

    escreva("Escolha sua classe [1] bruxo [2] feiticeiro [3] guerreiro\n")
    atributos()

    escreva("\nA caminho do castelo, voce encontra um homem leopardo pedindo gentilmente para que o entregue todos os seus pertences, o que fazer? [1] Atacar [2] Dar seu dinheiro [3] Hipnotisa-lo")


    
  }


      funcao vazio atributos(){
        leia(CLASSE)
        enquanto(CLASSE > 3 ou CLASSE < 1){
          escreva("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\nEscolha sua classe [1] bruxo [2] feiticeiro [3] guerreiro\n")
          leia(CLASSE)
        }
        escolha (CLASSE){

            //bruxo
            caso 1:
            HP += 2
            DANO += 2
            MAGIA += 2
            ESQUIVA += 2
            pare

            //feiticeiro
            caso 2:
            MAGIA += 5
            HP -= 1
            DANO -= 2
            DEFESA -= 1
            pare

            //guerreiro
            caso 3:
            DANO += 1
            DEFESA += 5
            DINHEIRO += 100
            pare
            
        }

        
        
      }
        /*funcao vazio armas(){
          escolha (ARMA){
            //espada
            caso 1:
            DANO += 5
            pare

            //cajado
            caso 2:
            DANO += 1
            MAGIA += 3
            pare

            //escudo
            caso 3:
            DEFESA += 5
            pare
            
            //machado de guerra
            caso 4:
            DEFESA += 2
            DANO += 3
            pare
          }
    }
  }*/
}
