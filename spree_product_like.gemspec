# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_like'
  s.version     = '2.1.5'
  s.summary     = 'Add a like/fav button to your site'
  s.description = "
                  As a logged in user: 
                    - i can go to product page and like the product 
                    - see if I liked the product already
                    - go to my 'favourites' products tab 

                  As a logged in admin i can: 
                    - see list of products ordered by likes count"

  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Netguru'
  s.email     = 'team@netguru.co'
  s.homepage  = 'http://netguru.co'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '2.2.12.beta'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'poltergeist', '1.5.0'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'pry'
end
