*** Settings ***
Documentation    Consultas no site da Petz

Library  SeleniumLibrary
Library  OperatingSystem

Test Teardown   close browser

*** Variables ***
${browser}  Chrome
${url}      https://www.petz.com.br

*** Test Cases ***
Consulta Produto com Clica na Lupa
    [Tags]    rapido
    Dado que acesso o site como cliente
    Dado que escrevo "Ração" na barra de pesquisa
    E clico no botao da lupa
    Entao exibe um grid e o resultado de busca
    Fechar o browser

Consulta Produto Apertando a tecla Enter
    [Tags]    rapido
    Dado que acesso o site como cliente
    Dado que escrevo "Ração" na barra de pesquisa
    E aperto a tecla Enter
    Entao exibe um grid e o resultado de busca
    Fechar o browser

*** Keywords ***
Dado que acesso o site como cliente
    open browser     ${url}  ${browser}

Dado que escrevo "Ração" na barra de pesquisa
    Set test Variable       ${palavra_chave}
    input text      name = q        ${palavra}

E clico no botao da lupa
    click button    button-search

Entao exibe um grid e o resultado de busca
    element should contain  css = h2Categoria.nomeCategoria      Resultados para "${palavra_chave}"

Feche o browser
    close browser

E aperto a tecla Enter
    press key       name = q        ENTER