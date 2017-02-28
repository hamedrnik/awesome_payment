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

class PromotionalRuleTest < AwesomePaymentTest
  def setup
    @promotional_rules = PromotionalRules.new
  end
  
  def test_creates_a_promotional_rules
    assert_kind_of PromotionalRules, @promotional_rules
    assert_nil @promotional_rules.basket_promotion
    assert_equal @promotional_rules.product_promotions, {}
  end
  
  def test_add_a_basket_promotion
    load_basket_promotions_fixtures
    
    @promotional_rules << @basket_promotions.first
    
    assert_equal @basket_promotions.first, @promotional_rules.basket_promotion
  end
  
  def test_add_a_product_promotion
    load_product_promotions_fixtures
    
    p_promotion = @product_promotions.first
    
    @promotional_rules << p_promotion

    assert_equal p_promotion,
      @promotional_rules.product_promotions[p_promotion.product_code]
    assert_equal 1, @promotional_rules.product_promotions.size
  end
  
  def test_rule_should_be_valid
    assert_raises ArgumentError do 
      @promotional_rules << Object.new
    end
  end
end
