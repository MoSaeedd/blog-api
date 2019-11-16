class PostsController < ApplicationController

  before_action :set_post, only: [:show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = current_user.posts
    json_response(@posts)
  end

  # POST /posts
  def create
    @post = current_user.posts.create!(post_params)
    json_response(@post, :created)
   # PostDestroyer.perform_at(24.hours.from_now)
    PostDestroyerWorker.perform_at(24.hours.from_now, @post.id)
  end

  # GET /posts/:id
  def show
    json_response(@post)
  end

  # PUT /posts/:id
  def update
    @post.update(post_params)
    head :no_content
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    # whitelist params
    params.permit(:title, :body )
  end

  def set_post
    @post = Post.find(params[:id])
  end


  def correct_user
    @post = Post.find(params[:id])  
    unless current_user?(@post.user)
     render plain: 'User is not authorized to do this action'
    end
  end
  def current_user?(user)
    user == current_user
  end
end

