class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'].to_s, password: ENV['password'].to_s

  def show
    @stats = {product_count: Product.count(), category_count: Category.count()}
  end
end
