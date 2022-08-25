Feature: Add / Manage Users

  As a REDCap end user
  I want to see that Add / Manage Users is functioning as expected

Background: 
    Given I am an "admin" user who logs into REDCap
    And I visit the "Control Center" page

Scenario: 1- Login as admin1115

Scenario: 2- Visible Pages
    When I click on the link labeled "User Settings"
    Then I should see "System-level User Settings" 

Scenario: 3- Save User Settings System Configurations 
    When I click on the link labeled "User Settings"
    Then I should see "System-level User Settings" 
    When I select "No, only Administrators can create new projects" from the dropdown identified by "select[name=superusers_only_create_project]"
    And I select "No" from the dropdown identified by "select[name=allow_create_db_default]"
    When I click on the input button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

Scenario: 4- Display User Management for Table-based Authentication Page 
    When I click on the link labeled "Add Users (Table-based Only)" 
    Then I should see "User Management for Table-based Authentication"

Scenario: 5- Create a user 
    When I click on the link labeled "Add Users (Table-based Only)" 
    And I enter "user1115_1" into the field labeled "Username:"
    And I enter "User1" into the field labeled "First name:"
    And I enter "1115_1" into the field labeled "Last name:"
    And I enter "user1115@redcap.edu" into the field labeled "Primary email:"
        #checkbox for "Allow this user to request that projects be created for them by a REDCap administrator?" is already checked
    And I click on the input button labeled "Save"
    Then I should see "User has been successfully saved."
    And I should see "An email with login information was sent to: user1115@redcap.edu"

#Scenario: 6- Logout as admin1115

#Scenario: 7 - Reset password through email link 
    #aldefouw will handle password change feature test

#Scenario 8- Login as admin1115

Scenario: 9- Bulk Create users 
    When I click on the link labeled "Add Users (Table-based Only" 
    And I click on the link labeled "Create users (bulk upload)"
    And I upload a "csv" format file located at "import_files/core/02_AddManageUsersv1115_userbulkupload.csv", by clicking "input[name=fname]" to select the file, and clicking "input[name=submit]" to upload the file
    And I should see "User was successfully added, and an email with login info was sent to user"
    And I should see "user1115_2"
    And I should see "user1115_3"
    And I should see "user1115_4"

Scenario: 10- Display Create Single User Page 
    When I click on the link labeled "Add Users (Table-based Only"  
    Then I should see "To create a new user"

Scenario: 11- Prevent a Second User with the Same Username
    When I click on the link labeled "Add Users (Table-based Only)" 
    And I enter "user1115_1" into the field labeled "Username:"
    And I enter "User12" into the field labeled "First name:"
    And I enter "1115_12" into the field labeled "Last name:"
    And I enter "user11115@redcap.edu" into the field labeled "Primary email:"
    And I click on the input button labeled "Save"
    Then I should see "ERROR: The user could not be added! A user already exists named" 

Scenario: 12- Find user1115_1 Under Browse Users Page 
    When I click on the link labeled "Browse Users"
    Then I should see "User Search: Search for user by username, first name, last name, or primary email"
    When I enter "user1115_1" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    And I want to pause   
        #this works but may or may not be what we want
    Then I should see "User1"

Scenario: 13- Cancel Suspend user1115_1 Account
    When I click on the link labeled "Browse Users"
    And I enter "test_user" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    And I click on the input button labeled "Suspend user account"
    Then I should see "Do you wish to suspend this user’s REDCap account?"
        #this popup no longer exists, it just suspends the account immediately 
    When I click on the button labeled "Cancel"
    Then I should NOT see "Success! The user has now been suspended from REDCap."

Scenario: 14- Suspend user1115_1 Account
    When I click on the link labeled "Browse Users"
    And I enter "test_user" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    And I click on the input button labeled "Suspend user account"
        #suspended in last scenario 
    Then I should see "Success! The user has now been suspended from REDCap"
    Then I should see time of suspension field updated to current day and time
        #can not prompt to see current day and time

Scenario: 15- Login with Suspended User Account
    When I click on the link labeled "Log out"
    And I enter "test_user" into the field labeled "Username:"
    And I enter "Testing123" into the field labeled "Password:"
    And I click on the button labeled "Log In"
    Then I should see "The following REDCap user account has been suspended:"

Scenario: 16- View user1115_1 in Suspended Users List
    When I click on the link labeled "Browse Users"
    Then I should see "User Search: Search for user by username, first name, last name, or primary email"
    When I click on the link labeled "View User List By Criteria"
    And I select "Suspended users" from the dropdown identified by "select[name=activity_level]"
    And I click on the button labeled "Display User List"
    And I want to pause
        #this works but may or may not be what we want
    Then I should see a link labeled "test_user"       

