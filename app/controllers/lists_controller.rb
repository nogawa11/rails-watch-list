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
    @ratings = []
    @list.reviews.each { |review| @ratings << review.rating }
    if @list.reviews.present?
      @average_ratings = "#{(@ratings.sum.to_f / @ratings.count).round(1)} / 5 stars"
    else
      @average_ratings = "No reviews at this time"
    end
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
