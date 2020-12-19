![Ze Delivery Logo](./assets/logo.png)
# Zé Delivery QA Challenge

### Challenge 1 :dart:
---

To do the first challenge, I tried to find critical flows for both mobile and web versions of Zé's platform. Even though they are a bit different, they have commom features which without it, the platform would not work properly and could possibly lose customers. 

### Critical Flows:

* Sign Up
    * Sign Up is a critical feature because through it the user is able to start purchasing on Zé's platform. Also, the user must have a registration on the plataform in order to be able to track his orders history, have his address always saved The sign up feature can also help Zé's platform to map its public, understand it better and target which public needs more engagement
	E.g:. Zé could use his user's database to know which users of a particular age orders less and do an advertising campaign targeting this kind of user.

* Product Shelf
    * Shelf is a critical feature because through it the user can check which products he can order on the platform. The shelf is literally where the user will choose what he will buy and it can affect wheter he keeps using Zé's platform or not. For instance, if the user sign in on the app and he isn't able to find the product he wants or maybe he have found the product but the price is too high, he can decide to not finish his purchase on the app or even move to one of Zé's competitors.

* Shopping Cart
    * The shopping cart (or as it is called on the app, "bag") is the last step before the user can finish his purchase. Through it, the user can check if the sum of his purchases is correct, if he select the correct amount of itens, the price of delivery fee and do a double check if he hasn't forgot to buy anything.
	This is a critical feature because if he have any issues on it, he can decide to not finish his shopping.
	e.g: If the user have selected for instance 6 unity of beer and expected to have a total of R$40.00, but the shopping cart is calculating a total of R$50, the user can feel cheated and decide to not finish the purchase or even worse, stop using the app at all.

The three features I've selected above, are features shared both by the Mobile and Web version of Zé Delivery. I consider them to be key features to ensure that 1) the user will have a nice experience on the service and 2) the user will finish purchasing and will purchase again.
If any of these three features stop working, the user experience will be highly impacted and Zé's can lose users engagment. 
    Others examples of how this can happen:

    1) If the Sign Up feature fails to finish registering the user, he won't be able to finish his purchase, since it is mandatory to use the platform.
    2) If the Shelf fails to work properly and doesn't show all available products, the user will be less likely to spend more and will be led to believe that Zé Delivery doens't have a huge variety of products to buy. The user won't likely return to buy, will feel deceived and decide to buy in a Supermarket, since this way he won't have to pay for it.

### Challenge 2: :dart:
---

### UI Automation

For the second challenge, I could choose between Web and App automation. My initial idea was to automate the same scenarios for both Web and Mobile versions of Zé Delivery. Unfortunately, I'm currently working with a Windows machine that has only 4gb of RAM. Due to this, is almost impossible to run Android Studio Emulators neither Appium without having my machine freezing and lagging, therefore I was forced to automate only the Web version of Zé's app.

Also, instead of choosing one critical flow, I've decided to automate 3: Shelf (where we access the platform and check if there is a determined product is available.), Sign Up (where we test many different sign ups attempts with invalid data and valid data) and Login, that has been mentioned on the challenge description, which is a complement of sign up feature.


### Tecnologies

#### The Language
---
To automate this challenge, I've choose to use Ruby because as "the programmers best friend", stays out of the way while we automate, this way, is faster to automate. Ruby is also easy to read, since its code is almost written in human language, it is dynamically typed then I don't have to worry about variables typying, since the language does this itself.

Ruby also has a huge testing community and have many stable testing frameowrks.

Last but not least, programming with Ruby is very fun.

#### The Frameworks
---
To write the tests cases, I choose to use Cucumber, which uses Gherking syntax and alows me use BDD techniques to test the platform. Cucumber helps us to implement amazings features like Data Tables and Scenarios Outline, which allows us to test many different behaviours of the application and differently inputs and test datas for a single scenario and with this, we can write more code that will test the application with less tests. 

To do the web automation I have choosen Capybara. Capybara is a web automation framework that abstracts all the Selenium actions and gives us a powerful DSL (Domain Specific Language) to perform our actions on the browser. 

Capybara also helps us automating without having to worry to perform certains actions that a user would normaly do. 

For instance, if we are trying to check a checkbox that is out of view and would normally forces us to manually scroll the page to click on it, Capybara automatically does this and checks the checkbox. 

### Installation Guide: :gear:
---
To run theses tests, you must have Ruby installed on your machine. You can follow the tutorial at [Ruby official download page](https://www.ruby-lang.org/en/downloads/). 

After having it installed, download bundler, running on your terminal:

```ruby
gem install budler
```

After installing bundler, choose the folder where you want to download the project and run:

```git
git clone https://github.com/gdealmeida1885/ZD_QA_Challenge
```

Navigate to the folder that you downloaded and install the dependencies:

```ruby
cd /ZD_QA_Challenge/Web/

bundle install
```
Once the dependecies are installed sucessfully, run the command below to start the testing:

 ```ruby
  cucumber --format html -o features\reports\report.html
```

When the test have finished, you wil find the execution report on the Reports folder.

#### Challenge 3: API Automation :dart: 
---
To complete this challenge, I've choose to use the HTTParty framework, which includes powerful methods to do HTTP requests

To run it:

```ruby

cd /ZD_QA_Challenge/API/

bundle install

cucumber --format html -o features\reports\report.html
```

### Bugs and Improvements :spider:
---
While manual testing the app, I've came across a few possibly bugs or at least, some odd behaviour of the application.

* The Sign Up form doesn't allow me to create a user name that has numbers, but it allows me to create a user that has special caracters on the name. I believe that since it's a field for a name, it should only allows the usr to use the space as special character to separate name from last name. [Evidence](./assets/SpecialCharacters.png)

* When the user is trying to select his address, he can choose between inputing an address or using his GPS location. If the user chooses the second option, he can afterwards change his address to whichever he wants, even a fake address that doesn't exist. This fake address is not checked if exists or have products available and even goes to the checkout session.
When the user is manually editing his address after providing GPS location, is ensure the user provides its ZIP Code, since even if he inputs the wrong address, the zip code will probably have the correct address name (or at least, the one used by Correios which can be very reliable).[Evidence 1](./assets/FakeAddress1.png) and [Evidence 2](./assets/FakeAddress2.png).

* When the user is adding products to his shopping bag, he must inform the amount of units he wants to add. He have shortcuts to add but he have to manually remove the itens. I suggest that the user could have a "shortcut" to remove units from his shopping cart as well, by pressing and holding the minus sign, the amount could slowly decrease. 
If the user have, for instance, added 80 cans of beer, but wanted 40, he would be forced to press the minus sign 40 times to correct his order. Having this shortcut would help him do this task.

