class Track < ActiveRecord::Base

  has_many :playlist_tracks
  has_many :playlists,:through => :playlist_tracks
  has_many :likes

end