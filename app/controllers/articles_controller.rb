class ArticlesController < ApplicationController
    http_basic_authenticate_with(name: "rcai", password: "120", except: [:index, :show])

    def new
        @article = Article.new
    end

    def create
        ##here is some warnings to shwo, changed from "plain" to "text".
        #render plain: params[:article].inspect
        #render text: params[:article].inspect
        #
        @article = Article.new(article_params)
 
        if @article.save
            redirect_to @article
        else
            render "new"
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render "edit"
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
