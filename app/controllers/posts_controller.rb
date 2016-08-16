class PostsController < ApplicationController

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
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

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
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

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

    if @post.destroy
      flash[:notice] = "Success"
      redirect_to @post.topic
    else
      flash.now[:alert] = "Fail!"
      render :show
    end

  end








end
