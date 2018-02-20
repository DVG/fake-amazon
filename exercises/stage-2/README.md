# Assignment: Write the test with Cucumber

Hey, I was just at a conference and everyone was talking about this Cucumber thing. You can totally write tests without all that weird code, and just use plain english! Write it however you want! We should definitely use that, no one can understand what that test script is even doing.

## How To Get Started

In the project, you'll find a /features directory. This is where you put your cucumber tests.

Cucumber is a translation layer between a plain english 'specification' and some ruby code that automates the browser. It's intended to be a conversation tool between business stakeholders and technical folks.

However, it often gets bastardized as a testing tool, and that's why writing the script in Gherkin (the cucumber 'plain english' language) is Stage 2.

We'll do a quick example in class, but this is what you need to know:

1. A cucumber feature is defined in a .feature file.
2. Each line needs to begin with a cucumber keyword (Feature, Scenario, Given, When, Then And or But)
3. A Feature is a description of something in your application that provides value
4. A scenario is an example of the feature being used
5. Given, When and Then are statements the provide stages to set up a test, execute a test and inspect the test.

For example, in a file called features/login.feature write:

```gherkin
Feature: Logging In

Scenario: Logging In
  Given a user with the email 'btemple@example.com' and the password 'supersecret'
  When I visit the login page
  And I fill in 'user_email' with 'btemple@example.com'
  And I fill in 'user_password' with 'supersecret'
  And I click the button 'Sign in using our secure server'
  Then I should see 'Signed in successfully'
```

When you run the scenario by executing bin/cucumber, you'll get some stub step definitions:

```bash
You can implement step definitions for undefined steps with these snippets:

Given("a user with the email {string} and the password {string}") do |string, string2|
 pending # Write code here that turns the phrase above into concrete actions
end

When("I visit the login page") do
 pending # Write code here that turns the phrase above into concrete actions
end

When("I fill in {string} with {string}") do |string, string2|
 pending # Write code here that turns the phrase above into concrete actions
end

When("I click the button {string}") do |string|
 pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see {string}") do |string|
 pending # Write code here that turns the phrase above into concrete actions
end
```

You can copy and paste these to a file in step_definitions like:  features/step_definitions/example_steps.rb

You might implement these like this:

```ruby
Given("a user with the email {string} and the password {string}") do |email, password|
  FactoryBot.create :user, email: email, password: password
end

When("I visit the login page") do
  visit '/users/sign_in'
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click the button {string}") do |button_text|
  click_button button_text
end

Then("I should see {string}") do |string|
  expect(page).to have_content string
end
```

You can do anything we did in stage one in these step definitions. The only new things here are FactoryBot.create, which will put a user in the test datbase for us, and expect, which is actually asserting that something happened as a result of our actions. We're already closing some of the problems in stage one.

## Now re-implement the shipping over $35 feature using cucumber
