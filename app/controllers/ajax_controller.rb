class AjaxController < ApplicationController
  include HTTParty
  base_uri 'http://api.thisismyjam.com'

  def search_by_artist
    @qry_parameter =   params[:search]  if   params[:search]
    @tracks_data  =   tracks(@qry_parameter)
    @results = @tracks_data.parsed_response
  end

  def tracks(query)
    options =  { query: {by: 'artist', q: query} }
    self.class.get("/1/search/jam.json", options)
  end

  def add_song
    client = Soundcloud.new(:client_id => '2e16946fdb254e50750412d3d7c34b57')

    track_url = params[:url]
    embed_info = client.get('/oembed', :url => track_url)

    @data = embed_info
    session[:html] = @data['html']
    render :json => {:data => @data}.to_json
  end

  def add_song_to_track

    @track = Track.create(
        :title => params[:title],
        :artist => params[:artist],
        :url => params[:author_url],
        :image => params[:image],
        :large_img => session[:html],
        :via => params[:provider_name],
        :via_url => params[:provider_url],
    )
    render :json => {:status => "ok"}.to_json
  end

  def recent
    @tracks = Track.all
    render :layout => false
  end
end


