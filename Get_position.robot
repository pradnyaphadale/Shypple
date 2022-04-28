*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Get QA Test Automation position
    Given the user has access to the Shypple website
    When user opens Careers page
    Then user should be able to find out QA Test Automation position

*** Keywords ***
Given the user has access to the Shypple website
   Open browser   ${website}   Chrome
   Maximize Browser Window
   Element Text Should Be    //*[@class="hero-heading hero"]     Ship it real good.    You are not on the Shypple home page


When user opens Careers page
   Wait Until Keyword Succeeds    2   1s    Click Element    //*[@class='nav-menu-3 w-nav-menu']/*[contains(text(),'Careers')]
   Element Text Should Be     //*[@class='page-intro-64px']    Discover our careers    Your not yet on the Career page
   Click Element    //*[@class='button-primary w-button']  
   Wait Until Keyword Succeeds   2   1s  Element Text Should Be    //*[@class='title open-positions']    Open positions     You are yet not on the position page

Then user should be able to find out QA Test Automation position
   Get Webelement   //*[@class='tabs-content-5 w-tab-content']//*[@class='open-position-grid w-dyn-items']//*[contains(text(),'QA Automation Engineer')]
   Element Should Contain    //*[@class='tabs-content-wrapper']//*[@class='open-position-grid w-dyn-items']   QA Automation Engineer    This position is not available
   Close browser


*** Variables ***
${website}=    https://www.shypple.com/

