
module Findable
  def find_by_name(name)
    @@all.detect { |a| a.name == name }

  end
  #
  def find_or_create_by_name(name)
    if find_by_name(name)
      all.find_by_name(name)
     else
       all.create(name)
    end
  end

end
