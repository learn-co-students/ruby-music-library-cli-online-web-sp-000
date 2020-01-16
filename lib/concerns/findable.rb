# module Concerns::Findable
#
#   def find_by_name(name)
#     all.find do |obj|
#       obj.songs.any? do |song|
#         song.name == name
#       end
#     end
#   end
#
#   def find_or_create_by_name(name)
#     found = self.find_by_name(name)
#     if found
#       found
#     else
#       Songs.create(name)
#     end
#   end
#
# end
