require 'rails_helper'

RSpec.feature "Visitor navigates to product detail", type: :feature, js: true do

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

  scenario "They can click on detail and see product detail" do
    # ACT
    visit root_path
    first(:link, 'Details »').click

    # DEBUG
    sleep(1)
    save_screenshot 'test_product.png'

    # VERIFY
    expect(page).to have_css '.product-detail'
  end
end