Scenario: 17- Cancel Unsuspend user1115_1 Account
    When I click on the link labeled "Browse Users"
    And I click on the link labeled "View User List By Criteria"
    And I select "Suspended users" from the dropdown identified by "select[name=activity_level]"
    And I click on the button labeled "Display User List"
    And I want to pause
        #this works but may or may not be what we want
    And I click on the checkbox identified by "[name=uiid_2]"
    And I click on the button labeled "Unsuspend user"
    Then I should see "Process sponsor request: Unsuspend user"
    When I click on the button labeled "Cancel"
    Then I should NOT see "The changes have been made successfully to the selected users!"

Scenario: 18- Unsuspend user1115_1 Account
    When I click on the link labeled "Browse Users"
    And I click on the link labeled "View User List By Criteria"
    And I select "Suspended users" from the dropdown identified by "select[name=activity_level]"
    And I click on the button labeled "Display User List"
    And I want to pause
        #this works but may or may not be what we want
    And I click on the link labeled "test_user"
    And I click on the link labeled "unsuspend user"
    And I want to pause
    Then I should see "Success! The user has now been unsuspended and will now be able to access REDCap again." 

Scenario: 19- Log out as admin1115
    When I click on the link labeled "Log out"
    Then I should see "Please log in with your user name and password"

###

Scenario: 20- Log in and out as user1115_1
    When I click on the link labeled "Log out"
    And I enter "user1115_1" into the field labeled "Username:"
    And I enter "1115_1Pswd" into the field labeled "Password:" 
    And I click on the button labeled "Log In"
        #password was never reset, login is invalid
    Then I should see a link labeled "Control Center"
    When I click on the link labeled "Log out"
    Then I should see "Please log in with your user name and password"

Scenario: 21- Find user1115_2 Under Browse Users Page 
    When I click on the link labeled "Browse Users"
    And I enter "user1115_2" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    Then I should see "User2"
        #program doesnt detect "User2" in popup screen
        #file was not uploaded, user does not exist

Scenario: 22- Find user1115_2 Under Browse Users Page by email
    When I click on the link labeled "Browse Users"
    And I enter "user1115.2@redcap.edu" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    Then I should see "User2"
        #program doesnt detect "User2" in popup screen
        #file was not uploaded, user does not exist

Scenario: 23- Find user1115_2 Under Browse Users Page by Last name and Cancel Delete User from System
    When I click on the link labeled "Browse Users"
    And I enter "1115_2" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    Then I should see "User2"
        #program doesnt detect "User2" in popup screen
        #file was not uploaded, user does not exist
    When I click on the button labeled "Delete user from system"
    Then I should see "Do you wish to delete this user’s REDCap account?"
    When I click on the button labeled "Cancel"
    Then I should NOT see "The user 'user1115_2' has now been removed and deleted from all REDCap projects"

Scenario: 24- Delete User user1115_2 from System
    When I click on the link labeled "Browse Users"
    And I enter "user1115_2" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    Then I should see "User2"
        #program doesnt detect "User2" i  popup screen
        #file was not uploaded, user does not exist
    When I click on the button labeled "Delete user from system"
    Then I should see "Do you wish to delete this user’s REDCap account?"
    When I click on the button labeled "Delete user"
    Then I should see "The user 'user1115_2' has now been removed and deleted from all REDCap projects"

Scenario: 25- Confirm user1115_2 Does Not Exist 
    When I click on the link labeled "Browse Users"
    And I enter "user1115_2" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    Then I should see "User does not exist!"
        #program doesnt detect "User does not exist!" in popup screen
        #file was not uploaded, user does not exist

Scenario: 26- Login with Deleted User Account
    When I click on the link labeled "Log out"
    And I enter "user1115_2" into the field labeled "Username:"
    And I enter "            ???????????           " into the field labeled "Password:" 
        #no password created or set
    And I click on the button labeled "Log In"
    Then I should see "ERROR: You entered an invalid user name or password!"
        #this test will pass and error will display because there is no password not because account was deleted

#Scenario: 27- Login user user1115_3 from email
        #aldefouw will handle 

#Scenario: 28- Change password for user 1115_3 and log out 
        #aldefouw will handle password change 

Scenario: 29- Cancel Change password for user 1115_4 through Browse Users 
    When I click on the link labeled "Browse Users"
    And I click on the link labeled "View User List By Criteria"
    And I click on the button labeled "Display User List"
    Then I should see "User1"
        #program doesnt detect "User1"
    And I should see "User2"
        #program doesnt detect "User2" - not created
    And I should see "User3"
        #program doesnt detect "User3" - not created
    And I should see "User4"
        #program doesnt detect "User4" - not created
    When I click on the checkbox identified by "[name=     ?????     ]"
        #need checkbox name or id (user1115_4 does not exist)
    And I click on the button labeled "Reset password"
    Then I should see "RESET PASSWORD FOR USER"
    When I click on the button labeled "Cancel"
    Then I should not see "An email has been sent to user1115.4@redcap.edu with a new temporary password"

