class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    #To show only the user posts
    #@topic.posts = policy_scope(Post)
  end

  def new
    @topic = Topic.new
    authorize @topic

  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      flash[:notice] = "Success"
      redirect_to topics_path
    else
      flash.now[:alert] = "Fail"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic

  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)
    authorize @topic

    if @topic.save
      flash[:notice] = "Success"
      redirect_to @topic
    else
      flash.now[:alert] = "Fail"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice] = "Success"
      redirect_to topics_path
    else
      flash.now[:alert] = "Fail!"
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end


end
