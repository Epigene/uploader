if Gem::Version.new(Bundler::VERSION) < Gem::Version.new('1.13.1') ||
  Gem::Version.new(Bundler::VERSION) >= Gem::Version.new('1.16.0')
  abort "Bundler version '~> 1.15.1' is required, you are running #{Bundler::VERSION}"
end

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.1"

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.21.0'
gem 'puma', '~> 3.7.1'
gem 'slim', '~> 3.0.8'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 3.2.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.11', require: false

gem "paperclip", '~> 5.1.0' # https://goo.gl/pEJ05z
gem 'simple_form', '~> 3.5.0' # form builder
gem 'kaminari', '~> 1.0.1' # paginator
gem 'wicked_pdf', '~> 1.1.0', require: false # HTML -> PDF
gem 'wkhtmltopdf-binary', '~> 0.12.3.1', require: false # used by wicked_pdf
# gem 'rest-client', '~> 2.0.2', require: false # make HTTP requests

group :development, :test do
  gem 'pry-rails', '~> 0.3.6'
  gem 'awesome_print', '~> 1.7.0'
  gem "rspec-rails", '~> 3.6.0'
  gem "factory_girl_rails", '~> 4.8.0'
end

group :development do
  gem 'annotate', "~> 2.7.2"
  gem "binding_of_caller", "~> 0.7.2"
  gem "better_errors", "~> 2.1.1" # nodrošina detalizētākus error paziņojumus
  gem "bullet", "~> 5.5.1"
  gem 'spring', "~> 2.0.2"
  gem "spring-commands-rspec", '~> 1.0.4' # Spring for rspec ^
  gem "simplecov", '~> 0.14.1', require: false #ģenerē rspec testu coverage report
end

group :test do
  gem 'database_cleaner', '~> 1.6.1'
  gem "timecop", '~> 0.8.1' # Testiem ir iespeja mainit laikus
  gem "webmock", "~> 3.0.1" # Denies outside requests
end
