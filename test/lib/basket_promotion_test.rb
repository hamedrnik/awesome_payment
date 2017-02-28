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

class BasketPromotionTest < AwesomePaymentTest
  def test_creates_a_basket_promotion
    basket_promotion = BasketPromotion.new(60, 10)
    assert_kind_of BasketPromotion, basket_promotion
    assert_equal basket_promotion.percentage_off, Rational(10, 100)
    assert_equal basket_promotion.price_threshold, 60
  end
  
  def test_percentage_off_should_be_between_0_and_100
    assert_raises ArgumentError do 
      BasketPromotion.new(55, -2.5)
      BasketPromotion.new(34.5, 110)
    end
  end
end
