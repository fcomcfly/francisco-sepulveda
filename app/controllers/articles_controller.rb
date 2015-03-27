class ArticlesController < ApplicationController
 def index
 	#select *
 	@articles = Article.all
 end

 def show
 	#select where
 	@article = Article.find(params[:id])
 end

 def new
 	@article = Article.new
 end

 def edit
 	@article = Article.find(params[:id])
 end

 def create
 	#insert into
 	@article = Article.new(article_params)
 	if @article.save
 		redirect_to @article
 	else
 		render :new
 	end
 end

 def destroy
 	#delete
 	@article = Article.find(params[:id])
 	@article.destroy #Elimina objeto de BD
 	redirect_to articles_path
 end

 def update
 	#modificar
 	#@article.update_attributes ({title:'Nuevo Título'})
 	@article = Article.find(params[:id])
 	if @article.update(article_params)
 		redirect_to @article
 	else
 		render :edit
 	end
 end

 private
  def article_params
 	params.require(:article).permit(:title, :description, :categories)
  end
end