*** Settings ***
Resource    ..//base.robot    


*** Variables ***    

${name_login}      id:sign-username
${senha_login}     id:sign-password    
${botao_login}     xpath://button[text()='Sign up']    
${botao_login2}    xpath://button[text()='Log in']
${celular1}        xpath://a[text()='Samsung galaxy s6']
${add1}            xpath://a[text()='Add to cart']
${home}            xpath://a[text()='Home ']
${celular2}        xpath://a[text()='Nexus 6']
${carrinho}        xpath://a[text()='Cart']
${comprar}        xpath://button[text()='Place Order']    
${name_compra}        id:name
${country_compra}     id:country
${city_compra}        id:city
${card_compra}        id:card
${month_compra}       id:month
${year_compra}        id:year
${purchase}        xpath://button[text()='Purchase']
${mensagem _final}    xpath://h2[text()='Thank you for your purchase!']
${ok}                xpath://button[text()='OK']    

*** Keywords ***    


Dado que eu abri o site e fiz meu cadastro e login
    Open Browser    url=https://www.demoblaze.com/    browser=chrome
    Maximize Browser Window
    Click Element    id:signin2
    Wait Until Element Is Visible    ${name_login}    5s
    ${nome}    FakerLibrary.Name Nonbinary
    Set Test Variable    ${nome_geral}    ${nome}
    Input Text    ${name_login}    ${nome}
    ${senha}    FakerLibrary.Password
    Set Test Variable    ${senha_geral}    ${senha}
    Input Text    ${senha_login}    ${senha}     
    Click Button    ${botao_login}
    Alert Should Be Present    Sign up successful.    ACCEPT    
    Wait Until Element Is Visible    id:login2    5s
    Click Element    id:login2
    Wait Until Element Is Visible    id:loginusername    5s
    Input Text    id:loginusername    ${nome_geral}
    Input Text    id:loginpassword    ${senha_geral}    
    Click Element    ${botao_login2}
Quando eu adiciono alguns produtos na cesta
    Wait Until Element Is Visible    id:nameofuser    10s
    Wait Until Element Is Visible    ${celular1}    10s
    Click Element    ${celular1}
    Wait Until Element Is Visible    ${add1}    
    Click Element    ${add1}
    Alert Should Be Present    Product added.    ACCEPT
    Click Element    ${home}
    Wait Until Element Is Visible    ${celular2}    10s
    Click Element    ${celular2}    
    Wait Until Element Is Visible    ${add1}    
    Click Element    ${add1}   
    Alert Should Be Present    Product added.    ACCEPT
E vou para a tela do carrinho
    Click Element    ${carrinho}
E compro os celulares e preencho os dados 
    Wait Until Element Is Visible    ${comprar}    5s
    Click Element    ${comprar}    
    Wait Until Element Is Visible    ${name_compra}    10s
    Input Text    ${name_compra}    ${nome_geral}   
    ${country}    FakerLibrary.Country    
    Input Text    ${country_compra}    ${country}
    ${city}    FakerLibrary.City    
    Input Text    ${city_compra}    ${city}    
    ${credit_card}    FakerLibrary.Credit Card Number
    Input Text    ${card_compra}    ${credit_card}
    ${month}    FakerLibrary.Month    
    Input Text    ${month_compra}    ${month}    
    ${year}    FakerLibrary.Year
    Input Text    ${year_compra}    ${year}    
    Click Element    ${purchase}  
Entao devo receber uma mensagem de compra com sucesso
    Wait Until Element Is Visible    ${mensagem _final}    10s
    Element Should Be Visible    ${mensagem _final}    10s    
    Sleep    1s
    Click Element    ${ok}
    Wait Until Element Is Not Visible    ${mensagem _final}    10s      
    Wait Until Element Is Visible     id:cat    20s
    Sleep    1s
Fechar o navegador
    Close Browser