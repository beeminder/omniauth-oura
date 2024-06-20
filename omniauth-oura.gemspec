Gem::Specification.new do |gem|
  gem.name    = 'omniauth-oura'
  gem.version = 1.0
  gem.date    = "2024-06-20" 
  gem.license = 'MIT'
  gem.summary = "OmniAuth strategy for Oura"
  gem.description = "OmniAuth strategy for Oura Ring API"

  gem.authors  = ['Bethany Soule']
  gem.email    = 'support@beeminder.com'
  gem.homepage = 'https://github.com/beeminder/omniauth-oura'

  gem.add_dependency 'omniauth-oauth2', '>= 1.1.1'

  gem.files = ['lib/omniauth-oura.rb', 'lib/omniauth/strategies/oura.rb']
  gem.require_paths = ['lib']
end
