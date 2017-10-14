Feature: Add or Edit Categories
  As a blog administrator
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    I want to be able to create new categories and assign articles to them

  Scenario: Successfully access Categories
    Given I am accessing the categories page
    Then I should see "Description"
    
  Scenario: Successfully add a new Category
    Given I am accessing the categories page
    When I fill in "name" with "Category Name"
    And I fill in "description" with "Description"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Category Name"
    And I should see "Description"
    
  Scenario: Successfully edit a Category
    Given I am on the categories page
    When I fill in "name" with "Category Name"
    And I fill in "description" with "Description"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Category Name"
    When I follow "Category Name"
    When I fill in "name" with "Category edited"
    And I fill in "description" with "Description"
    And I press "Save"
    Then I should be on the categories page
    And I should not see "Category Name"
    And I should not see "Description"
    And I should see "Category edited"
    And I should see "Description"
    
  Scenario: Category should not be created if we click on cancel
    Given I am on the categories page
    When I fill in "name" with "Category Name"
    And I fill in "description" with "Description"
    And I follow "Cancel"
    Then I should be on the categories page
    And I should not see "Category Name"
    And I should not see "Description"

  Scenario: Category should not be edited if we click on cancel on Edit Category
     Given I am on the categories page
    When I fill in "name" with "Category Name"
    And I fill in "description" with "Description"
    And I press "Save"
    Then I should be on the categories page
    And I should not see "Category Name"
    And I should not see "Description"
    And I follow "Cancel"
    Then I should be on the categories page
    And I should see "Category Name"
    And I should see "Description"
    And I should not see "Category edited"