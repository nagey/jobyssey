class ArticlesController < ApplicationController
    before_filter :authorize_admin
    
    
    def write
      @article = Article.new
    end
    
    def save
      @article = Article.new params[:article]
      @article.save
      redirect_to :action => :view_all_articles
      flash[:notice] = "Article successfully saved"
    end
  
    def view_all_articles
      @articles = Article.find :all
    end
  
  
end
