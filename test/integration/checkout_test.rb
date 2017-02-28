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

class CheckoutIntegrationTest < AwesomePaymentTest
  def setup
    load_all_fixtures
  end
  
  def test_basket_promotion_when_spend_60
    promotional_rules = PromotionalRules.new
    promotional_rules << @basket_promotions.first
    
    co = Checkout.new(promotional_rules)
    co.scan(@products[0])
    co.scan(@products[1])
    co.scan(@products[2])
    
    assert_equal co.total, 66.78
  end
  
  def test_product_promotion_when_buy_two_of_first_product
    promotional_rules = PromotionalRules.new
    promotional_rules << @product_promotions.first
    
    co = Checkout.new(promotional_rules)
    co.scan(@products[0])
    co.scan(@products[2])
    co.scan(@products[0])
    
    assert_equal co.total, 36.95
  end
  
  def test_product_and_basket_promotions_together
    promotional_rules = PromotionalRules.new
    promotional_rules << @product_promotions.first
    promotional_rules << @basket_promotions.first
    
    co = Checkout.new(promotional_rules)
    co.scan(@products[0])
    co.scan(@products[1])
    co.scan(@products[0])
    co.scan(@products[2])
    
    assert_equal co.total, 73.76
  end
  
  def test_two_product_promotions_and_a_basket_promotion
    promotional_rules = PromotionalRules.new
    promotional_rules << @product_promotions[0]
    promotional_rules << @product_promotions[1]
    promotional_rules << @basket_promotions.first
    
    co = Checkout.new(promotional_rules)
    co.scan(@products[0])
    co.scan(@products[1])
    co.scan(@products[1])
    co.scan(@products[0])
    co.scan(@products[2])
    
    assert_equal co.total, 47.95
  end
end
