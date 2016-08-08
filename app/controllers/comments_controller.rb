class CommentsController < ApplicationController

  def post_comments
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def user_comments
    @user = User.find(params[:user_id])
    @comments = @user.comments
  end

  def show
    @comment = Comment.find(params[:id])
    @user = User.find(@comment.user_id)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render action: 'new'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    if @comment.update
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back, notice: 'Comentário removido!'
  end

  private
    def comment_params
      #params.require(:user_id)
      params.require(:post_id)
      params.require(:comment).permit(:text, :user_id, :post_id).merge(post_id: params[:post_id])
    end
end
