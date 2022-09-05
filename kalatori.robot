*** Settings ***
Library           SeleniumLibrary   run_on_failure=Nothing
Suite Setup       Prepare Browser
Suite Teardown    Close Browser
*** Variables ***
${SERVER}         http://127.0.0.1:5501/index.html
${BROWSER}        Chrome
${DRIVER}         104/chromedriver.exe
${DELAY}          0.5

*** Test Cases ***
Menu items
    Menu

Find subheadings
    Subheadings

Kalatori
    Kalatori
    Go Top

Markkinat
    Markkinat
    Go Top
Hinnasto
    Hinnasto
    Go Top
Yhteys
    Yhteys
    Go Top
Sijainti
    Sijainti
    Go Top
Footer
    Footer
    Go Top


*** Keywords ***
Prepare Browser
    Open Browser    ${SERVER}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Go Top
    Click Link       class:logo

Menu
    @{elem} =   Get WebElements     xpath=//nav/ul/li

    FOR  ${item}  IN  @{elem}
        Log to console    ${item.text}
    END

    ${list}=    Create List  @{elem}
    ${count}=   Get length  ${list}
    should be equal as numbers     5    ${count}

Subheadings
    @{elem} =   Get WebElements     tag:h2

    FOR  ${item}  IN  @{elem}
        Log to console    ${item.text}
    END

    ${list}=    Create List  @{elem}
    ${count}=   Get length  ${list}
    should be equal as numbers     4    ${count}

Kalatori
    Click Link       xpath=//ul/li//a[@href="#kalatori"]

    ${main_heading}=    Get text    tag:h1
    should be equal as strings     Kalatori   ${main_heading}

Markkinat
    Click Link       xpath=//ul/li//a[@href="#markkinat"]

Hinnasto
    Click Link       xpath=//ul/li//a[@href="#hinnasto"]

Yhteys
    Click Link       xpath=//ul/li//a[@href="#yhteys"]

Sijainti
    Click Link       xpath=//ul/li//a[@href="#sijainti"]

Footer
    Scroll Element Into View     class:footer_logo
