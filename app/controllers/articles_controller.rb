class ArticlesController < ApplicationController
    def new
        
    end

    def create
        ##here is some warnings to shwo, changed from "plain" to "text".
        #render plain: params[:article].inspect
        #render text: params[:article].inspect
        #
        @article = Article.new(article_params)
 
        @article.save
        redirect_to @article
    end

    def show
        @article = Article.find(params[:id])
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
