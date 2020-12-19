#For this scenario, I wanted to try two differentes approaches.
#The first one, is using data tables and having the test data inside the gherkin documentation.
#The second approach, is having the test data outside the documentation, in a yml file.


Feature: Sign Up
    As a new customer of Ze Delivery
    In order to start purchasing amazing drinks and beverages
    I must be able to sign up on the platform

    Background: HomePage
        Given I have accessed the home HomePage

    #This scenario is completly functional
    #But redowing it many times can pollte Zé's database
    #Therefore, I ran it twice to make sure that everthing is working properly and commented it. 
    #The data below is already configured to run, just uncomment it. :)
    
    # Scenario: Sign Up With Valid Credentials
    #     Given I have valid credentials
    #         | name     | Gandalf Gray               |
    #         | email    | gandalf@thegray.com        |
    #         | password | Qwerty@12345678            |
    #         | document | 706.392.110-03             |
    #         | phone    | 11954419893                |
    #         | age      | 99                         |
    #     When I sign up
    #     Then I must be sucessfully registered

    Scenario Outline: Sign Up Attempt With Invalid Credentials
        Given I have "<credential_type>"
        When I try to sign up
        Then I must see the message "<message>"

        Examples:
            | credential_type             | message                               |
            | No Lastname                 | Parece que você esqueceu do sobrenome |
            | Empty Name                  | Nome não pode ficar vazio             |
            | Invalid Mail                | Eita, esse e-mail não parece correto  |
            | Empty Mail                  | O campo e-mail não pode ficar vazio   |
            | Already Registered Mail     | E-mail já utilizado                   |
            | Invalid Document            | Seu CPF não parece correto            |
            | Already Registered Phone    | Telefone já utilizado                 |
            | No Number Password          | Sua senha parece estar fora do padrão |
            | Empty Password              | O campo senha não pode ficar vazio    |
            | No Letters Password         | Sua senha parece estar fora do padrão | 
            | Password Too Small          | Sua senha está muito pequena          |
            | Empty Phone Number          | O campo Telefone não pode ficar vazio |
            | Under Age                   | Sua idade deve ser maior que 18 anos  |
            | Empty Age                   | O campo idade não pode ficar vazio    |