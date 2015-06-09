class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:body))
    
    if @summary.save
      @post.summary_id = @summary.id
      @post.save
      flash[:notice] = "summary was saved"
      redirect_to [@topic, @post, @summary]
    else
      flash[:error] = "THere was an error saving the post. Please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end
end
