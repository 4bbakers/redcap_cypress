Feature: Field Validation

  As a REDCap end user
  I want to see that Field Validation is functioning as expected

  Background:
    Given I am an "admin" user who logs into REDCap
    And I visit the "Control Center" page

  Scenario: Step 1 - Disable validation types in control center
     Given I am an "admin" user who logs into REDCap
     And I visit the "Control Center" page
     And I click on the button labeled "Field Validation Types"
     And I click on the button titled "Disable" for the "Date (D-M-Y)" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Datetime (M-D-Y H:M)" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Datetime w/seconds (Y-M-D H:M:S)" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Email" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Integer" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Number" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Number (1 decimal place –comma as decimal)" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Time (HH:MM)" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Time (HH:MM: SS)" category
     Then I should see "Enable"
     And I click on the button titled "Disable" for the "Phone (UK)" category
     Then I should see "Enable"

  Scenario: Step 2 - Create the Project 
    Given I create a project named "8_FieldValidation_v12414" with project purpose Operational Support via CDISC XML import from fixture location "core/development/8_FieldValidation_v12414.xml"
    Given I visit Project ID 8
    Then I should see "8_FieldValidation_v12414" in the title
    
 Scenario: 3 - Upload data dictionary
    Given I am an "admin" user who logs into REDCap
    Given I visit the "My Projects" page
    Given I visit Project ID 8
    And I upload a data dictionary located at {string} to project ID 8

Scenario: 4 - Verify missing validation types
    Given I am an "admin" user who logs into REDCap
    Given I visit Project ID 8
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Online Designer"
    And I click on the button labeled "Text Validation"
    And I click on the button labeled "Add Field"
    And I select "Text Box" from the dropdown identified by "Field Type"
    And I select "Date (D-M-Y)" from the dropdown identified by "Validation?"
    Then I should NOT see "Date (D-M-Y)" 
    Then I should NOT see "Datetime (M-D-Y H:M)" 
    Then I should NOT see "Datetime w/seconds (Y-M-D H:M:S)" 
    Then I should NOT see "Email" 
    Then I should NOT see "Integer" 
    Then I should NOT see "Number" 
    Then I should NOT see "Number (1 decimal place –comma as decimal)" 
    Then I should NOT see "Time (HH:MM)" 
    Then I should NOT see "Time (HH:MM: SS)" 
    Then I should NOT see "Phone (UK)" 

Scenario: 5 - Enable validation types in control center
     Given I am an "admin" user who logs into REDCap
     And I visit the "Control Center" page
     And I click on the button labeled "Field Validation Types"
     And I click on the button titled "Enable" for the "Date (D-M-Y)" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Datetime (M-D-Y H:M)" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Datetime w/seconds (Y-M-D H:M:S)" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Email" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Integer" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Number" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Number (1 decimal place –comma as decimal)" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Time (HH:MM)" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Time (HH:MM: SS)" category
     Then I should see "Disable"
     And I click on the button titled "Enable" for the "Phone (UK)" category
     Then I should see "Disable"

Scenario: 6 - Verify validation types avaialbe
    Given I am an "admin" user who logs into REDCap
    Given I visit the "My Projects" page
    Given I visit Project ID 8
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Online Designer"
    And I click on the button labeled "Text Validation"
    And I click on the button labeled "Add Field"
    And I select "Text Box" from the dropdown identified by "Field Type"
    And I select "Date (D-M-Y)" from the dropdown identified by "Validation?"
    Then I should see "Date (D-M-Y)" 
    Then I should see "Datetime (M-D-Y H:M)" 
    Then I should see "Datetime w/seconds (Y-M-D H:M:S)" 
    Then I should see "Email" 
    Then I should see "Integer" 
    Then I should see "Number" 
    Then I should see "Number (1 decimal place –comma as decimal)" 
    Then I should see "Time (HH:MM)" 
    Then I should see "Time (HH:MM: SS)" 
    Then I should see "Phone (UK)" 


Scenario: 7 - Create new record with validation type "Date (D-M-Y)"
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "01-31-2022" into the field identified by "Date (D-M-Y)"
    Then I see "The value you provided could not be validated"
    And I click the button labeled "Close" in the dialog box
    When I enter "31-01-2022" into the field identified by "Date (D-M-Y)"
    And I click the link labeled "Save and Stay"
    Then I should see that the "Date (D-M-Y)" field contains the value of "31-01-2022"

Scenario: 8 - Create new record with validation type "DateTime (M-D-Y H:M)"
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "01-31-2022" into the field identified by "DateTime (M-D-Y H:M)"
    Then I see "The value you provided could not be validated"
    And I click the button labeled "Close" in the dialog box
    When I enter "01-31-2022 10:00" into the field identified by "DateTime (M-D-Y H:M)"
    And I click the link labeled "Save and Stay"
    Then I should see that the "DateTime (M-D-Y H:M)" field contains the value of "01-31-2022 10:00"

Scenario: 9 - Create new record with validation type "Datetime w/seconds (Y-M-D H:M:S)" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "01-31-2022 10:00" into the field identified by "Datetime w/seconds (Y-M-D H:M:S)" 
    Then I see "The value you provided could not be validated"
    And I click the button labeled "Close" in the dialog box
    When I enter "2022-01-31 10:00:04" into the field identified by "Datetime w/seconds (Y-M-D H:M:S)" 
    And I click the link labeled "Save and Stay"
    Then I should see that the "Datetime w/seconds (Y-M-D H:M:S)"  field contains the value of "2022-01-31 10:00:04"

