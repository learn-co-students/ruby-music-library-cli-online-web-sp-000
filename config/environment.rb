require 'pry'
require 'bundler'
Bundler.require


module Concerns
end

require_all 'lib'
require_relative '../lib/concerns/findable'

class Artist
  extend Concerns::Findable::ClassMethods
end

class Genre
  extend Concerns::Findable::ClassMethods
end
