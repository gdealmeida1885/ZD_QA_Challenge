Given('I have accessed the home HomePage') do                                
    @home = HomePage.new
    @home.load
    @home.has_footer?
    @home.accept_age_gate
    @home.accept_cookies
end

Given('I have valid credentials') do |table|                                 
    @valid_credentials = table.rows_hash
end

#Using expect(page) tp assert the error message is a bad practice
#because it makes Capybara read the whole tree node for every assertion
#But since this step is shared between the Sign Up and Login steps 
#And for a sngle scenario I have to read the top of the page
#This way this is better on the long term than having two assertions that will do basically he same

Then('I must see the message {string}') do |error_message|
    expect(page).to have_text error_message
end
    

