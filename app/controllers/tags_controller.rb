class TagsController < ApplicationController
  before_action :set_post
  before_action :set_post_tag, only: [:show, :update, :destroy]

  # GET /posts/:post_id/tags
  def index
    json_response(@post.tags)
  end

  # GET /posts/:post_id/tags/:id
  def show
    json_response(@tag)
  end

  # POST /posts/:post_id/tags
  def create
    @post.tags.create!(tag_params)
    json_response(@post, :created)
  end

  # PUT /posts/:post_id/tags/:id
  def update
    @item.update(tag_params)
    head :no_content
  end

  # DELETE /posts/:post_id/tag/:id
  def destroy
    @tag.destroy
    head :no_content
  end

  private

  def tag_params
    params.require(:tag).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_tag
    @tag = @post.tags.find_by!(id: params[:id]) if @post
  end



end
