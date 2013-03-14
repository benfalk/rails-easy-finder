# language: en
Feature: Define Finder
  In order to produce readable code
  As a programmer
  I want to define a finder in a clean manner

  Scenario Outline: Programming a finder
    Given I have class
    When I define a finder for "<definer_for_class>" calling it "<definer_method>"
    Then an instance of the class should have a "<definer_method>" method
    And it should produce some kind of results

  Examples:
    | definer_for_class | definer_method |
    | Foo               | find_foo       |
