module Concerns::Findable
  
  # def find_by_name(name)
  #   all.detect{|a| a.name == name}
  # end
  
#   def find_by_name(song_name)
#     all.find do |song|
#       song.name == song_name
#     end
#   end
  
#   def find_or_create_by_name(song_name)
#     if find_by_name(song_name)
#       find_by_name(song_name)
#     else new_song = create(song_name)
#       # self.all << new_song
#       new_song
#     end
#   end
  
# end

def find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end