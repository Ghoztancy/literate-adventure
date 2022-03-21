*** Settings ***
Test Setup  Open Webbrowser
Test Teardown  Close Browser

Library  SeleniumLibrary

*** Variables ***
${BROWSER} =  chrome

*** Keywords ***
Open Webbrowser
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Go To  http://rental16.infotiv.net/webpage/html/gui/index.php
    Wait Until Page Contains  When do you want to make your trip?


Inputs Valid New User Creadentials
    Wait Until Page Contains  Create a new user
    input text  xpath:/html/body/div/div[2]/form/div[1]/input[1]  Tom
    input text  xpath:/html/body/div/div[2]/form/div[1]/input[2]  Bob
    input text  xpath:/html/body/div/div[2]/form/div[1]/input[3]  07297445294
    input text  xpath:/html/body/div/div[2]/form/div[1]/input[4]  Samy9@gmail.com
    input text  xpath:/html/body/div/div[2]/form/div[1]/input[5]  Samy9@gmail.com
    input text  xpath:/html/body/div/div[2]/form/div[1]/input[6]  SteveKarl
    input text  xpath:/html/body/div/div[2]/form/div[1]/input[7]  SteveKarl

Press The Create Button
    Click Button  //*[@id="create"]


LogsIn With Valid Credentials
    input text  xpath:/html/body/header/div/div/div[2]/form/div[1]/input[1]  Samy2@gmail.com
    input text  xpath:/html/body/header/div/div/div[2]/form/div[1]/input[2]  SteveKarl
    Click Button  //*[@id="login"]

Press The My Page Button
    Click Button  //*[@id="mypage"]
    Wait Until Page Contains  My bookings

Check Booking Table Info
    Wait Until Page Contains  orderID
    Wait Until Page Contains  Brand
    Wait Until Page Contains  Model
    Wait Until Page Contains  Booked from
    Wait Until Page Contains  Until
    Wait Until Page Contains  Passengers
    Wait Until Page Contains  License Number
    Wait Until Page Contains  Cancel booking


Enter Date
    Press Key  xpath://*[@id="start"]  0404
    Press Key  xpath://*[@id="end"]  0502



Press Continue
    Click Button  //*[@id="continue"]
    Wait until page contains  What would you like to drive?


Select Tesla Roadester
    Click button  //*[@id="bookRoadsterpass2"]
    wait until page contains  Confirm booking of Tesla Roadster

User enters CardInfo
    input text  xpath:/html/body/div/div[2]/div[2]/form/input[1]  2301729813382914
    input text  xpath:/html/body/div/div[2]/div[2]/form/input[2]  Tom
    Press Key   xpath://*[@id="confirmSelection"]/form/select[1]  5
    Press Key   xpath://*[@id="confirmSelection"]/form/select[2]  2024
    input text  xpath:/html/body/div/div[2]/div[2]/form/input[3]  234

Press Confrim
    Click button  //*[@id="confirm"]
    Wait until page contains  A Tesla Roadster is now ready for pickup 2022-04-04



*** Test Cases ***
User Can Create New User
    [Documentation]  Test Create New User
    [Tags]  Testcase 1
    Click Button  //*[@id="createUser"]
    Given Inputs Valid New User Creadentials
    When Press The Create Button
    Then Wait Until Page Contains  Logout


User Can Access Booking Info
    [Documentation]  Test My Page Bookings Info
    [Tags]  Testcase 2
    Given LogsIn With Valid Credentials
    When Press The My Page Button
    Then Check Booking Table Info


User Can Book a Car
    [Documentation]  Test Book Car
    [Tags]  VG_test
    Given logsin with valid credentials
    When Enter Date
         Press Continue
         select tesla roadester
         User enters CardInfo
    Then Press Confrim









