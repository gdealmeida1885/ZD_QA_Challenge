
#This test may pass or not, depending on the availabillity of the product selected
#For instance, for the product Smirnoff, when I started testing it was available for purchase
#But after a couple of hours, it became unavailable and the test started failling.
#The way to solve this is making sure to select products that are ALWAYS available to purchase.
#I've decided to let it be as it is to serve as example purposes.


Feature: Shelf
        As a customer that is already logged and already have choose his location
        In order to be able to choose wich product to buy
        I must be able to see the products on the Shelf
        And ther respective price

    Background: Product Page
        Given I am at the product page

    @login
    Scenario: Beer Shelf
        Then I must see the beverage "Budweiser 350ml" and the price "R$ 3,49"

    @login
    Scenario: Distilled Shelf
        Then I must see the beverage "Smirnoff Ice 275ml" and the price "R$ 8,50"
    @login
    Scenario: No Alcool
        Then I must see the beverage "Red Bull Energy Drink 250ml" and the price "R$ 7,49"