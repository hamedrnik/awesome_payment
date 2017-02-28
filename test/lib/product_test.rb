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

class ProductTest < AwesomePaymentTest
  def test_creates_a_product
    product = Product.new("010", "Notebook", 4.55)
    assert_kind_of Product, product
    assert_equal product.product_code, "010"
    assert_equal product.name, "Notebook"
    assert_equal product.price, 4.55
  end
  
  def test_price_should_be_greater_than_zero
    assert_raises ArgumentError do 
      Product.new("010", "Invalid Notebook", -4.50)
    end
  end
end
