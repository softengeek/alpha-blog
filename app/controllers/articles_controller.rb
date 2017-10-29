class ArticlesController < ApplicationController
  
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
      flash[:notice] = "Article was successfully created"
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
    @article = Article.find(params[:id])
  end
  
  
  def edit 
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_parans)
      flash[:notice] = "Article updated successfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy 
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Article was deleted successfully"
      redirect_to articles_path
    else
      redirect_to articles_path
    end
  end
  
  private 
  def article_parans 
    params.require(:article).permit(:title, :description)
  end

end