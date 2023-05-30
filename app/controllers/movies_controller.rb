class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  def index
    @movies = SearchMovieQuery.new
    
    page = params[:page]
    
    if params["search"]
      @search = params["search"]
      @movies = @movies.search(@search).page(page)
    elsif params["rating"]  
      @rating = params["rating"]
      @movies = @movies.search_by_rating(@rating).page(page)
    else 
      @movies = Movie.all.order(:title).page(page)
    end
  end

  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @movie = current_user.movies.build
  end

  def edit
  end

  def create
    @movie = current_user.movies.build(movie_params)
    puts @movie

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    can_delete = true unless current_user.email != @movie.user.email
    
    if can_delete 
      puts 'can delete'
      @movie.destroy
      respond_to do |format|
        format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
        format.json { head :no_content }
      end
    else 
     format.html { redirect_to movies_url, notice: "cannot delete this movie(((" }
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image)
    end
end
