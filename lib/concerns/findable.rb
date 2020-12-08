module Concerns::Findable
   extend self

    def find_by_name(title)
      self.all.detect {|o| o.name == title}
    end

    def find_or_create_by_name(title)
      existing_title = self.find_by_name(title)
      if existing_title
        existing_title
      else
        new_title = self.create(title)
        new_title
      end
    end

end

#   how do i extend that class
# open what you were just on before i quit it this? no before the console isnt it called pry?
# i cant type there same why idk i'm gonna restart
