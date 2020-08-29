class Host::GenresController < ApplicationController
  before_action :authenticate_host!

  def index
    @genre = Genre.new
    @genres = Genre.all.page(params[:page])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを追加しました"
      redirect_to host_items_path
    else
      @genres = Genre.all
      render(:index) && return
    end
  end

  def show
    @items = Item.all
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to host_genres_path
    if @genre.is_active == false
      @genre.items.each do |item|
        item.is_active = false
        item.save
      end
    else @genre.is_active == true
      @genre.items.each do |item|
        item.is_active = true
        item.save
      end
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end
