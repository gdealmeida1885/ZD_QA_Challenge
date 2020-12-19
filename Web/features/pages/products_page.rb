class ProductsPage < SitePrism::Page
    include Capybara::DSL

    element :div_when, 'div[class$=when]'

    def find_product(beverage, price)
        return find_link(beverage)
    end
end