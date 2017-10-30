class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def new 
    @article = Article.new
  end
  
  def create
    #render plain: parmas[:article].inspect
    @article = Article.new(article_parans)
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else 
      # if @article.errors.any?
      #   errors = []
      #   @article.errors.full_messages.each do |msg|
      #     errors.push(msg);
      #   end
      #   flash[:notice] = errors 
      # end
      
      render 'new'
    end
  end
  
  def show
  end
  
  
  def edit 
  end
  
  def update
    if @article.update(article_parans)
      flash[:success] = "Article updated successfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy 
    if @article.destroy
      flash[:danger] = "Article was deleted successfully"
      redirect_to articles_path
    else
      redirect_to articles_path
    end
  end
  
  private 
  def article_parans 
    params.require(:article).permit(:title, :description)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
  

end