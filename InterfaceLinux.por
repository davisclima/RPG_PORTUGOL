programa {
   inclua biblioteca Util -->u
   inclua biblioteca Texto -->t
   inclua biblioteca Graficos -->g
   inclua biblioteca Sons -->s
  //variaveis globais
  	inteiro HP = 3, DANO = 5, MAGIA  = 0, DINHEIRO = 100,CLASSE, ARMA = 0, DEFESA = 2, ESQUIVA = 1, ESCOLHA, VELOCIDADE
  	cadeia CLASSE_STR, ARMA_STR = "NENHUMA", TEXTO
 	logico PARALISADO = falso
 	logico DERROTA = falso

  funcao inicio() {
    inteiro vida_inimigo,dano_inimigo

    escreva("=============================================\n          ")
            						escreva_lento("BEM VINDO (A) AO REINO AARD\n",0)
            						escreva("=============================================\n\n")

	escreva("	  █▄██▄█\n")
	escreva(" █▄█▄█▄█▄█▐█┼██▌█▄█▄█▄█▄█\n")
     escreva(" ███┼█████▐████▌█████┼███\n")
     escreva(" █████████▐████▌█████████\n\n")
            						
            						escreva("Voce foi designado(a) para caçar um vampiro chamado Jailson\n\n")

	/*g.iniciar_modo_grafico(verdadeiro)
	g.definir_dimensoes_janela(1600, 600)
	g.definir_titulo_janela("REINO DE AARD")
	g.definir_cor(g.COR_PRETO)
	g.limpar()
	inteiro IMG=g.carregar_imagem("/home/Adamastor2213/PortugolStudio/reinoColorido.png")
	g.desenhar_imagem(0, 0, IMG)
	g.renderizar()*/
    //definir os atributos
    escreva_lento("---Escolha sua classe---\n[1] bruxo [2] feiticeiro(a) [3] guerreiro(a)\n",01)
    atributos()


    //inicio do codigo do primeiro inimigo
	
    escreva_lento("\nA caminho do castelo, voce encontra um homem leopardo pedindo gentilmente para que o entregue todos os seus pertences.",3)
    escreva_lento("\n\n---O QUE FAZER?---\n\n[1] Atacar [2] Ameaçar [3] Hipnotisar [4] Dar seu dinheiro\n",20)
    leia(ESCOLHA)

      enquanto(ESCOLHA > 4 ou ESCOLHA < 1){
          escreva_lento("\nRESPOSTA INCORRETA, TENTE NOVAMENTE\n\n---O QUE FAZER? [1] Atacar [2] Ameaçar [3] Hipnotisar [4] Dar seu dinheiro---\n",2)
          leia(ESCOLHA)}

	//[4] dar dinheiro
	
		    se(ESCOLHA == 4){
		      DINHEIRO -= 100
		
		      escreva_lento("\nEntregaste tudo ao sujeito e seguiste com sua jornada.\n",40)
		      
		    }

     //[3] hipnotisar
     
          se(ESCOLHA == 3){
          	
            se(MAGIA >= 2){
            	
              escreva_lento("\nVOCE HIPNOTISOU O LADRAO E SEGUIU ATE O CASTELO.\n\n",4)
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

			//LOJA INICIO

              escreva_lento("Depois do encontro  com o forasteiro, voce seguiu em direçao a entrada do castelo e ali viu uma loja.\n\n",4)
              escreva_lento("Chegando na loja o vendedor disse:\n\n-COMERCIANTE: Ola viajante, gostaria de comprar algo util para sua misssao?\n\nO seu acervo era o seguinte:",5)
              escreva_lento("\n\n1-ESPADA 60$                        2-CAJADO 60$                       3-ESCUDO 60$\n",2)
              escreva_lento("4-MACHADO DE GUERRA 60$             5-POÇAO DA LEBRE 40$             6-POÇAO DA SAUDE 40$",2)

              enquanto(DINHEIRO >= 40){
              	escreva_lento("\n\nAlgo do acervo te interessa? [1]Sim [2]Nao\n",20)
              	leia(ESCOLHA)
              	enquanto(ESCOLHA >2 ou ESCOLHA<1){
              		escreva("\n\nINFORME CORRETAMENTE A RESPOSTA\n")
              		leia(ESCOLHA)
              		}
              		se (ESCOLHA == 2){
              			pare
              			}
              	 enquanto(DINHEIRO >= 40){
              	 	se(DINHEIRO == 0){
              	 		pare
              	 		}
              	 		
              			escreva_lento("\nSelecione o item de acordo com a numeraçao:\n",20)
					leia(ARMA)
					enquanto(ARMA>6 ou ARMA<1){
						escreva("INFORME O NUMERO CORRETAMENTE\n")
						leia(ARMA)
						}
					armas()
              			se(DINHEIRO >= 40 e DINHEIRO < 60){
              			
              			escreva_lento("Sobrou dinheiro para uma poçao:",20)
              			
              			}
              			senao se(DINHEIRO >= 60){
              				escreva_lento("Sobrou dinheiro para uma arma:\n",20)
              			}
	
             	 	}      
  			}
  			//LOJA FIM

		//INICIO BOSS
  		
  		escreva_lento("\nSem dinheiro para compras, voce finalmente entrou no castelo;\n",20)
		status()   

		escreva_lento("\nO castelo tinha somente um comodo enorme, nele estava o temido Conde Jailson, sentado em seu trono. Ele olha para voce e diz\n",20)
		escreva_lento("\n-Conde Jailson: Outro caçador incompetente? So tava afim de relaxar\n",20)
		
		escreva_lento("\nVoce dispara em sua direçao e prepara o seu ataque...\n",20)
			        	
           vida_inimigo = 50
           dano_inimigo = 6
            
            enquanto(vida_inimigo > 0){
            	
              vida_inimigo = ataque(vida_inimigo)	

                se(vida_inimigo == 0){
                  pare
                }
                
            		se(PARALISADO == falso){
            			
              		escreva_lento("O CONDE ATACA COM SUA MAGIA TREVOSA.\n---O QUE FAZER? [1] DEFENDER [2] ESQUIVAR\n",30)
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
            				escreva_lento("-CONDE JAILSON: C-COMO ISSO PODE ACONTECER?!\n\n",40)
            				escreva("==========================================\n          ")
            						escreva_lento("PARABENS, VOCE VENCEU!\n",90)
            						escreva("==========================================\n")
            				}
            					senao{
            						escreva("===================================\n          ")
            						escreva_lento("FIM DE JOGO\n",90)
            						escreva("===================================\n")
            						}
            						//FIM BOSS
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
		            HP += 1
		
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

                  	escreva_lento("\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n",20)
                  	leia(elemento)

                  		enquanto(elemento < 1 ou elemento > 2){
                    	escreva("\nESCOLHA INCORRETA, TENTE NOVAMENTE\n\n---ESCOLHA O ELEMENTO DA MAGIA [1] FOGO [2] GELO---\n")
                    	leia(elemento)
                  		}

                  		hp_inimigo -= MAGIA  

                  		     //faz que a vida do inimigo nao fique negativa caso o dano seja maior que o hp
                  			se(hp_inimigo < 0){hp_inimigo = 0}

                  			se(elemento == 1){
                  				g.iniciar_modo_grafico(verdadeiro)
									g.definir_dimensoes_janela(450, 250)
									g.definir_titulo_janela("MAGIA FOGO")
									g.definir_cor(g.COR_PRETO)
									g.limpar()
									inteiro IMG=g.carregar_imagem("/home/Davi/PortugolStudio/fogo.jpg")
									g.desenhar_imagem(0, 0, IMG)
									g.renderizar()
									inteiro SOM=s.carregar_som("/home/Davi/PortugolStudio/fogoSom.mp3")
									s.definir_volume(75)
									s.reproduzir_som(SOM, falso)
									u.aguarde(3000)
									g.liberar_imagem(IMG)
									s.liberar_som(SOM)
									g.encerrar_modo_grafico()
                    			se(chance < 4){
                    			
                    			chance = u.sorteia(1,4)
                   				 }
                   				 
                   					se(chance == 4){
                   						
                    				fogo = u.sorteia(0,MAGIA*3)
                    				
                   					 }

                    				hp_inimigo -= fogo
                    				
                  					escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO, E: ",fogo," DE DANO INCENDIARIO.", " SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n\n")
                  					
                  			retorne hp_inimigo
                							
                							}

                  						se(elemento == 2){
                   						g.iniciar_modo_grafico(verdadeiro)
									g.definir_dimensoes_janela(400, 200)
									g.definir_titulo_janela("MAGIA GELO")
									g.definir_cor(g.COR_PRETO)
									g.limpar()
									inteiro IMG=g.carregar_imagem("/home/Davi/PortugolStudio/gelo.jpg")
									g.desenhar_imagem(0, 0, IMG)
									g.renderizar()
									inteiro SOM=s.carregar_som("/home/Davi/PortugolStudio/geloSom.mp3")
									s.definir_volume(75)
									s.reproduzir_som(SOM, falso)
									u.aguarde(3000)
									g.liberar_imagem(IMG)
									s.liberar_som(SOM)
									g.encerrar_modo_grafico()
                   						se(gelo < 5){

                  						//ataque de gelo tem 20% de chance de paralisar
                  						gelo = u.sorteia(MAGIA,11)
                  								  
                  								  }
                  								  
                  							se(gelo == 5){
                  								
                    						PARALISADO = verdadeiro
                    						
                    						escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO, E PARALISOU O INIMIGO. SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n\n")
                    		
                    		retorne hp_inimigo
                    
                  									   }
                    		escreva("\nVOCE CAUSOU: ", MAGIA," DE DANO, E NAO PARALISOU O INIMIGO. SEU INIMIGO TEM: ",hp_inimigo," PONTOS DE VIDA.\n\n")
                  									  
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
                  	escreva_lento("\nO ATAQUE FOI FORTE DEMAIS PARA VOCE DEFENDER\n",20)
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
                  		escreva_lento("\nVOCE NAO CONSEGUIU DESVIAR DO GOLPE\n",20)
                  		DERROTA = verdadeiro
                  		}
                  		senao{
                  	escreva("\nVOCE NAO CONSEGUIU DESVIAR DO GOLPE\n\nTE RESTAM ",HP," PONTOS DE VIDA\n")
                  		}
                	}
              					}


funcao vazio status(){
                  	
                   escreva_lento("\n***********STATUS ATUAIS***********\nCLASSE: ",10)
                   escreva_lento(CLASSE_STR,10)
                   escreva_lento("         ARMA: ",10)
                   escreva_lento(ARMA_STR,10)
                   escreva_lento("\n\nVIDA:   ",10)
                   escreva(HP)
                   escreva_lento("         DANO(FISICO): ",10)
                   escreva(DANO)
                   escreva_lento("\nMAGIA:  ",10)
                   escreva(MAGIA)
                   escreva_lento("         DINHEIRO:    ",10)
                   escreva(DINHEIRO)
                   escreva_lento("\nDEFESA: ",10)
                   escreva(DEFESA)
                   escreva_lento("         ESQUIVA:      ",10)
                   escreva(ESQUIVA,"\n\n")
                    
                  					}



          
funcao vazio armas(){
        	
          escolha (ARMA){
          	
            //espada
            caso 1:
            DANO += 5

            ARMA_STR = "ESPADA"
            DINHEIRO-=60
            pare

            //cajado
            caso 2:
            DANO += 1
            MAGIA += 3

            ARMA_STR = "CAJADO"
            DINHEIRO-=60
            pare

            //escudo
            caso 3:
            DEFESA += 5

            ARMA_STR = "ESCUDO"
            DINHEIRO-=60
            pare
            
            //machado de guerra
            caso 4:
            DEFESA += 2
            DANO += 3

            ARMA_STR = "MACHADO DE GUERRA"
            DINHEIRO-=60
            pare

            //poçao da lebre
            caso 5:
            ESQUIVA+=6
            DINHEIRO-=40

            pare

            
            //poçao da Saude
            caso 6:
            HP+=3
		  DINHEIRO-=40
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
