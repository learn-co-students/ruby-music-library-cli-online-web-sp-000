module Concerns::Findable

  def find_by_name(name)
    #finds a song instance in @@all by the name of the property of the song
    all.find{|instance| instance.name == name}
  end

  def find_or_create_by_name(name)
    #returns an existing song with the provided name if one exists in @@all
    #creates song if an existing match is not found
    find_by_name(name) || create(name)
    #binding.pry
  end

end
