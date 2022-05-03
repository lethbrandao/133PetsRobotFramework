*** Settings ***
Documentation    Testes de consult no buscador Google
...  abre o navegador Chrome
...  e realiza a consulta

Library  SeleniumLibrary
Library  OperatingSystem

*** Variables ***
${browser}  Chrome
${url}      https://www.google.com.br

*** Test Cases ***
Test title
    ## smoketeste se assegurar que o software esta suficientemente pronto para receber os testes
    [Tags]    completo, rapido
    Acessar o Chrome na pagina <https://www.google.com.br>
    Digitar "Ovos de Páscoa" na pesquisa
    Validar se aparece no título da guia o resultado esperado
    Fechar o browser

*** Keywords ***
Setup chromedriver
    Set Environment Variable    webdriver.chrome.driver   C:\\Users\\pc\\PycharmProjects\\133PetsRobotFramework\\venv\\WebDriverManager\\chrome\\100.0.4896.60\\chromedriver_win32\\chromedriver.exe

Acessar o ${browser} na pagina <${url}>
    open browser    ${url}  ${browser}

Digitar ${palavra_chave} na pesquisa
    set Test Variable   ${palavra_chave}
    input text     name = q     ${palavra_chave}
    press keys     name = q     ENTER

Validar se aparece no título da guia o resultado esperado
    ${titulo} =     get title
    get title       $
    Should contain  ${titulo}       ${palavra_chave}

Fechar o browser
    close browser