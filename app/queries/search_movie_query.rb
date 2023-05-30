class SearchMovieQuery 
    def initialize(movies = Movie.all)
        @movies = movies
    end
    
    def search(value="")
        @movies.where("LOWER(title) LIKE LOWER(?)", "%#{value}%")
    end
    
    def search_by_rating(value="")
        @movies.where("LOWER(rating) LIKE LOWER(?)", "%#{value}%")
    end
end