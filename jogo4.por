programa {
   inclua biblioteca Util -->u

  //variaveis globais
  inteiro HP = 3, DANO = 5, MAGIA  = 0, DINHEIRO = 100,CLASSE, ARMA = 0, DEFESA = 2, ESQUIVA = 1, ESCOLHA
  cadeia CLASSE_STR, ARMA_STR = "NENHUMA"
  logico PARALISADO = falso

  funcao inicio() {
    inteiro vida_inimigo,dano_inimigo

    //escreva introduçao

    //definir os atributos
    escreva("---Escolha sua classe---\n[1] bruxo [2] feiticeiro(a) [3] guerreiro(a)\n")
    atributos()


    //inicio do codigo do primeiro inimigo

    escreva("\nA caminho do castelo, voce encontra um homem leopardo pedindo gentilmente para que o entregue todos os seus pertences.\n\n---O QUE FAZER?---\n[1] Atacar [2] Ameaçar [3] Hipnotisar [4] Dar seu dinheiro\n")
    leia(ESCOLHA)

      enquanto(ESCOLHA > 4 ou ESCOLHA < 1){
          escreva("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---O QUE FAZER? [1] Atacar [2] Ameaçar [3] Hipnotisar [4] Dar seu dinheiro---\n")
          leia(ESCOLHA)}

//[4] dar dinheiro
    se(ESCOLHA == 4){
      DINHEIRO -= 100

      escreva("\nEntregaste tudo ao sujeito e seguiste com sua jornada.\n")
    }

         //[3] hipnotisar
          se(ESCOLHA == 3){
            se(MAGIA >= 2){
              escreva("\nVOCE HIPNOTISOU O LADRAO E SEGUIU ATE O CASTELO.\n\n")
            }senao{
              escreva("\nO FEITIÇO NAO FUNCIONOU, O QUE FAZER? [1] Atacar [2] Ameaçar\n")
              leia(ESCOLHA)

                enquanto(ESCOLHA > 2 ou ESCOLHA < 1){
                 escreva("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---O QUE FAZER? [1] Atacar [2] Ameaçar---\n\n")
                 leia(ESCOLHA)}

              se(ESCOLHA == 2){
                inteiro ameaca = u.sorteia(1,2)

                se(ameaca == 2){
                  escreva("\nVOCE ESPANTOU O COVARDE E SEGUIU ATE O CASTELO\n\n")
                }senao{
                  escreva("\nSUA AMEAÇA FOI UM FRACASSO\nAGORA ELE SE IRRITOU, SO TE RESTA ATACAR PRIMEIRO\n\n")
                  ESCOLHA = 1
                }
              }
            }
          }

         //[2] ameaçar
          se(ESCOLHA == 2){
                inteiro ameaca = u.sorteia(1,2)

                se(ameaca == 2){
                  escreva("\nVOCE ESPANTOU O COVARDE E SEGUIU ATE O CASTELO\n\n")
                }senao{
                  escreva("\nSUA AMEAÇA FOI UM FRACASSO\nAGORA ELE SE IRRITOU, SO TE RESTA ATACAR PRIMEIRO\n\n")
                  ESCOLHA = 1
                }
              }

                     [1] atacar
                    se(ESCOLHA == 1){
            vida_inimigo = 10
            dano_inimigo = 2
            
            enquanto(vida_inimigo > 0){
              vida_inimigo = ataque(vida_inimigo)

                se(vida_inimigo == 0){
                  pare
                }
            se(PARALISADO == falso){
              escreva("O LADRAO TE ATACA COM UMA FACA.\n---O QUE FAZER? [1] DEFENDER [2] ESQUIVAR\n")
              leia(ESCOLHA)

              enquanto(ESCOLHA > 2 ou ESCOLHA < 1){
              escreva("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---O QUE FAZER? [1] DEFENDER [2] ESQUIVAR\n")
              leia(ESCOLHA)}

              se(ESCOLHA == 1){
                defesa(dano_inimigo)
              }
              se(ESCOLHA == 2){
                esquiva()
                ESCOLHA = 1
              }
            }
            
            }
            escreva("LADRAO: AI AI, TA BOM, NAO IREI MAIS TE PERTUBAR\n\n---VOCE SEGUIU SUA JORNADA---\n")
            }
              status()
              //1 inimigo fim

  }


      funcao vazio atributos(){
        leia(CLASSE)
        enquanto(CLASSE > 3 ou CLASSE < 1){
          escreva("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---Escolha sua classe [1] bruxo [2] feiticeiro [3] guerreiro---\n")
          leia(CLASSE)
        }
        escolha (CLASSE){

            //bruxo
            caso 1:
            HP += 2
            DANO += 2
            MAGIA += 2
            ESQUIVA += 2

            CLASSE_STR = "Bruxo"
            pare

            //feiticeiro
            caso 2:
            MAGIA += 5
            HP -= 1
            DANO -= 2
            DEFESA -= 1

            CLASSE_STR = "Feiticeiro"
            pare

            //guerreiro
            caso 3:
            DANO += 1
            DEFESA += 5
            DINHEIRO += 100

            CLASSE_STR = "Guerreiro"
            pare
            
        }        
      }

          funcao inteiro ataque(inteiro hp_inimigo){
            inteiro atk
            escreva("\n---Escolha o ataque: [1]Fisico [2]Magico---\n")
            leia(atk)

              escolha (atk){

                //ataque fisico
                caso 1:
                hp_inimigo -= DANO
                
                  se(hp_inimigo < 0){hp_inimigo = 0}

                  escreva("\nVOCE CAUSOU: ", DANO," DE DANO E SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n\n")
                  
                  retorne hp_inimigo
                  pare

                  //ataque magico
                  caso 2:
                  se(MAGIA == 0){
                    escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO. SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n")
                  }senao{
                  inteiro elemento, fogo = 0, gelo = 0, chance = 1

                  escreva("\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                  leia(elemento)

                  enquanto(elemento < 1 ou elemento > 2){
                    escreva("\nESCOLHA INCORRETA, TENTE NOVAMENTE\n\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                    leia(elemento)
                  }

                  hp_inimigo -= MAGIA                
                  se(hp_inimigo < 0){hp_inimigo = 0}

                  se(elemento == 1){
                    se(chance < 4){
                    chance = u.sorteia(1,4)
                    }
                    se(chance == 4){
                    fogo = u.sorteia(0,MAGIA)
                    }

                    hp_inimigo -= fogo
                  escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO, E: ",fogo," DE DANO INCENDIARIO.", " SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n")
                  retorne hp_inimigo
                  }

                  se(elemento == 2){
                    se(gelo < 5){
                  gelo = u.sorteia(1,5)
                  }
                  se(gelo == 5){
                    PARALISADO = verdadeiro
                    escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO, E PARALISOU O INIMIGO. SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n")
                    retorne hp_inimigo
                    pare
                  }
                    escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO, E NAO PARALISOU O INIMIGO. SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n")
                  }
                  retorne hp_inimigo
                  pare
                  }
              }
              retorne hp_inimigo
          }

            


            funcao vazio defesa(inteiro dmg_inimigo){
            se(DEFESA < dmg_inimigo){
              HP -=1
              escreva("\nO ATAQUE FOI FORTE DEMAIS PARA VOCE DEFENDER\n\nTE RESTAM ",HP," PONTOS DE VIDA")
              } senao{
              escreva("\nATAQUE DEFENDIDO COM SUCESSO\n")
                }
            }

              funcao vazio esquiva(){
                inteiro esquivou = u.sorteia(ESQUIVA,10)

                se(esquivou == 10){
                  escreva("\nVOCE ESQUIVOU COM SUCESSO\n")
                }senao {
                  HP--
                  escreva("\nVOCE NAO CONSEGUIU DESVIAR DO GOLPE\n\nTE RESTAM ",HP," PONTOS DE VIDA")
                  
                }
              }

                  funcao vazio status(){
                    escreva("******STATUS ATUAIS******\nCLASSE: ",CLASSE_STR,"         ARMA: ",ARMA_STR,"\n\nVIDA: ",HP,"         DANO(FISICO): ",DANO,"\nMAGIA: ",MAGIA,"         DINHEIRO: ",DINHEIRO,"\nDEFESA: ",DEFESA,"         ESQUIVA: ",ESQUIVA,"\n\n")
                  }
          

        funcao vazio armas(){
          escolha (ARMA){
            //espada
            caso 1:
            DANO += 5

            ARMA_STR = "ESPADA"
            pare

            //cajado
            caso 2:
            DANO += 1
            MAGIA += 3

            ARMA_STR = "CAJADO"
            pare

            //escudo
            caso 3:
            DEFESA += 5

            ARMA_STR = "ESCUDO"
            pare
            
            //machado de guerra
            caso 4:
            DEFESA += 2
            DANO += 3

            ARMA_STR = "MACHADO DE GUERRA"
            pare
          }
    }
  }
