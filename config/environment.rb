require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_or_create_by_name(name)
      newitem = self.find_by_name(name)
      if newitem == nil
        newitem = self.create(name)
      end
      newitem
    end
  end
end

require_all 'lib'
