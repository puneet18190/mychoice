class TracksController < ApplicationController
  def index
    unless params[:playlist_id].nil?
      @playlist = Playlist.find_by_id(params[:playlist_id])
      @tracks = @playlist.tracks
      @genres = Genre.all
    else
      @tracks = Track.all
      @genres = Genre.all
    end
  end

  def new
    @track = Track.new
    @genres = Genre.all
  end

  def create
    unless params[:playlist_id].nil?
      @play_list = Playlist.find_by_id(params[:playlist_id])
      @track = Track.create(track_params)
      @track.playlist_tracks.create(playlist: @play_list, user_id: current_user.id)
    else
      @track = Track.create(track_params)
    end
    respond_to do |format|
      if @track
        format.html { redirect_to params[:playlist_id].nil? ? tracks_path : playlist_tracks_path(params[:playlist_id]), alert: 'Track was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    Track.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to params.has_key?(:playlist_id) ? playlist_tracks_url(params[:playlist_id]): tracks_url, :alert => "Track Deleted Successfully." }
      format.json { head :no_content }
    end
  end

    private

    def track_params
      params.require(:track).permit(:title, :artist, :url, :image, :large_img, :small_img, :via, :via_url, :background, :combined_truncated)
    end
end