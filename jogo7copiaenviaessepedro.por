programa 
{
  
   inclua biblioteca Util -->u

  //variaveis globais
  	inteiro HP = 3, DANO = 5, MAGIA  = 0, DINHEIRO = 100,CLASSE, ARMA = 0, DEFESA = 2, ESQUIVA = 1, ESCOLHA, ESCOLHA_CACHORRO = 0
  	cadeia CLASSE_STR, ARMA_STR = "NENHUMA", NOME_CACHORRO
 	logico PARALISADO = falso

  funcao inicio() 
  {
    inteiro vida_inimigo,dano_inimigo

    //escreva introduçao

    //definir os atributos
    escreva("---Escolha sua classe---\n[1] bruxo [2] feiticeiro(a) [3] guerreiro(a)\n")
    atributos()


    //inicio do codigo do primeiro inimigo

    escreva("\nA caminho do castelo, voce encontra um homem leopardo pedindo gentilmente para que o entregue todos os seus pertences.")
    escreva("\n\n---O QUE FAZER?---\n\n[1] Atacar [2] Ameaçar [3] Hipnotisar [4] Dar seu dinheiro\n")
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
            }
            
            	senao{
             	 escreva("\nO FEITIÇO NAO FUNCIONOU, O QUE FAZER? [1] Atacar [2] Ameaçar\n")
             	 	leia(ESCOLHA)

                	enquanto(ESCOLHA > 2 ou ESCOLHA < 1){
                 		escreva("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---O QUE FAZER? [1] Atacar [2] Ameaçar---\n\n")
                		 leia(ESCOLHA)}

            			  se(ESCOLHA == 2){
            			  	
               			 inteiro ameaca = u.sorteia(1,2)

                				se(ameaca == 2){
                					
                 				 escreva("\nVOCE ESPANTOU O COVARDE E SEGUIU ATE O CASTELO\n\n")
                 				 
                }
                					senao{
                						
                  						escreva("\nSUA AMEAÇA FOI UM FRACASSO\nAGORA ELE SE IRRITOU, SO TE RESTA ATACAR PRIMEIRO\n\n")
                  						
                  							ESCOLHA = 1
                }
              }
            }
          }
          

       //[2] ameaçar
         
       se(ESCOLHA == 2){

       //Faz que seja 50/50 dar certo ou nao a ameaça
       inteiro ameaca = u.sorteia(1,2)

       se(ameaca == 2){
       	
       escreva("\nVOCE ESPANTOU O COVARDE E SEGUIU ATE O CASTELO\n\n")
       
                }
                
       	senao
       	{
       		
          escreva("\nSUA AMEAÇA FOI UM FRACASSO\nAGORA ELE SE IRRITOU, SO TE RESTA ATACAR PRIMEIRO\n\n")

          //A ameaça deu errado e o player e obrigado a atacar(ESCOLHA =  1 leva o proximo "se" acontecer que e o do ataque)
          ESCOLHA = 1
                }
              }

          //[1] atacar
           
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
    
    escreva("Enquanto você andava pela sua jornarda, você encontrou um pequeno filhote de cachorro, gostaria de fazer carinho? [1] SIM [2]NAO: ")
    leia(ESCOLHA_CACHORRO)
    
    enquanto(ESCOLHA_CACHORRO > 2 ou ESCOLHA_CACHORRO < 1){
      escreva("Tente novamente, escolha [1] SIM [2] NAO")
    }

    se(ESCOLHA_CACHORRO == 1)
    {
     escreva("Muito bem, Agora ele é seu fiel companheiro +3HP.\n Qual será o nome do seu cachorro?: \n")
     leia(NOME_CACHORRO)
     HP += 3
    }
    senao se(ESCOLHA_CACHORRO == 2)
    {
     escreva("Por que você odeia cachorros?? Péssima escolha")
    }
   

    escreva("Enquanto você procurava objetivos, você acabou se perdendo na floresta mágica e acaba se encontrando com um golem de lava.\n Ficando cara a cara com o monstro ele ficou nervoso e começou a te atacar.")
    escreva("O que você ira fazer? [1] ATACAR [2] JOGAR UM BALDE DE ÁGUA [3] FUGIR.: ")
    leia(ESCOLHA)

    ataques_golem()

    escreva("Após derrotar a criatura e saindo da floresta mágica, acabando com todos os inimigos, você acabou chegando no castelo de Grayscool.\n")
    escreva("Entrando no castelo, você acaba se deparando com um esqueleto, mas não é qualquer esqueleto, ele tem magia e armadura.")
    
    chefao_esqueleto()
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
                HP += 4
		            DANO += 2
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
                  

                  //ataque magico
                  caso 2:
                  
                  se(MAGIA == 0){
                  	
                  escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO. SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n")
                  }
                  
                  	senao{
                  		
                  	inteiro elemento, fogo = 0, gelo = 0, chance = 1

                  	escreva("\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                  	leia(elemento)

                  		enquanto(elemento < 1 ou elemento > 2){
                    	escreva("\nESCOLHA INCORRETA, TENTE NOVAMENTE\n\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                    	leia(elemento)
                  		}

                  		hp_inimigo -= MAGIA  

                  		     //faz que a vida do inimigo nao fique negativa caso o dano seja maior que o hp
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

                  						//ataque de gelo tem 20% de chance de paralisar
                  						gelo = u.sorteia(1,5)
                  								  
                  								  }
                  								  
                  							se(gelo == 5){
                  								
                    						PARALISADO = verdadeiro
                    						
                    						escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO, E PARALISOU O INIMIGO. SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n")
                    		
                    		retorne hp_inimigo
                    
                  									   }
                    		escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO, E NAO PARALISOU O INIMIGO. SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n")
                  									  
                  									  }
                  retorne hp_inimigo
                  
            	     	 }
             		 }
	retorne hp_inimigo
          	}

            


            funcao vazio defesa(inteiro dmg_inimigo){
            	
            se(DEFESA < dmg_inimigo){
            	
              HP -=1
              
              escreva("\nO ATAQUE FOI FORTE DEMAIS PARA VOCE DEFENDER\n\nTE RESTAM ",HP," PONTOS DE VIDA")
              
              } 
              
              		senao
             	 	{
              		escreva("\nATAQUE DEFENDIDO COM SUCESSO\n")
              
              		 }
               
            								  }


              funcao vazio esquiva(){
              	
              inteiro esquivou = u.sorteia(ESQUIVA,10)

              se(esquivou == 10)
              {
                escreva("\nVOCE ESQUIVOU COM SUCESSO\n")
                
                }
                
                	senao 
                	{
                		
                  	HP--
                  	
                  	escreva("\nVOCE NAO CONSEGUIU DESVIAR DO GOLPE\n\nTE RESTAM ",HP," PONTOS DE VIDA")
                  
                	}
              					}


                  funcao vazio status(){
                  	
                    escreva("******STATUS ATUAIS******\nCLASSE: ",CLASSE_STR,"         ARMA: ",ARMA_STR,"\n\nVIDA: ",HP,"         DANO(FISICO): ",DANO,"\nMAGIA: ",MAGIA,"         DINHEIRO: ",DINHEIRO,"\nDEFESA: ",DEFESA,"         ESQUIVA: ",ESQUIVA,"\n\n")
                    
                  					}



          

        funcao vazio armas(){
        	
          escolha (ARMA)
          {
          	
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
        funcao vazio ataques_golem()
        {
          inteiro hp_golem = 5

          se(ESCOLHA == 1)
          {
          escreva("Você deu um maior peteleco na orelha dele")
           hp_golem -= DANO
           
           se(hp_golem >= 1){

           inteiro dano_golem = u.sorteia(1,2)
           HP -= dano_golem
           escreva("Infelizmente, o golem não foi derrotado e com raiva ele te deu um soco na sua cara. Sua vida restante: ", HP)
            
            
           }
           senao{
            escreva(". Você acabou com o golem.")
           }
          }
          senao se(ESCOLHA == 2){
            escreva("Enquanto o golem estava correndo atras de você, você acabou pegando um balde cheio de água e esparramou pelo chão. No qual o golem acabou escorregando.")
            hp_golem -= 5
            escreva("E na pura sorte você acabou ganhando")
          }
          senao se(ESCOLHA == 3){
            escreva("Você acabou fugindo da briga de um jeito covarde")
          }
          senao{
            escreva("Tente novamente, escolha entre [1], [2] ou [3]")
          }
        }

        funcao vazio chefao_esqueleto()
        {
         inteiro hp_esqueleto = 12

         escreva("Ele começou a te atacar com o seu cajado. O que fazer? [1] DESVIAR [2] DEFENDER ")
         leia(ESCOLHA)
         
         enquanto( ESCOLHA < 1 ou ESCOLHA > 3)
         {
         escreva("Erro, escolha inválida, escolha entre [1] DESVIAR [2] DEFENDER")

         leia(ESCOLHA)
         }
          se(ESCOLHA == 1)
          {
            inteiro desvio = u.sorteia(1,2)
            se(desvio == 1)
            {
              escreva("Você desviou com sucesso!")
            }
            senao
            {
              inteiro dano_chefao = u.sorteia(2,4)
              HP -= dano_chefao
              escreva("Seu desvio foi uma porcaria, você esta com, ", HP, "de vida")
            }

          }
          senao se(ESCOLHA == 2)
          {
            escreva("Que tipo de defesa vai escolher? [1] fisica [2] magica")
            leia(ESCOLHA)

            se (ESCOLHA == 1)
            {
            hp_esqueleto -= DANO
            escreva("Você segurou o cajado do esqueleto e você deu uma cabeçada, o chefão esta com ", hp_esqueleto," de vida")
            }
            senao se (ESCOLHA == 2)
            {
              inteiro elemento, fogo = 0, gelo = 0

              escreva("\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                  	leia(elemento)

                  		enquanto(elemento < 1 ou elemento > 2)
                  {
                    	escreva("\nESCOLHA INCORRETA, TENTE NOVAMENTE\n\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                    	leia(elemento)
                  }

                  hp_esqueleto -= MAGIA

                  escreva("você causou ", MAGIA," de dano no esqueleto, ele tem ", hp_esqueleto, "de vida")
            }
          }

          escreva("O esqueleto com ira, jogou uma poção que escurece tudo ao redor, perdido você pode ir em duas direções:")
          escreva("[1] DIREITA [2] ESQUERDA")
          leia(ESCOLHA)

          enquanto(ESCOLHA < 1 ou ESCOLHA > 2)
          {
            escreva("Erro, escolha inválida, escolha entre [1] DIREITA [2] ESQUERDA")
          }
           se(ESCOLHA == 1)
          {
            escreva("Você foi pelo lado direito, sem enxegar")
            inteiro chance = u.sorteia(1,2)

            se(chance == 1)
            {
              escreva("Você se deu de cara com o esqueleto.")
              inteiro dano_chefao = u.sorteia(1,2)
              HP -= dano_chefao
              escreva(" Você tomou, ", dano_chefao, "de dano, você está com ", HP," de vida")
            }
            senao se(chance == 2)
            {
              escreva("Você conseguiu fugir do efeito do esqueleto.")
            }
           }
            senao se( ESCOLHA == 2)
             {
              escreva("Você foi pelo lado esquerdo, sem enxegar")
            inteiro chance = u.sorteia(1,2)

            se(chance == 1)
            {
              escreva("Você se deu de cara com o esqueleto.")
              inteiro dano_chefao = u.sorteia(1,2)
              HP -= dano_chefao
              escreva(" Você tomou, ", dano_chefao, "de dano, você está com ", HP," de vida")
            }
            senao se(chance == 2)
            {
              escreva("Você conseguiu fugir do efeito do esqueleto")
            }
             }
             se( hp_esqueleto >= 1)
             {

              se(ESCOLHA_CACHORRO == 1)
              {
                escreva(" Você, meio desnorteado pela poção mais ainda firme e diante do esqueleto, o que ira fazer?")
                escreva("[1] ATACAR [2] CACHORRO??")
                leia(ESCOLHA)
                
                enquanto(ESCOLHA < 1 ou ESCOLHA > 2)
                {
                 escreva("Erro, escolha inválida, escolha entre [1] ATACAR [2] CACHORRO")
                }

                se (ESCOLHA == 1)
                {
                   inteiro atk
            
                   escreva("\n---Escolha o ataque: [1]Fisico [2]Magico---\n")
                   leia(atk)
                   se(atk == 1)
                   {
                    hp_esqueleto -= DANO
                    escreva(" Você foi andando até ele, e começou uma luta, até que você deu um gancho nele")
                    escreva("O chefao esta com", hp_esqueleto, "de vida")

                     se(hp_esqueleto <= 0)
                      {
                        escreva("\n\n=================================\n")
                        escreva("       VOCE VENCEU O JOGO!\n")
                        escreva("=================================\n")
                        
                      }
                   }
                   senao se(atk == 2)
                   {
                      inteiro elemento, fogo = 0, gelo = 0
                      escreva("\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                    	leia(elemento)

                  		enquanto(elemento < 1 ou elemento > 2)
                  {
                    	escreva("\nESCOLHA INCORRETA, TENTE NOVAMENTE\n\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                    	leia(elemento)
                  }

                  hp_esqueleto -= MAGIA

                  escreva("você causou ", MAGIA," de dano no esqueleto, ele tem ", hp_esqueleto, "de vida")

                  se(hp_esqueleto <= 0)
                  {
                  escreva("\n\n=================================\n")
                  escreva("       VOCE VENCEU O JOGO!\n")
                  escreva("=================================\n")
                  
                  }
                   }
                }
                senao se( ESCOLHA == 2)
                {
                  hp_esqueleto -= DANO
                  escreva("O companheiro ", NOME_CACHORRO, " aparece de forma milagrosa e ele chama uma horda de cachorros e ataca o esqueleto")
                  escreva("O chefao esta com", hp_esqueleto, "de vida")

                  se(hp_esqueleto <= 0)
                  {
                   escreva("\n\n=================================\n")
                   escreva("VOCE VENCEU O JOGO!\n")
                   escreva("=================================\n")
                   
                  } 
                }
              }
              senao se(ESCOLHA_CACHORRO == 2)
              {
                escreva(" Você, meio desnorteado pela poção mais ainda firme e diante do esqueleto, o que ira fazer?")
                escreva("[1] ATACAR")
                leia(ESCOLHA)
                
                enquanto(ESCOLHA < 1 ou ESCOLHA > 1)
                {
                 escreva("Erro, escolha inválida, escolha entre [1] ATACAR")
                }

                se (ESCOLHA == 1)
                {
                   inteiro atk
            
                   escreva("\n---Escolha o ataque: [1]Fisico [2]Magico---\n")
                   leia(atk)

                   enquanto(ESCOLHA < 1 ou ESCOLHA > 2)
                   {
                    escreva("Erro, escolha inválida, escolha entre [1] Fisico [2] Magico")
                   }

                   se(atk == 1)
                   {
                    hp_esqueleto -= DANO
                    escreva("você foi andando até ele, e começou uma luta, até que você deu um gancho nele")
                    escreva("O chefao esta com", hp_esqueleto, "de vida")

                    se(hp_esqueleto <= 0)
                    {
                     escreva("\n\n=================================\n")
                     escreva("VOCE VENCEU O JOGO!\n")
                     escreva("=================================\n")
                   
                    } 
                   }
                   senao se(atk == 2)
                   {
                      inteiro elemento, fogo = 0, gelo = 0
                      escreva("\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                    	leia(elemento)

                  		enquanto(elemento < 1 ou elemento > 2)
                          {
                    	escreva("\nESCOLHA INCORRETA, TENTE NOVAMENTE\n\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                    	leia(elemento)
                  }

                      hp_esqueleto -= MAGIA

                      escreva("você causou ", MAGIA," de dano no esqueleto, ele tem ", hp_esqueleto, "de vida")

                      se(hp_esqueleto <= 0)
                      {
                       escreva("\n\n=================================\n")
                       escreva("VOCE VENCEU O JOGO!\n")
                       escreva("=================================\n")
                   
                      } 
                   }
                }
                
              }
            }
        }
           
            
      }



         
        

    
  
  
