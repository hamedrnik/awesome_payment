=begin
Awesome Payment implements a simple checkout for a marketplace.
Copyright (C) 2017 Hamed Ramezanian Nik

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end

require File.expand_path('../../lib/awesome_payment', __FILE__)

require 'minitest/autorun'
require 'yaml'

class AwesomePaymentTest < MiniTest::Test
  include AwesomePayment
  
  attr_reader :products
  
  def load_all_fixtures
    load_products_fixtures
    load_product_promotions_fixtures
    load_basket_promotions_fixtures
  end
  
  def load_products_fixtures
    products_file_path = File.expand_path("../fixtures/products.yml", __FILE__)
    @products = YAML.load_file(products_file_path).map do |p|
      Product.new(p[1][:product_code], p[1][:name], p[1][:price])
    end
  end
  
  def load_product_promotions_fixtures
    product_promotions_file_path = File.expand_path("../fixtures/product_promotions.yml", __FILE__)
    @product_promotions = YAML.load_file(product_promotions_file_path).map do |p|
      ProductPromotion.new(p[1][:product_code], p[1][:price], p[1][:quantity])
    end
  end
  
  def load_basket_promotions_fixtures
    basket_promotions_file_path = File.expand_path("../fixtures/basket_promotions.yml", __FILE__)
    @basket_promotions = YAML.load_file(basket_promotions_file_path).map do |p|
      BasketPromotion.new(p[1][:price_threshold], p[1][:percentage_off])
    end
  end
end
