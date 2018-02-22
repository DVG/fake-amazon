# Stage 4: The Page Object Pattern

Look, the business loves how you enumerated the business rules, it's really
clear. You're a rock star. But the devs are still complaining about last week
when they changed the login page and had to wait for you to tweak all those
step definitions. Could you do something about it to make it easier to change?

## A few notes about Object Oriented Programming

Up till now, we've been writing code, but we haven't talked much about
how programming works. I will try and explain it as simply as possible:

1. Everything you deal with in ruby is an object
2. An object is a model representing a thing or idea in the real world
3. An object makes working with code easier by keeping the details contained
   behind a particular interface (This is called 'Encapsulation')
4. An object makes it possible to use the same interface on lots of slightly
   different objects (This is called 'Polymorphism')
5. An object can obtain behavior from a parent object (This is called 'Inheritance')
6. A `class` is the set of instructions for creating a given object.

Up till now, we've been programming against an object representing the Web
Browser. It's interface is based around clicking on buttons and links and
filling out inputs.

However, as humans, we don't think so much about the individual UI elements as
we do about how to use the page to accomplish a task.

Therefore, we will create models of pages, called page objects, that expose an
interface for performing tasks. This means when the details of the page changes,
we do not need to update every test that uses the page, just the page model itself.

When you scale testing up to 100, 200, 1000 tests, this is invaluable.

## Creating a page object

In the feature/support/pages folder, you can define a page object. Name it after the page in question. For instance home_page.rb for the HomePage page object.

We can start by defining a subclass of SitePrism::Page

```ruby
class HomePage < SitePrism::Page
end
```

This is an example of a **class** that is **inheriting behavior** from a parent class.

The full documentation for SitePrism is [here](https://github.com/natritmeyer/site_prism)

Some things that you can do:

### Setting the url for the page

class HomePage < SitePrism::Page
  set_url "/"
end

This allows you to, in your test, to create a instance of the page object and go to the url, like so:

```ruby
# My Step definition
@home_page = HomePage.new
@home_page.load # same as visit "/"
```

### Define Elements

A page is made up of elements, the links, inputs and buttons that we interact
with when testing. We can define elements in the page object to give them more useful
names. For instance, on the login page:

```ruby
class LoginPage < SitePrism::Page
  element :email, "#user_email"
  element :password, "#user_password"
end
```

### Define Methods

The real magic comes when you give the objects methods that represent the
concrete tasks you want to do on a given page.


```ruby
class LoginPage < SitePrism::Page
  element :email, "#user_email"
  element :password, "#user_password"
  element :login_button, "input[value='Sign in using our secure server']"

  def login_as(user)
    email.set user.email
    password.set user.password
    login_button.click
  end
end
```

Now in your test you can do

```
@user = FactoryBot.create(:user)
@login_page = LoginPage.new
@login_page.login_as(user)
```

Our test code is now completely unaware of the user interface, and all the UI
details are hidden away in the page object. If anything changes, we just have
to update them one place.

**Now Go Through and Update All Your Tests to Use The Page Object Pattern**
