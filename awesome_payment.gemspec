# -*- encoding: utf-8 -*-
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

$:.push File.expand_path("../lib", __FILE__)
require "awesome_payment/version"

Gem::Specification.new do |gem|
  gem.name          = "awesome_payment"
  gem.version       = AwesomePayment::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Hamed Ramezanian Nik"]
  gem.email         = ["hamed.r.nik@gmail.com"]
  gem.summary       = "A simple checkout library for a marketplace."
  gem.description   = "A simple checkout library for a marketplace."
  gem.homepage      = "https://github.com/iCEAGE/awesome_payment"
  gem.license       = "LGPL-3.0"

  gem.files         = `git ls-files | grep -Ev '^(myapp|examples)'`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]
  
  gem.add_development_dependency 'rake', '~> 12.0'
  gem.add_development_dependency 'minitest', '~> 5.10', '>= 5.10.1'
end
