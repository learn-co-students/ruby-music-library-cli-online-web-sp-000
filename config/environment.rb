require 'bundler'
Bundler.require

module Concerns
end

require './lib/concerns/findable.rb'
require_all 'lib'
