Given('I am at the product page') do
    @products_page = ProductsPage.new
    @products_page.has_div_when?
end
  
Then('I must see the beverage {string} and the price {string}') do |beverage, price|
    @product = @products_page.find_product(beverage, price)
    expect(@product).to have_text beverage
    expect(@product).to have_text price
end