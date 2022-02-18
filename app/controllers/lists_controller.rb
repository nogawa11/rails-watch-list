class ListsController < ApplicationController
  def index
    if params[:search].present?
      @search_term = params[:search].downcase
      @lists = List.where("lower(name) LIKE ?", "%#{@search_term}%")
      @movies = Movie.where("lower(title) LIKE ?", "%#{@search_term}%")
    else
      @lists = List.all
      @movies = Movie.all.order(title: :asc)
    end
  end

  def show
    @list = List.find(params[:id])
    @reviews = @list.reviews
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
