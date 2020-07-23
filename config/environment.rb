require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|object| object.name == name}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name).nil?
        self.create(name)
      else
        self.find_by_name(name)
      end
    end
  end
end

require_all 'lib'

#Instead of requiring individual files within one another, as you may have noticed we did in the previous two code along exercises,
#we created an environment file to handle those requirements for us
#Because the environment.rb file is read and loaded into memory in line order,
#if Artist requires Findable, then Artist must be required after requiring Findable

#Our spec_helper file, which is required by each individual spec file, required only this config/environment.rb file,
#instead of each and every file from the lib directory. As we start to build larger and more complex programs,
#it begins to make sense to handle all of our requirements in one place.
