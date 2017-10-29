class ArticlesController < ApplicationController
  
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
  
  private 
  def article_parans 
    params.require(:article).permit(:title, :description)
  end

end