Scenario: 10 - Create new record with validation type "Email" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "redcap@" into the field identified by "Email"
    Then I see "This field must be a valid email address"
    And I click the button labeled "Close" in the dialog box
    When I enter "redcap@user.com" into the field identified by "Email" 
    And I click the link labeled "Save and Stay"
    Then I should see that the "Email"  field contains the value of "redcap@user.com"

Scenario: 11 - Create new record with validation type "Integer" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "50.2" into the field identified by "Integer" 
    Then I see "The value you provided is not an integer."
    And I click the button labeled "Close" in the dialog box
    When I enter "50" into the field identified by "Integer" 
    And I click the link labeled "Save and Stay"
    Then I should see that the "Integer"   field contains the value of "50"

Scenario: 12 - Create new record with validation type "Number" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "abc" into the field identified by "Number"
    Then I see "The value you provided is not a number."
    And I click the button labeled "Close" in the dialog box
    When I enter "50.2" into the field identified by "Number" 
    And I click the link labeled "Save and Stay"
    Then I should see that the "Number"   field contains the value of "50.2"

 Scenario: 13 - Create new record with validation type "Number (1 decimal place –comma as decimal)" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "10.9" into the field identified by "Number (1 decimal place –comma as decimal)" 
    Then I see "The value you provided could not be validated"
    And I click the button labeled "Close" in the dialog box
    When I enter "10,9" into the field identified by "Number (1 decimal place –comma as decimal)" 
    And I click the link labeled "Save and Stay"
    Then I should see that the "Number (1 decimal place –comma as decimal)"    field contains the value of "10,9"

Scenario: 14 - Create new record with validation type "Time (HH:MM)" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "17" into the field identified by "Time (HH:MM)" 
    Then I see "The value entered must be a time value"
    And I click the button labeled "Close" in the dialog box
    When I enter "17:00" into the field identified by "Time (HH:MM)" 
    And I click the link labeled "Save and Stay"
    Then I should see that the "Time (HH:MM)"    field contains the value of "17:00"

Scenario: 15 - Create new record with validation type "Time (HH:MM: SS)" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "17:00" into the field identified by "Time (HH:MM: SS)" 
    Then I see "The value entered must be a time value"
    And I click the button labeled "Close" in the dialog box
    When I enter "17:00:01" into the field identified by "Time (HH:MM: SS)" 
    And I click the link labeled "Save and Stay"
    Then I should see that the "Time (HH:MM: SS)"     field contains the value of "17:00:01"
 

 Scenario: 16 - Create new record with validation type "Phone (UK)" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "+44 7911" into the field identified by "Phone (UK)" 
    Then I see "The value you provided could not be validated"
    And I click the button labeled "Close" in the dialog box
    When I enter "+44 7911 123456" into the field identified by "Phone (UK)"  
    And I click the link labeled "Save and Stay"
    Then I should see that the "Phone (UK)"  field contains the value of "+44 7911 123456"

 Scenario: 17 - Create new record with validation type "Phone (US)" 
    Given I visit Project ID 8
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I enter "7911" into the field identified by "Phone (US)" 
    Then I see "The value you provided could not be validated"
    And I click the button labeled "Close" in the dialog box
    When I enter "235-678-9876" into the field identified by "Phone (US)"  
    And I click the link labeled "Save and Stay"
    Then I should see that the "Phone (US)"  field contains the value of "235-678-9876"




Scenario: 18 - Verify range validation for Date (D-M-Y)
   In the Date (D-M-Y) range field, enter 15-02-22
    Alert: “The value you provided is outside the suggested range. (01-01-2022 -31-01-2022). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved

Scenario: 19 - Verify range validation for DateTime (M-D-Y H:M)
    In the DateTime (M-D-Y H:M) range range field, enter 01-15-22 16:00
    Alert: The value you provided is outside the suggested range. (01-01-202210:00 -01-01-202215:36). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved


Scenario: 20 - Verify range validation for DateTime with Seconds (Y-M-D H:M:S)
    In the DateTime with Seconds (Y-M-D H:M:S) range field, enter 2022-01-15 09:15:10
    Alert: “The value you provided is outside the suggested range. (2022-01-01 09:00:00 -2022-01-0109:15:00). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved


Scenario: 21  - Verify range validation for Integer
    In the Integer range field, enter 30
    Alert: “The value you provided is outside the suggested range. (0 -10). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved

Scenario: 22 - Verify range validation for Number
    In the Number range field, enter 5.5
    Alert: “The value you provided is outside the suggested range. (5.505 -6.005). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved

Scenario: 23 - Verify range validation for Number (1 Decimal Place comma as decimal)
    In the Number (1 Decimal Place comma as decimal) range field, enter 21,8
    Alert: “The value you provided is outside the suggested range. (1,0 -20,0). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved

Scenario: 24 - Verify range validation for Time (HH:MM) 
    In the Time (HH:MM) range field, enter 05:01
    Alert: “The value you provided is outside the suggested range. (06:00 -08:00). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved

Scenario: 25 - Verify range validation for Time (HH:MM:SS) 
    In the Time (HH:MM:SS) range field, enter 05:01:00
    Alert: “The value you provided is outside the suggested range. (06:00 -08:00). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved

Scenario: 26 - Verify range validation for Date(today)
    In the Date(today) range field,enter 15-02-22
    Alert: “The value you provided is outside the suggested range. (today-today). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved

Scenario: 27 - Verify range validation for Date (piped)
    In the Date (piped) range field, enter 14-02-22
    The value you provided is outside the suggested range(15-02-2022). This value is admissible...”
    Close pop up
    Data accepted
    Save & Stay
    Record is saved
