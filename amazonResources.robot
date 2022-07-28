*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}    http://www.amazon.com.br
${INPUT_SEARCH}    twotabsearchtextbox

*** Keywords ***
Abrir Navegador
    Open Browser    browser=chrome

# Fechar Navegador
#     Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Wait Until Element Is Visible    ${INPUT_SEARCH}
    Input Text    ${INPUT_SEARCH}    ${PRODUTO}
Clicar no botão de pesquisa
    Click Button    nav-search-submit-button
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Page Contains    ${PRODUTO}
Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    //span[contains(text(), 'Console Xbox Series S')]    #pega por texto da tag
    Wait Until Element Is Visible    add-to-cart-button
    Click Element    add-to-cart-button
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains    Adicionado ao carrinho
Remover o produto "Console Xbox Series S" do carrinho
    Click Element    nav-cart-text-container
    Click Element    action:delete    #pega por propriedade da tag
    Element Text Should Be    a    foi removido de Carrinho de compras.
Verificar se o carrinho fica vazio
    Element Text Should Be    nav-cart-count    0