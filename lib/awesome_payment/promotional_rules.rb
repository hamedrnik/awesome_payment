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
  class PromotionalRules
    attr_reader :product_promotions, :basket_promotion

    def initialize
      @product_promotions = {}
      @basket_promotion = nil
    end
    
    # Adds a promotion rule.
    #
    # @param [ProductPromotion, BasketPromotion] a promotion rule
    # @raise [ArgumentError] if the promotion rule is invalid
    def <<(promotion)
      case promotion
      when ProductPromotion
        @product_promotions[promotion.product_code] = promotion
      when BasketPromotion
        @basket_promotion = promotion
      else
        raise ArgumentError.new("Promotional rule is not valid.")
      end
    end
  end
end
