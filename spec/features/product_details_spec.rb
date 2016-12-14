require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
              name:  Faker::Hipster.sentence(3),
              description: Faker::Hipster.paragraph(4),
              image: open_asset('apparel1.jpg'),
              quantity: 10,
              price: 64.99
      )
    end
  end

  scenario "They navigate from homepage to product detail page by clicking on a product" do
    # ACT
    visit '/'
    first('.product').click_link('Details')

    # DEBUG
    save_screenshot

    # # VERIFY
    expect(page).to have_content 'Quantity'
  end


end
