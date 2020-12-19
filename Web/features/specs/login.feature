#ON this feature, differently from Sign Up, I've decided to use
#Only the test data on the data tables

Feature: Login
    As a registered customer from Ze Delivery
    In order to pruchase products
    I must be able to sign in

    Background: HomePage
        Given I have accessed the home HomePage

    Scenario: Successful Login
        Given I have valid credentials
            | name     | Saruman The White    |
            | email    | saruman@isengard.com |
            | password | Qwerty@12345678      |
        When I sign in
        Then I must be authenticated

    Scenario Outline: Login Attempt
        Given I have
            | email    | <email>    |
            | password | <password> |
        When I try to sign in
        Then I must see the message "<message>"

        Examples:
            | email                | password     | message                              |
            | xpto                 | Qw@123456789 | Eita, esse e-mail não parece correto |
            | xpto@.com            | Qw@123456789 | Eita, esse e-mail não parece correto |
            | @com.br              | Qw@123456789 | Eita, esse e-mail não parece correto |
            |                      | Qw@123456789 | O campo e-mail não pode ficar vazio  |
            | saruman@isengard.com | @12345678    | Senha inválida                       |
            | saruman@isengard.com | Qw@          | Sua senha está muito pequena         |
            | saruman@isengard.com | Qw@abcdefg   | Senha inválida                       |
            | saruman@isengard.com |              | O campo senha não pode ficar vazio   |


