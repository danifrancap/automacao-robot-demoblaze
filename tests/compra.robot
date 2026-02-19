*** Settings ***
Resource    ..//resources/base.robot    
Test Teardown      Fechar o navegador

*** Test Cases ***
Realizar compra de celulares com sucesso    
    Dado que eu abri o site e fiz meu cadastro e login
    Quando eu adiciono alguns produtos na cesta
    E vou para a tela do carrinho
    E compro os celulares e preencho os dados
    Entao devo receber uma mensagem de compra com sucesso







    
    
