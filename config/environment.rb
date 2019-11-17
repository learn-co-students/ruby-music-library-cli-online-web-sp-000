require 'pry'
require 'bundler'
Bundler.require

require_relative '../lib/concerns/findable'

module Concerns

end

require_all 'lib'


class Artist
  extend Concerns::Findable::ClassMethods
end

class Genre
  extend Concerns::Findable::ClassMethods
end
