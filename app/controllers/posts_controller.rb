class PostsController < ApplicationController
  def index
  	@posts = Post.where(:visible => true).paginate(:page => params[:page], :per_page => 10)
  end

  def show
  	@post = Post.find(params[:id])
    @attachments = @post.attachments.all
  end

	def new
		@post = Post.new
    @attachments = @post.attachments.build
	end

	def create
	  @post = Post.new(post_params)
	  if @post.save
      params[:attachments]['data'].each do |d|
        @attachment = @post.attachments.create!(:data => d)
      end
      redirect_to @post, notice: 'Post was sucessfully created'
    else
	    render action: 'new'
    end
	end

	def update
	end

	def destroy
	end

  private
    def post_params
      params.require(:post).permit(:text, attachments_attributes: [:id, :post_id, :data])
    end
end
