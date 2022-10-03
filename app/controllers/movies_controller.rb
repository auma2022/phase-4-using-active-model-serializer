class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  attributes :id, :title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie.to_json(only: [:id, :title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director])
  end
  private

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end
