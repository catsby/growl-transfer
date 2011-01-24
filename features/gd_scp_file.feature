Feature: growl-down downloads a file via scp

    As a busy developer
    I want to download a large file via scp
    And receive a growl notice when it is completed
    So that I can do other things in the meantime 
    And not have to watch or check the progress 

    Scenario: download file assuming ssh keyless authentication
        Given I have an available shell
        When I run growl-down with "ctshryock.com" as the server path and "unicorns.png.bz2" as the file name