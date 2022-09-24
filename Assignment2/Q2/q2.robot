*** Settings ***
Library     SeleniumLibrary



*** Test Cases***
1.Login To Deriv
    Open Browser   https://app.deriv.com/account/closing-account   chrome
    Maximize Browser Window
    Set Selenium Speed  0.5
    Wait Until Page Contains Element  //input[@type='email']  10
    Input Text    //input[@type='email']    Your email
    Input Text    //input[@type='password']    Your pw
    Click Element  //button[@type='submit'] 


2.Click to check the Policy
    Click Element    //*[@class="dc-text"]//child::a
    #From policy page revert back to the original page
    Switch Window     


3.Click Cancel for Closing Account

   Wait Until Element Is Visible    //button[@class='dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel']    10
   Click Element    //button[@class='dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel']
   # Check Cancelling worked
   Wait Until Page Does Not Contain Element    //button[@class='dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel']    10
   Page Should Not Contain Element    //button[@class='dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel']

    
4.Clicking on Close My account Button
   
    Click Element   //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]

5.Selecting Reasons and checking continue(1 reason)

    Click Element    //span[contains(., 'I have other financial priorities.')]
    # Check whether Continue is clickable
    Element Should Be Enabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    # Check that other checkboxes are still clickable
    Page Should Not Contain Element    //span[@class='dc-checkbox__box dc-checkbox__box--disabled']

6.Selecting Reasons and checking continue(2 reasons)
    # Click another reason
    Click Element    //span[contains(., 'I want to stop myself from trading.')]
    # Check that Continue is clickable
    Element Should Be Enabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    # Check that other checkboxes are still clickable
    Page Should Not Contain Element    //span[@class='dc-checkbox__box dc-checkbox__box--disabled']

7.Selecting Reasons,checking checkboxes and checking continue(3 reasons)
    # Click another reason
    Click Element    //span[contains(., 'I’m no longer interested in trading.')]
    # Check that Continue is clickable
    Element Should Be Enabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    # Check that other checkboxes are not clickable
    Wait Until Page Contains Element    //span[@class='dc-checkbox__box dc-checkbox__box--disabled']    10
    Page Should Contain Element    //span[@class='dc-checkbox__box dc-checkbox__box--disabled']


8. Checking improve textbox function

    Click Element    //textarea[@name='do_to_improve']
    # Check typing text
    Press Keys    None    Vanakam machi
    # Check that text exists 
    Wait Until Page Contains Element    //textarea[@name='do_to_improve' and contains(.,'Vanakam machi')]    10
    Page Should Contain Element    //textarea[@name='do_to_improve' and contains(.,'Vanakam machi')]
    # Check whether can  input more than 110 characters
    Press Keys    None    CTRL+A
    Press Keys    None    BACKSPACE
    Repeat Keyword    120 times    Press Keys    None    Lashween
    # Check whether that text length is 110
    Wait Until Element Is Visible    //p[@class='dc-text closing-account-reasons__hint' and contains(.,'Remaining characters: 0')]    10
    Page Should Contain Element    //p[@class='dc-text closing-account-reasons__hint' and contains(.,'Remaining characters: 0')]

9. Checking on clicking Back button
  
   Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large']
   # Double check if its working
   Wait Until Element Is Visible    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']    10
   Page Should Contain Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']


# New TEST

10. Proceed to Close Account after testing Back Button

    Wait Until Element Is Visible    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']    10
    Click Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']
    Click Element    //span[contains(., 'I want to stop myself from trading.')]

11.Clicking on Continue button and check for Warning 

    Wait Until Element Is Enabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']    10
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    # Warning page check
    Wait Until Page Contains Element    //div[@class='account-closure-warning-modal']    10
    Page Should Contain Element    //div[@class='account-closure-warning-modal']


12. Checking Go Back button after clicking on Continue on Warning page

    Wait Until Page Contains Element    //button[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large' and contains(.,'Go Back')]    10
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large' and contains(.,'Go Back')]
    # Confirm back button working
    Wait Until Page Does Not Contain Element    //div[@class='account-closure-warning-modal']    10
    Page Should Not Contain Element    //div[@class='account-closure-warning-modal']


13. Checking Close Account button working on Warning page after Clicking on Continue

    Wait Until Element Is Enabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']    10
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    # Warning page check
    Wait Until Page Contains Element    //div[@class='account-closure-warning-modal']    10
    Page Should Contain Element    //div[@class='account-closure-warning-modal']
    # Clicking on Close Account
    Wait Until Page Contains Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large' and contains(.,'Close account')]    10
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large' and contains(.,'Close account')]
    # Confirmation pop-up to see account is closed
    Wait Until Element Is Visible    //p[@class="dc-text account-closed"]


# Last step,if user wants login again after closing account

14.Login back after closing account
    Open Browser    https://app.deriv.com/account/closing-account    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    lashweenraj@besquare.com.my
    Input Text    //input[@type='password']    Lashween28
    Click Element    //button[@type='submit']
    Wait Until Page Contains     Want to start trading on Deriv again?    10
    Page Should Contain    Want to start trading on Deriv again?

  