Feature: growl-down shows options

    As a busy developer
    I want to use Growl-Transfer
    But I don't want to read Ruby Docs
    Or online tutorials

    Scenario: Show version
        Given I run gt with no parameters 
        When I specify option "--version"
        Then I should see "version"