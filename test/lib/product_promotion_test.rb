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

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require 'test_helper'

class ProductPromotionTest < AwesomePaymentTest
  def test_creates_a_product_promotion
    product_promotion = ProductPromotion.new("110", 8.50, 3)
    assert_kind_of ProductPromotion, product_promotion
    assert_equal product_promotion.product_code, "110"
    assert_equal product_promotion.price, 8.50
    assert_equal product_promotion.quantity, 3
  end
  
  def test_price_should_be_greater_than_zero
    assert_raises ArgumentError do 
      ProductPromotion.new("030", -3.50, 5)
    end
  end
  
  def test_quantity_should_be_greater_than_zero
    assert_raises ArgumentError do 
      ProductPromotion.new("030", 25.0, -1)
    end
  end
end
