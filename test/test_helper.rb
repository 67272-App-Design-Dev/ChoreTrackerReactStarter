require 'simplecov'
SimpleCov.start 'rails' 

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest"
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest_extensions'
require 'contexts'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # Commented out b/c screwing with reporter
  # parallelize(workers: :number_of_processors)

  # Configure shoulda matchers
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :minitest
      with.library :rails
    end
  end

  # Add more helper methods to be used by all tests here...
  include Contexts

  # Add Prof. H's infamous deny method...
  def deny(condition, msg="")
    # a simple transformation to increase readability IMO
    assert !condition, msg
  end

  # Spruce up minitest results...
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

end


