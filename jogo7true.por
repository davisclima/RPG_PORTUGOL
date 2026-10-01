programa {
   inclua biblioteca Util -->u
   inclua biblioteca Texto -->t

  //variaveis globais
  	inteiro HP = 3, DANO = 5, MAGIA  = 0, DINHEIRO = 100,CLASSE, ARMA = 0, DEFESA = 2, ESQUIVA = 1, ESCOLHA, VELOCIDADE
  	cadeia CLASSE_STR, ARMA_STR = "NENHUMA", TEXTO
 	logico PARALISADO = falso
 	logico DERROTA = falso

  funcao inicio() {
    inteiro vida_inimigo,dano_inimigo

    //escreva introduçao

    //definir os atributos
    escreva_lento("---Escolha sua classe---\n[1] bruxo [2] feiticeiro(a) [3] guerreiro(a)\n",40)
    atributos()


    //inicio do codigo do primeiro inimigo

	
    escreva_lento("\nA caminho do castelo, voce encontra um homem leopardo pedindo gentilmente para que o entregue todos os seus pertences.",30)
    escreva_lento("\n\n---O QUE FAZER?---\n\n[1] Atacar [2] Ameaçar [3] Hipnotisar [4] Dar seu dinheiro\n",20)
    leia(ESCOLHA)

      enquanto(ESCOLHA > 4 ou ESCOLHA < 1){
          escreva_lento("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---O QUE FAZER? [1] Atacar [2] Ameaçar [3] Hipnotisar [4] Dar seu dinheiro---\n",20)
          leia(ESCOLHA)}

	//[4] dar dinheiro
	
		    se(ESCOLHA == 4){
		      DINHEIRO -= 100
		
		      escreva_lento("\nEntregaste tudo ao sujeito e seguiste com sua jornada.\n",40)
		      
		    }

     //[3] hipnotisar
     
          se(ESCOLHA == 3){
          	
            se(MAGIA >= 2){
            	
              escreva_lento("\nVOCE HIPNOTISOU O LADRAO E SEGUIU ATE O CASTELO.\n\n",40)
            }
            
            	senao{
             	 escreva_lento("\nO FEITIÇO NAO FUNCIONOU, O QUE FAZER? [1] Atacar [2] Ameaçar\n",20)
             	 	leia(ESCOLHA)

                	enquanto(ESCOLHA > 2 ou ESCOLHA < 1){
                 		escreva_lento("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---O QUE FAZER? [1] Atacar [2] Ameaçar---\n\n",20)
                		 leia(ESCOLHA)}

            			  se(ESCOLHA == 2){
            			  	
               			 inteiro ameaca = u.sorteia(1,2)

                				se(ameaca == 2){
                					
                 				 escreva_lento("\nVOCE ESPANTOU O COVARDE E SEGUIU ATE O CASTELO\n\n",30)
                 				 
                }
                					senao{
                						
                  						escreva_lento("\nSUA AMEAÇA FOI UM FRACASSO\nAGORA ELE SE IRRITOU, SO TE RESTA ATACAR PRIMEIRO\n\n",20)
                  						
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
       	
       escreva_lento("\nVOCE ESPANTOU O COVARDE E SEGUIU ATE O CASTELO\n\n",40)
       
                }
                
       	senao
       	{
       		
          escreva_lento("\nSUA AMEAÇA FOI UM FRACASSO\nAGORA ELE SE IRRITOU, SO TE RESTA ATACAR PRIMEIRO\n\n",30)

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
            			
              		escreva_lento("O LADRAO TE ATACA COM UMA FACA.\n---O QUE FAZER? [1] DEFENDER [2] ESQUIVAR\n",30)
              		leia(ESCOLHA)

              			enquanto(ESCOLHA > 2 ou ESCOLHA < 1){
              				
              			escreva("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---O QUE FAZER? [1] DEFENDER [2] ESQUIVAR\n",30)
              			leia(ESCOLHA)}

              				se(ESCOLHA == 1){
              					
                			defesa(dano_inimigo)

                			ESCOLHA = 1

                				se(DERROTA == verdadeiro){
                					pare
                					}
                			
              					}
              					
              					se(ESCOLHA == 2){
                				
                				esquiva()
                				
                				ESCOLHA = 1

                				se(DERROTA == verdadeiro){
                					pare
                					}
              			}
            		}
            
            }
            				se (DERROTA == falso){
            				escreva_lento("LADRAO: AI AI, TA BOM, NAO IREI MAIS TE PERTUBAR\n\n---VOCE SEGUIU SUA JORNADA---\n\n",40)
            				}
            					senao{
            						escreva("===================================\n          ")
            						escreva_lento("FIM DE JOGO\n",90)
            						escreva("===================================")
            						}
            }
			//1 inimigo fim

  	se(DERROTA == falso)
  	{
              status()

              escreva_lento("Depois do encontro  com o forasteiro, voce seguiu em direçao a entrada do castelo e ali viu uma loja.\n\n",40)
              escreva_lento("Chegando na loja o vendedor disse:\n\n-COMERCIANTE: Ola viajante, gostaria de comprar algo util para sua misssao?\n\nO seu acervo era o seguinte:",50)
              escreva_lento("\n\n1-ESPADA             2-CAJADO              3-MACHADO DE GUERRA\n",20)
              escreva_lento("4-ESCUDO              5-POÇAO DA LEBRE              6-POÇAO DA SAUDE",20)
              escreva("")

              
  	}
  

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
            	
            se(DEFESA < dmg_inimigo)
            {
            	
              HP -=1
            	se(HP < 1)
            	{
                  	escreva("\nO ATAQUE FOI FORTE DEMAIS PARA VOCE DEFENDER\n")
                  	DERROTA = verdadeiro
                }
              		senao
              		{
              escreva("\nO ATAQUE FOI FORTE DEMAIS PARA VOCE DEFENDER\n\nTE RESTAM ",HP," PONTOS DE VIDA")
              		}
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
                  	se(HP < 1){
                  		escreva("\nVOCE NAO CONSEGUIU DESVIAR DO GOLPE\n")
                  		DERROTA = verdadeiro
                  		}
                  		senao{
                  	escreva("\nVOCE NAO CONSEGUIU DESVIAR DO GOLPE\n\nTE RESTAM ",HP," PONTOS DE VIDA\n")
                  		}
                	}
              					}


funcao vazio status(){
                  	
                   escreva_lento("\n******STATUS ATUAIS******\nCLASSE: ",10)
                   escreva_lento(CLASSE_STR,10)
                   escreva_lento("         ARMA: ",10)
                   escreva_lento(ARMA_STR,10)
                   escreva_lento("\n\nVIDA: ",10)
                   escreva_lento("HP",10)
                   escreva_lento("         DANO(FISICO): ",10)
                   escreva_lento("DANO",10)
                   escreva_lento("\nMAGIA: ",10)
                   escreva_lento("MAGIA",10)
                   escreva_lento("         DINHEIRO: ",10)
                   escreva_lento("DINHEIRO",10)
                   escreva_lento("\nDEFESA: ",10)
                   escreva_lento("DEFESA",10)
                   escreva_lento("         ESQUIVA: ",10)
                   escreva_lento("ESQUIVA\n\n",10)
                    
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


funcao vazio escreva_lento(cadeia TEXTO, inteiro VELOCIDADE){
    inteiro i

    para(i = 0; i < t.numero_caracteres(TEXTO); i++){
        escreva(t.obter_caracter(TEXTO, i))
        u.aguarde(VELOCIDADE)
    }
}

  }
