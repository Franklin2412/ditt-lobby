class SongsController < ApplicationController
  before_action :authenticate_fellow!
  before_action :can_make_song?, only: [:new, :create]

  def index
    #now we display all songs later display by region..
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new new_songs_params, song_writer: current_fellow.id, fellow: current_fellow
    if @song.save
      Comment.create(comment: params[:comment], fellow: current_fellow, song: @song) if params[:comment].present?
      redirect_to @song, notice: 'Lyrics Posted..'
    else

    end
  end

  def show
    @song = Song.find params[:id]
  end

  def edit

  end

  def update

  end

  private

  def new_songs_params
    params.require(:song).permit(:title, :lyrics, :reference, :language)
  end
end
