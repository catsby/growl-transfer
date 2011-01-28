Feature: growl-down downloads a file via scp

    As a busy developer
    I want to download a large file via scp
    And receive a growl notice when it is completed
    So that I can do other things in the meantime 
    And not have to watch or check the progress 

    Scenario: Download file assuming ssh keyless authentication
        Given I have ssh keyless auth setup on "ctshryock.com"
        And specify "growl-down-test/unicorns.zip" as the file name
        When I run "download"
        Then I should see "Finished!"
        And TEST_DIR should contains "unicorns.zip" file
        
    Scenario: Download file assuming ssh keyless auth, but specify a username 
        Given I have ssh keyless auth setup on "ctshryock.com"
        And I specify "clint" as the username before the url
        And specify "growl-down-test/unicorns.zip" as the file name
        When I run "download"
        Then I should see "Finished!"
        And TEST_DIR should contains "unicorns.zip" file
        