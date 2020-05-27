genre = Genre.new("indie rock")
artist = Artist.new("The Magnetic Fields")
song = Song.new("The Luckiest Guy on the Lower East Side", artist, genre)

other_genre = Genre.create("electro pop")
other_artist = Artist.create("Neutral Milk Hotel") 
other_song = Song.create("Long-Forgotten Fairytale", artist, other_genre)

artist.genres

path = MusicImporter.new("../db/mp3s")