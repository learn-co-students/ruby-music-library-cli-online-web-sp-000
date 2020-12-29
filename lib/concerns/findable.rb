require 'pry'

module Concerns::Findable

    def find_by_name(name)
      self.all.find {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
    end

    def parse(name)
      name = name.chomp!(".mp3")
      name = name.split(" - ")
      name
    end

end
