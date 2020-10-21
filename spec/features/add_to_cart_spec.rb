require 'rails_helper'

RSpec.feature "Visitor can add item to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see cart go up by 1 after clicking add to cart" do
    # ACT
    visit root_path
    first(:button, 'Add').click
    # DEBUG
    save_screenshot 'test_cart.png'

    # VERIFY
    expect(page).to have_link 'My Cart (1)'
  end
end
