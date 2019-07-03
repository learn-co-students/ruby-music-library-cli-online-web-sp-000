#MusicLibraryController - CLI Commands
#  'list songs'
#    triggers #list_songs (FAILED - 1)
#  'list artists'
#    triggers #list_artists (FAILED - 2)
#  'list genres'
#    triggers #list_genres (FAILED - 3)
#  'list artist'
#    triggers #list_songs_by_artist (FAILED - 4)
#  'list genre'
#    triggers #list_songs_by_genre (FAILED - 5)
#  'play song'
#    triggers #play_song (FAILED - 6)
#Failures:
#  1) MusicLibraryController - CLI Commands 'list songs' triggers #list_songs
#     Failure/Error: expect(music_library_controller).to receive(:list_songs)
#       (#<MusicLibraryController:0x000000000175bc68>).list_songs(*(any args))
#           expected: 1 time with any arguments
#           received: 0 times with any arguments
#     # ./spec/012_music_library_cli_spec.rb:10:in `block (3 levels) in <top (required)>'
#  2) MusicLibraryController - CLI Commands 'list artists' triggers #list_artists
#     Failure/Error: expect(music_library_controller).to receive(:list_artists)
#       (#<MusicLibraryController:0x00000000011d3d90>).list_artists(*(any args))
#           expected: 1 time with any arguments
#           received: 0 times with any arguments
#     # ./spec/012_music_library_cli_spec.rb:20:in `block (3 levels) in <top (required)>'
