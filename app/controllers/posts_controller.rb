class PostsController < ApplicationController

  before_action :require_sign_in, except: :show

  def show
#   @topic = Topic.find(params[:topic_id])
#   @post = @topic.posts.find(params[:id])  Zombies 2, Level 3
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Success"
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "Fail!"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    authorize @post

    if @post.save
      flash[:notice] = "Success"
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "Fail!"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post


    if @post.destroy
      flash[:notice] = "Success"
      redirect_to @post.topic
    else
      flash.now[:alert] = "Fail!"
      render :show
    end

  end


private
def post_params
  params.require(:post).permit(:body, :title)
end

end
