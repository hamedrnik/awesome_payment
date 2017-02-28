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

class BasketTest < AwesomePaymentTest
  def setup
    @basket = Basket.new
  end
  
  def test_creates_a_basket
    assert_kind_of Basket, @basket
    assert_equal @basket.products, []
  end
  
  def test_adds_an_invalid_product
    assert_raises ArgumentError do 
      @basket << (Object.new)
    end
  end
end
