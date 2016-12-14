require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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

  scenario "They navigate from homepage to product. Add product to cart. See Cart has an item." do
    # ACT
    visit root_path
    first('article.product').click_on 'Add'

    save_screenshot

    within "#navbar" do
      expect(page).to have_link('My Cart (1)')
    end
    expect(page.current_path).to eq('/')
  end
end

