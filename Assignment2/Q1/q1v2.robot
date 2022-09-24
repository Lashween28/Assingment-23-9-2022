# Notification pops up only if select Admin
# Did another test case when select Admin

*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
1.Login To Deriv
    Open Browser   https://app.deriv.com/account/api-token   chrome
    Maximize Browser Window
    Set Selenium Speed  1
    Wait Until Page Contains Element  //input[@type='email']  10
    Input Text    //input[@type='email']    Your email
    Input Text    //input[@type='password']    Your pw
    Click Element  //button[@type='submit'] 


2.Choose Scope (Admin)
    Wait Until Element Is Visible   //.//span[text()='Admin']
    Click Element   //.//span[text()='Admin']

3.Enter token name
   
    Wait Until Element Is Visible    //input[@name='token_name']    10
    Input Text      //input[@name='token_name']    Machi

4.Clicking Create to generate token

    Click Element  //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]

5.Clicking to copy Token

   Click Element  //*[@class="dc-icon dc-clipboard"]

6.Click to view button

   Click Element   //*[@class="dc-icon da-api-token__visibility-icon"]
   Click Element    //*[@class="dc-icon da-api-token__visibility-icon"] 


7.Clicking OK after getting dialog button

   Click Element  //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]


8.Cancel to Delete Token

   Click Element   //*[@class="dc-icon dc-clipboard da-api-token__delete-icon"]
   Click Element   //button[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large dc-dialog__button']

9.Delete Token
   Click Element   //*[@class="dc-icon dc-clipboard da-api-token__delete-icon"]
   Click Element  //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]
   

   

    