Scenario: 30- Change password for user1115_4 through Browse Users
    When I click on the link labeled "Browse Users"
    And I click on the link labeled "View User List By Criteria"
    And I click on the button labeled "Display User List"
    And I click on the checkbox identified by "[name=     ????     ]"
        #need checkbox name or id (user1115_4 does not exist)
    And I click on the button labeled "Reset password"
    Then I should see "RESET PASSWORD FOR USER"
    When I click on the button labeled "Reset password"
    Then I should see "An email has been sent to user1115.4@redcap.edu with a new temporary password"

Scenario: 31- Log Into user1115_4 with Old Password
    When I click on the link labeled "Log out"
    And I enter "user1115_4" into the field labeled "Username:"
    And I enter "1115_4Pswd" into the field labeled "Password:" 
    And I click on the button labeled "Log In"
    Then I should see "ERROR: You entered an invalid user name or password!"
        #this test will pass and error will display because there is no password and account was never created not because old password

#Scenario: 32- Login to user1115_4 with New Password Email Link
        #aldefouw will handle 
    #And I should NOT see a link labeled "Control Center"
    #And I should NOT see a link labeled "Create New Project"

Scenario: 33- Change primary Email for user1115_4 
    When I click on the link labeled "Browse Users"
    And I enter "user1115_4" into the field labeled "User Search: Search for user by username, first name, last name, or primary email"
    And I click on the button labeled "Search"
    And I click on the button labeled "Edit user info"
        #file was not uploaded, user does not exist
    And I enter "tester@test.edu" into the field labeled "Primary email:"
    And I click on the button labeled "Save"
    Then I should see "User has been successfully saved"
    And I should see "tester@test.edu" 

Scenario: 34- Update User Settings 
    When I click on the link labeled "User Settings"
    And I select "Yes, normal users can create new projects" from the dropdown identified by "select[name=superusers_only_create_project]"
    And I select "Yes, normal users can move projects to production" from the dropdown identified by "select[name=superusers_only_move_to_prod]"
    Then I should see "Yes, normal users can move projects to production"
        #is not "By default, allow new users to create projects or request that projects be created for them?"
    When I click on the input button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

Scenario: 35- Add user1115_5
    When I click on the link labeled "Add Users (Table-based Only)" 
    And I enter "uuser1115_5" into the field labeled "Username:"
    And I enter "User5" into the field labeled "First name:"
    And I enter "1115_5" into the field labeled "Last name:"
    And I enter "user1115.5@redcap.edu" into the field labeled "Primary email:"
        #checkbox for "Allow this user to create or copy projects" is already checked
    And I click on the input button labeled "Save"
    Then I should see "User has been successfully saved."
    And I should see "An email with login information was sent to: user1115.5@redcap.edu"

#Scenario: 36- Change password for user 1115_1 from email link 
        #aldefouw will handle password change feature test
    #And I should NOT see a link labeled "Control Center"
    #And I should NOT see a link labeled "Create New Project"

Scenario: 37- Edit Security & Authentication settings 
    When I click on the link labeled "Security & Authentication"
    Then I should see "Security & Authentication Configuration"
    When I enter "1" into the field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
        #does not delete previous answer and enters 1 (fills into 51 not 1)
    And I enter "1" into the field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
    And I click on the input button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

Scenario: 38- Log in user1115_5 with Incorrect Password
    When I click on the link labeled "Log out"
    And I enter "user1115_5" into the field labeled "Username:"
    And I enter "test" into the field labeled "Password:" 
    And I click on the button labeled "Log In"
    Then I should see "ERROR: You entered an invalid user name or password!"
        #this test will pass and error will display because there is no password set not because incorrect passwor

Scenario: 39- Log in user1115_5 with Incorrect Password
    When I click on the link labeled "Log out"
    And I enter "user1115_5" into the field labeled "Username:"
    And I enter "1115_5Pswd" into the field labeled "Password:" 
    And I click on the button labeled "Log In"
    Then I should see "ACCESS DENIED! For security purposes, your REDCap user account has been temporarily disabled"
        #password was not reset 
        #scenario 37- reset failed login attempts to 51 not 1

Scenario: 40- Log in user1115_5 with Correct Password after Buffer Period
        #wait 1 minute 
        #user does not exist
    When I click on the link labeled "Log out"
    And I enter "user1115_5" into the field labeled "Username:"
    And I enter "1115_5Pswd" into the field labeled "Password:" 
    And I click on the button labeled "Log In"
        #password was never set so it will not login
    Then I should see a link labeled "Control Center"
    When I click on the link labeled "Log out"
    Then I should see "Please log in with your user name and password"











