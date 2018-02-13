class AlbumsController < ApplicationController

  # GET /album
  def index
    @album = Album.all
  end

  # GET /albums/1
  def show
  end

  # GET /album/new
  def new
    @album = Album.new
  end

  # GET /album/1/edit
  def edit
  end

  # POST /album
  def create
    album = Album.new(album_params)
    if album.save
      redirect_to __path, notice: 'Album was successfully created'
    else
      render :new
    end
  end

  def update
    album = Album.find(params[:id])
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to _____path, notice: 'Album was successfully destroyed.'
  end

  private

    def album_params
      params.require(:album).permint(:order_id, :photographs)
    end
end
