class BookmarksController < ApplicationController
  def new
    if params[:list_id].present?
      @list = List.find(params[:list_id])
      @movies = Movie.where.not(id: @list.movies).order(title: :asc)
      @bookmark = Bookmark.new
    elsif params[:movie_id].present?
      @movie = Movie.find(params[:movie_id])
      @lists = List.where.not(id: @movie.lists).order(name: :asc)
      @bookmark = Bookmark.new
    end
  end

  def create
    if params[:list_id].present?
      results = params[:bookmark]
      @list = List.find(params[:list_id])
      @movie = Movie.find(results['movie_id'].to_i)
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.list = @list
    elsif params[:movie_id].present?
      results = params[:bookmark]
      @list = List.find(results['list_id'].to_i)
      @movie = Movie.find(params[:movie_id])
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.movie = @movie
    end
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
