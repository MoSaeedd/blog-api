class CommentsController < ApplicationController

  before_action :set_post
  before_action :set_post_comment, only: [:show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /posts/:post_id/comments
  def index
    json_response(@post.comments)
  end

  # GET /posts/:post_id/comments/:id
  def show
    json_response(@comment)
  end

  # POST /posts/:post_id/comments
  def create
    @comment =current_user.comments.create!(params.permit(:content, :post_id))
    json_response(@comment, :created)
  end

  # PUT /posts/:post_id/comments/:id
  def update
    @comment.update(comment_params)
    head :no_content
  end

  # DELETE /posts/:post_id/comment/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_comment
    @comment = @post.comments.find_by!(id: params[:id]) if @post
  end

  def correct_user
   # @comment = Comment.find(params[:id])  
    unless current_user?(@comment.user)
     render plain: 'User is not authorized to do this action'
    end
  end
  def current_user?(user)
    user == current_user
  end
end
