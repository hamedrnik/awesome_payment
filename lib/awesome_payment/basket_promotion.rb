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
  class BasketPromotion
    attr_reader :percentage_off, :price_threshold
    
    def initialize(price_threshold, percentage_off)
      @price_threshold = price_threshold
      @percentage_off = Rational(percentage_off, 100)
      
      validate!
    end
    
    private

    def validate!
      if @percentage_off < 0 || @percentage_off > 100
        raise ArgumentError.new("Percentage off should be between 0 and 100.")
      end
      
      if @price_threshold < 0
        raise ArgumentError.new("Price threshold should be greater than 0")
      end
    end
  end
end
