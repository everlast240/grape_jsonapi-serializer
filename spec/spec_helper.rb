# frozen_string_literal: true

require 'active_model'
require 'grape_jsonapi-serializer'
require 'pry'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
