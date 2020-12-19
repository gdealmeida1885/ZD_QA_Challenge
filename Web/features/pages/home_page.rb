class HomePage < SitePrism::Page
    set_url '/'
    
    element :footer, 'footer[class$=footer]'
    element :button_sign_in, '#welcome-button-sign-in'
    element :button_age_gate, '#age-gate-button-yes'
    element :button_accept_cookies, '.accept-cookies-button'
    element :text_user_name, 'div[class$=UserProfileCard]'

    def accept_age_gate
        button_age_gate.click
    end

    #Sometimes if the test fails or if ends too quickly, Capybara "forgets" to clean up the browser cache
    #Therefore the cookies alert doesn't show up and I have to check if the banner have appeared
    def accept_cookies
        if has_button_accept_cookies?
            button_accept_cookies.click
        end
    end

    def visit_sign_in_page
        button_sign_in.click
    end
end