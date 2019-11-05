class SongsController < ApplicationController
  before_action :set_song, only:[:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new(song_params)
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
