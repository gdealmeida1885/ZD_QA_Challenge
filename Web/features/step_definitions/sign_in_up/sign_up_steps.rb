

Given('I have {string}') do |credential_type|
    @sign_in = SignInPage.new
    @invalid_credential = @sign_in.transform_data(credential_type)
end
                                                                   
When('I sign up') do      
    @home.visit_sign_in_page
    @sign_in = SignInPage.new
    @sign_in.change_sign_in_form
    @sign_in.submit_form(@valid_credentials)
    @sign_in.skip_phone_confirmation
end 

When('I try to sign up') do
    @home.visit_sign_in_page
    @sign_in = SignInPage.new
    @sign_in.change_sign_in_form
    @sign_in.submit_form(@invalid_credential)
end
                                                                               
Then('I must be sucessfully registered') do
    first_name = @valid_credentials['name'].split(' ')[0]
    expect(@home.text_user_name.text).to include first_name
end   


                                                                               
                                                                      