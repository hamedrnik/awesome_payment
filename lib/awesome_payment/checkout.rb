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

module AwesomePayment
  class Checkout
    def initialize(promotional_rules = PromotionalRules.new)
      @promotional_rules = promotional_rules
      @basket = Basket.new
      @total_price = 0.0
      
      validate!
    end
    
    # Scans a product and adds it to the basket.
    #
    # @param [Product] a product item
    # @raise [ArgumentError] if the product is invalid
    def scan(product_item)
      unless product_item.is_a?(Product)
        raise ArgumentError.new("Product item is not valid.")
      end
      
      @basket << product_item
    end
    
    # Applies promotional rules and then return total price of the current basket.
    #
    # @param [Product] a product item
    # @return [Float] total price
    def total
      @total_price = apply_product_promotions
      @total_price = apply_basket_promotion
      
      @total_price
    end
    
    private
    
    # Applies product promotional rules.
    #
    # @return [Float] price after product promotional rules applied
    def apply_product_promotions
      @basket.products.group_by{ |p| p.product_code }.map do |product_group|
        code = product_group[0]
        product = product_group[1]
        promotion = @promotional_rules.product_promotions[code]
        
        if promotion && promotion.quantity >= product.size
          promotion.price * product.size
        else
          product.first.price * product.size
        end
      end.inject(0){|sum, i| sum + i}
    end
    
    # Applies basket promotional rules.
    #
    # @return [Float] price after basket promotional rules applied
    def apply_basket_promotion
      if @promotional_rules.basket_promotion &&
         @total_price >= @promotional_rules.basket_promotion.price_threshold
        off = @promotional_rules.basket_promotion.percentage_off * @total_price
        (@total_price - off).round(2)
      else
        @total_price
      end
    end
    
    def validate!
      unless @promotional_rules.is_a?(PromotionalRules)
        raise ArgumentError.new("Promotional rules is invalid.")
      end 
    end
  end
end
