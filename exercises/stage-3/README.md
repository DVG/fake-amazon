# Assignment: Writing gherkin at the proper level

Hey, the devs are complaining that your tests are breaking every time they make
a tiny change and it is slowing things down. Do you think you could do something
about that?

## Gherkin a High Level Language for describing features

When we look at the previous example, we basically wrote out a list of
instructions on how to test the feature end-to-end. It was highly repetiive and
not resistant to any sort of change in the flow or the low-level implementation
details of the pages themselves. That means that if the developer makes any
trivial change to the user interface, our test stops working and the value is
lost.

**Gherkin works best when you write it at a high level**. I personally find
moving to stage 3 to be the most challenging transition, as many automated QA
staff used to be manual QA staff who wrote manual test scripts designed to
instruct an unfamiliar human how to use a product.

When designing your gherkin steps consider the following:

Given is for context
When is for actions
Then is for assertions.

What is the simpliest thing you can write to test various scenarios for this
feature?

In this case we have several scenarios based on our business rules:

A regular user with a cart worth less than $35
A regular user with a cart worth exactly $35
A regular user with a cart worth more than $35
A prime user with a cart worth less than $35
A prime user with a cart worth exactly $35
A prime user with a cart worth more than $35

Each of these scenarios are a context to run the test. These belong in a Given
step.

The When is relatively simple: `When I checkout`

The Then should assert that the correct shipping options are displayed based on
the context.

```gherkin
Given I am logged in as a regular user
And I have a cart with 1 product worth $34
When I checkout
Then I should only have the option for standard shipping
```

That's much simplier to understand isn't it? There's also no information about
HOW these actions are accomplished, leaving it to the step definitions to decide
how to accomplish these concrete actions.

*Now go through and write all six scenarios out like the above example and implement the tests*
