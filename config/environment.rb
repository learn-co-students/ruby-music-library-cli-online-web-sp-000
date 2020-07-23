require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|element| element.name.downcase == name.downcase}
    end

    def find_or_create_by_name(name)
      match = find_by_name(name)
      match == nil ? self.create(name) : match
    end
  end
end

require_all 'lib'
