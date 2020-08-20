class Host::GenresController < ApplicationController


  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to host_items_path
    else
      @genres = Genre.all.page
      render :index
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
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end