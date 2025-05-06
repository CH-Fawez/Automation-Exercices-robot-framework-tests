*** Settings ***
Library           SeleniumLibrary
Library           String
Suite Setup       Open Browser To Home Page
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}       chrome
${URL}           https://www.automationexercise.com/
${EMPTY}

*** Test Cases ***

Signup With Empty Email
    [Tags]    signup    negative
    Handle Cookie Consent
    Click Element    xpath=//a[contains(text(),'Signup / Login')]
    Wait Until Element Is Visible    xpath=//h2[normalize-space()='New User Signup!']    10s
    Input Text    xpath=//input[@placeholder='Name']    Faouaz
    Input Text    xpath=//input[@data-qa='signup-email']    ${EMPTY}
    Click Button    css:button[data-qa='signup-button']
    Sleep    2s
    Page Should Contain    New User Signup!

Signup With Invalid Email Format
    [Tags]    signup    negative
    Handle Cookie Consent
    Click Element    xpath=//a[contains(text(),'Signup / Login')]
    Wait Until Element Is Visible    xpath=//h2[normalize-space()='New User Signup!']    10s
    Input Text    xpath=//input[@placeholder='Name']    Faouaz
    Input Text    xpath=//input[@data-qa='signup-email']    faouazmail.com
    Click Button    css:button[data-qa='signup-button']
    Sleep    2s
    Page Should Contain    New User Signup!

Signup With Empty Fields
    [Tags]    signup    negative
    Handle Cookie Consent
    Click Element    xpath=//a[contains(text(),'Signup / Login')]
    Wait Until Element Is Visible    xpath=//h2[normalize-space()='New User Signup!']    10s
    Click Button    css:button[data-qa='signup-button']
    Sleep    2s
    Page Should Contain    New User Signup!

Signup With New Email
    [Tags]    signup    positive
    Handle Cookie Consent
    Click Element    xpath=//a[contains(text(),'Signup / Login')]
    Wait Until Element Is Visible    xpath=//h2[normalize-space()='New User Signup!']    10s
    ${random_email}=    Generate Random Email
    Input Text    xpath=//input[@placeholder='Name']    Faouaz
    Input Text    xpath=//input[@data-qa='signup-email']    ${random_email}
    Click Button    css:button[data-qa='signup-button']
    Wait Until Page Contains Element    xpath=//b[normalize-space()='Enter Account Information']    10s
    Page Should Contain Element    xpath=//b[normalize-space()='Enter Account Information']
    
    Click Element    id=id_gender1
    Input Text    id=password    Test@1234
    Select From List By Value    id=days    10
    Select From List By Value    id=months    5
    Select From List By Value    id=years    1990
    Click Element    id=newsletter
    Click Element    id=optin
    Input Text    id=first_name    Faouaz
    Input Text    id=last_name     Chaieb
    Input Text    id=company       Test IT
    Input Text    id=address1      123 Rue des Tests
    Input Text    id=address2      Bureau 404
    Select From List By Value    id=country    Canada
    Input Text    id=state         HAKUNA_MATATA
    Input Text    id=city          JUPITER
    Input Text    id=zipcode       H2X1Y4
    Input Text    xpath=//input[@id='mobile_number']  5141234567
    Click Button    xpath=//button[normalize-space()='Create Account']
    Wait Until Page Contains Element    xpath=//b[normalize-space()='Account Created!']    10s
    Page Should Contain Element         xpath=//b[normalize-space()='Account Created!']
    Click Element    xpath=//a[@data-qa='continue-button']
    Wait Until Element Is Visible       xpath=//a[contains(text(),'Delete Account')]    10s
    Page Should Contain Element         xpath=//a[contains(text(),'Delete Account')]

    # Delete account
    Click Element    xpath=//a[contains(text(),'Delete Account')]
    Wait Until Page Contains Element    xpath=//b[normalize-space()='Account Deleted!']    10s
    Page Should Contain Element         xpath=//b[normalize-space()='Account Deleted!']
    Click Element    xpath=//a[@data-qa='continue-button']

*** Keywords ***

Open Browser To Home Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Handle Cookie Consent
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    xpath=/html/body/div/div[2]/div[2]/div[2]/div[2]/button[1]/p
    IF    ${exists}
        Click Element    xpath=/html/body/div/div[2]/div[2]/div[2]/div[2]/button[1]/p
        Sleep    1s
    END

Generate Random Email
    ${random}=    Generate Random String    6    [LETTERS]
    ${email}=     Set Variable    test${random}@mail.com
    RETURN        ${email}
