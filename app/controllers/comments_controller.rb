class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to articles_path
    else
      render article_path(@article) 
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body) # require 这里为单数
    end
end
