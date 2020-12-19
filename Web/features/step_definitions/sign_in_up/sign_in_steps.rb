Given('I have') do |table|
    @invalid_credentials = table.rows_hash
end

When('I sign in') do
    @home.visit_sign_in_page
    @sign_in = SignInPage.new
    @sign_in.do_login(@valid_credentials)
end

When('I try to sign in') do
    @home.visit_sign_in_page
    @sign_in = SignInPage.new
    @sign_in.do_login(@invalid_credentials)
end

Then('I must be authenticated') do
    first_name = @valid_credentials['name'].split(' ')[0]
    expect(@home.text_user_name.text).to include first_name
end