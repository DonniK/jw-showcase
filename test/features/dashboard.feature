Feature: Dashboard page
    The dashboard page should show one featured slider and multiple default sliders based on the configuration
    It should show a featured card slider for tablet and desktop users
    It should show featured cards vertically for mobile users
    It should show default card sliders
    It should be possible to slide the cards inside the slider

    @tablet @desktop
    Scenario: As a user I want to see the featured slider
        Given I go to the "index" page
        Then the featured slider should be visible

    @mobile
    Scenario: As a user I want to see featured items
        Given I go to the "index" page
        Then there should be 18 featured items visible

    @mobile @tablet @desktop
    Scenario: As a user I want to see the default sliders
        Given I am still on the "index" page
        Then there should be 3 default sliders visible

    @tablet @desktop
    Scenario: As a user I want to be able to navigate forward through the featured feed
        Given I go to the "index" page
        When I click the right arrow in the featured slider
        Then the "first" item in the "featured" slider should not be visible

    @tablet @desktop
    Scenario: As a user I want to be able to navigate backward through a featured feed
        Given I am still on the "index" page
        When I click the left arrow in the featured slider
        Then the "first" item in the "featured" slider should be visible

    @mobile @tablet
    Scenario: As a user I want to be able to navigate forward through a default feed by swiping
        Given I go to the "index" page
        When I scroll to the 1st default slider
        And I swipe left in the 1st default slider
        Then the first item in the 1st default slider should not be visible

    @mobile @tablet
    Scenario: As a user I want to be able to navigate backward through the default feed by swiping
        Given I am still on the "index" page
        And I scroll to the 1st default slider
        And I swipe right in the 1st default slider
        Then the first item in the 1st default slider should be visible

    @tablet @desktop
    Scenario: As a user I want to see when I can't slide to the left
        Given I go to the "index" page
        Then the "left" arrow in the 1st "default" slider should be disabled
        And the "left" arrow in the 2nd "default" slider should be disabled
        And the "left" arrow in the 3th "default" slider should be disabled

    @mobile @tablet @desktop
    Scenario: As a user I want to see title with video count for each slider
        Given I am still on the "index" page
        When I scroll to the 1st "default" slider
        Then the title of the 1st "default" slider should be "Featured Trailers (8)"
        When I scroll to the 2nd "default" slider
        Then the title of the 2st "default" slider should be "Comedy (6)"

    @mobile @tablet @desktop
    Scenario: As a user I want to see the title of the items in the default sliders
        Given I go to the "index" page
        Then the card titles should be visible in the 1st "default" slider

    @tablet @desktop
    Scenario: As a user I want to see the title and description of the visible item in the featured feed
        Given I am still on the "index" page
        When I scroll to the 1st "featured" slider
        Then the title and description should be visible in the featured slider

    @desktop
    Scenario: As a user I want to see the description and duration in the default feeds on mouse hover
        Given I am still on the "index" page
        When I move my mouse to the first item in the 1st "default" slider
        Then I should see the description in the first item of the 1st "default" slider
        And I should see the duration in the first item of the 1st "default" slider

    @mobile
    Scenario: As a user I want to be able to navigate to the video page by clicking on the first featured item
        Given I go to the "index" page
        When I click the first featured item in the dashboard
        Then the page should be "/m/LjBvF1FX/the-girl-in-the-book?list=lrYLc95e"

    @tablet @desktop
    Scenario: As a user I want to be able to navigate to the video page by clicking on the first featured item
        Given I go to the "index" page
        When I click the first item in the 1st "featured" slider
        Then the page should be "/m/LjBvF1FX/the-girl-in-the-book?list=lrYLc95e"

    @desktop
    Scenario: As a user I want to be able to navigate to the video page and start the video by clicking on the item play icon
        Given I go to the "index" page
        When I move my mouse to the first item in the 1st "featured" slider
        And I click the play icon in the visible item in the featured slider
        Then the page should be "/m/LjBvF1FX/the-girl-in-the-book?list=lrYLc95e"
        And the video should be playing

    @desktop
    Scenario: As a user I want to be able to disable the featured text overlay
        Given I set the configLocation to "./fixtures/config/disableFeaturedText.json"
        And I go to the "index" page
        Then the card title should be hidden in the featured slider
        And the card description should be hidden in the featured slider

    @desktop
    Scenario: As a user I want to be able to disable text in a default slider
        Given I set the configLocation to "./fixtures/config/disableDefaultText.json"
        And I go to the "index" page
        Then the card titles should be hidden in the 1st default slider

    @desktop
    Scenario: As a user I want to be able to disable text in a default slider
        Given I set the configLocation to "./fixtures/config/disableDefaultTitle.json"
        And I go to the "index" page
        Then the title of the 1st default slider should be hidden
