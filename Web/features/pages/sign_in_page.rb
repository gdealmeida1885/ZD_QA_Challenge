class SignInPage < SitePrism::Page
    set_url '/conta/entrar'

    element :link_create_account, '#create-account-link'
    element :input_name, '#signup-form-input-name'
    element :input_mail, '#signup-form-input-email'
    element :input_password, '#signup-form-input-password'
    element :input_document, '#signup-form-input-document'
    element :input_phone, '#signup-form-input-phone'
    element :input_age, '#signup-form-input-age'
    element :checkbox_terms, '#sign-up-form-input-terms'
    element :checkbox_marketing, '#sign-up-form-input-marketing'
    element :button_continue, '#signup-form-button-signup'
    element :footer, 'footer[class$=footer]'
    element :link_validate_later, '#confirm-phone-link-validate-later'
    element :main_sign_up, 'main[class$=main]'
    element :input_sign_in_mail, '#login-mail-input-email'
    element :input_sign_in_password, '#login-mail-input-password'
    element :button_login, '#login-mail-button-sign-in'

    def change_sign_in_form 
        link_create_account.click
    end

    def do_login(credentials)
        input_sign_in_mail.set credentials['email']
        input_sign_in_password.set credentials['password']
        button_login.click
    end

    def submit_form(credentials)
        input_name.set credentials['name']
        input_mail.set credentials['email']
        input_password.set credentials['password']
        input_document.set credentials['document']
        input_phone.set credentials['phone']
        input_age.set  credentials['age']
        checkbox_terms.check
        checkbox_marketing.check
        button_continue.click if !button_continue.disabled?
    end

    def skip_phone_confirmation
        link_validate_later.click
    end

    def transform_data(credentials)
        credentials_type = credentials.gsub(' ', '_').downcase
        INVALID_CREDENTIALS_DATA[credentials_type]
    end
end