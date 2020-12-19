Before do |scenario|
    Capybara.reset_sessions!
end

Before('@login') do 

    c = {
        "email" => "saruman@isengard.com",
        "password" => "Qwerty@12345678"
    }

    @home = HomePage.new
    @home.load
    @sign_in = SignInPage.new
    
    @home.accept_age_gate
    @home.accept_cookies
    @home.visit_sign_in_page

    @sign_in.do_login(c)
end


After do |scenario|
  sufix = ('error' if scenario.failed?) || 'success'
  
  name = scenario.name.tr(' ','_').tr(',()#','').downcase
  
  page.save_screenshot("features/reports/screenshot/#{sufix}-#{name}.png")
  
  embed("features/reports/screenshot/#{sufix}-#{name}.png", 'image/png', 'Screenshot')
end