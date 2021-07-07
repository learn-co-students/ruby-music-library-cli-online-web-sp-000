require 'bundler'
require 'pry'

require_relative '../lib/concerns/concerns'
Bundler.require

module Concerns
end

require_all 'lib'
