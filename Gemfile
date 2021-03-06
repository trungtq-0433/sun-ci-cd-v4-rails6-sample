# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "bootsnap", ">= 1.4.2", require: false
gem "capistrano", "~> 3.10", require: false
gem "capistrano3-puma"
gem "capistrano-bundler", "~> 2.0"
gem "capistrano-rails", "~> 1.6", require: false
gem "capistrano-rbenv", "~> 2.2"
gem "dotenv-rails"
gem "jbuilder", "~> 2.7"
gem "mysql2", ">= 0.4.4"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "sass-rails", ">= 6"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "webpacker", "~> 4.0"

# add gem for issue https://github.com/net-ssh/net-ssh/issues/565
gem "bcrypt_pbkdf", ">= 1.0", "< 2.0"
gem "ed25519", ">= 1.2", "< 2.0"

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "rubocop", "~> 1.0", require: false
  gem "rubocop-performance", "~> 1.8", ">= 1.8.1", require: false
  gem "rubocop-rails", "~> 2.8", ">= 2.8.1", require: false
  gem "rubocop-rspec", "~> 2.0.0.pre", require: false
end

group :development do
  gem "listen", "~> 3.2"
  gem "web-console", ">= 3.3.0"
end
