source 'https://rubygems.org'
ruby '3.1.2'

# project code generation
# gem 'rephlex'

# routing
gem 'roda'
gem 'thor'
# web server
gem 'puma'
gem 'rack', '~> 3.0', '>= 3.0.4.1'
gem 'listen'

# A powerful logger for Roda with a few tricks up it's sleeve.
gem 'roda-enhanced_logger'

# application system setup
gem 'dry-system', '~> 1.0', '>= 1.0.1'
gem 'zeitwerk'
gem 'dotenv'
gem 'dry-inflector'

# database orm
gem 'sequel'
gem 'pg'

# frontend
gem 'vite_ruby'
gem 'phlex'
gem 'dry-validation'


gem "rake", "~> 13.0"

group :development, :test do
  gem 'pry'
  gem 'ruby-lsp', '~> 0.3.8', :group => :development
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'minitest'
  gem "phlex-testing-nokogiri"
  # This gem has to be here for running bundler in debug/vscode
  # https://marketplace.visualstudio.com/items?itemName=castwide.ruby-debug
  gem 'readapt'
end
