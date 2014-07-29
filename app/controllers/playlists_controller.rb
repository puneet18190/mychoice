class PlaylistsController < ApplicationController

  def index
      @playlists = User.find(current_user.id).playlists
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.new(:name => params[:playlist][:name])

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to playlists_path, alert: 'Playlist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    Playlist.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to playlists_path, :alert => "Playlist Deleted Successfully." }
      format.json { head :no_content }
    end
  end
end