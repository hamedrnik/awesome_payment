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
  class ProductPromotion
    attr_reader :product_code, :price, :quantity
    
    def initialize(product_code, price, quantity)
      @product_code, @price, @quantity = product_code, price, quantity
      
      validate!
    end
    
    private

    def validate!
      if @price < 0
        raise ArgumentError.new("Price should be greater than 0")
      end
      
      if @quantity < 0
        raise ArgumentError.new("Quantity should be greater than 0")
      end
    end
  end
end
