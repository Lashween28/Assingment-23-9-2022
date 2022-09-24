*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
1.Login To Deriv
    Open Browser   https://app.deriv.com/account/api-token   chrome
    Maximize Browser Window
    Set Selenium Speed  1
    Wait Until Page Contains Element  //input[@type='email']  10
    Input Text    //input[@type='email']    lashweenraj@besquare.com.my
    Input Text    //input[@type='password']    Lashween28
    Click Element  //button[@type='submit'] 

2.Choose Scopes and input token name
    Wait Until Element Is Visible   //span[@class='dc-checkbox__box']    10
    Click Element   //span[@class='dc-checkbox__box']
    
    Wait Until Element Is Visible    //input[@name='token_name']    10
    Input Text      //input[@name='token_name']    testt


3.Clicking create to generate token

    Click Element  //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]

4.Clicking to copy Token

    Click Element   //table[@class='da-api-token__table']/tbody/tr[5]/td[2]/div/div[last()-1]
    # Click Element  //*[@class='dc-icon dc-clipboard']
    # Click Element   //*[@class='dc-icon da-api-token__visibility-icondc-icon da-api-token__visibility-icon']
    # # Click Element   //div[@class="dc-popover__target"]


5.Click to view button

   Click Element   //*[@class="dc-icon da-api-token__visibility-icon"]
   Click Element    //*[@class="dc-icon da-api-token__visibility-icon"] 


6.Cancel to Delete Token

   Click Element   //*[@class="dc-icon dc-clipboard da-api-token__delete-icon"]
   Click Element   //button[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large dc-dialog__button']

7.Delete Token
   Click Element   //*[@class="dc-icon dc-clipboard da-api-token__delete-icon"]
   Click Element  //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]
   