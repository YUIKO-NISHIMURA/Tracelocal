class TopController < ApplicationController
    def index
        @pagy, @posts = pagy (Post.all)
    end 
    
    def about
    end 
    

end
