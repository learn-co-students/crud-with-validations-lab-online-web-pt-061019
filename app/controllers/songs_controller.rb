class SongsController < ApplicationController
    # before_action :song_params, only: :show

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
    redirect_to song_path(@song)
    else
        render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    if @song.valid?
    redirect_to song_path(@song)
    else
        render :edit
  end
end

  def edit
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
    @song.delete
    redirect_to songs_path
  end
  
  private

  def song_params(*args)
    params.require(:song).permit(:title, :genre, :artist_name, :released, :release_year)
  end
end

# (:title, :genre, :artist_name, :released, :release_year)