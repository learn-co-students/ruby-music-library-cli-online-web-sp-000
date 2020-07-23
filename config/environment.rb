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

class Music
  extend Concerns::Findable
  attr_accessor :name


  @@all = []

  def initialize(name)
    @name  = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end

end

require_all 'lib'
