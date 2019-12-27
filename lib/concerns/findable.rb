module Concerns::Findable


  module ClassMethods

  # def self.extended(base) #Hook
     #puts "#{base} has been extended by #{self}"
      #SOng has been extended by Findable::ClassMethods
    # base.class_variable_set(:@@all, [])
  #  end

    def find_by_name(name)
      binding.pry
      self.all.detect {|o| o.name == name}

    end
  end
  #  Concerns::Findable    .find_by_name
  #  is added as a class method to classes that extend the module
  #  isn't hard-coded (FAILED - 1)
  #  Failures:  1) Concerns::Findable .find_by_name isn't hard-coded
  #   Failure/Error: self.all.detect {|song| song.name == name}
  #   NoMethodError:
  #     undefined method `name' for #<Array:0x00000000029f2070>
  #    self.new.tap do |o| o.song_name = name

  #  def find_or_create_by_name(song_name) #class method
  #   find_by_name(song_name) || create(song_name)
  #  end
#  end


end
