class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  # GET /album
  def index
    @albums = Album.all
  end

  # GET /albums/1
  def show
  end

  # GET /album/new
  def new
    @album = Album.new
    @order = params[:order]
  end

  # GET /album/1/edit
  def edit
    @order = @album.order_id
  end

  # POST /album
  def create
    @album = Album.new(album_params)
    @order = @album.order
    if @album.save
      AlbumMailer.create_album.deliver_later
      redirect_to album_path(@album), notice: 'Album was successfully created.'
    else
      render :new , order: @order, album: @album
    end
  end

  def update
    if @album.update(album_params)
      AlbumMailer.update_album.deliver_later
      redirect_to admin_orders_path, notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path, notice: 'Album was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:order_id, :photographs_cache,{photographs: []})
    end
end
