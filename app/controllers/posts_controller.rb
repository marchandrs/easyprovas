class PostsController < ApplicationController
  def index
  	@posts = Post.where(status: :active).paginate(:page => params[:page], :per_page => 10)
  end

  def show
  	@post = Post.find(params[:id])
    @attachments = @post.attachments.all
  end

	def new
		@post = Post.new
    @new_attachments = @post.attachments.build
    @attachments = @post.attachments.all
    @tags = ''
	end

	def create
	  @post = Post.new(post_params)
	  if @post.save
      params[:attachments]['data'].each do |d|
        #@attachment = @post.attachments.create!(:data => d)
        @post.attachments.create!(:data => d)
      end

      redirect_to @post, notice: 'Post criado com sucesso'
    else
	    render action: 'new'
    end
	end

  def edit
    @post = Post.find(params[:id])
    @new_attachments = @post.attachments.build
    @attachments = @post.attachments.all
    @tags = ''
    @post.tags.each do |tag|
      @tags << '#' << tag.name << ' '
    end
  end

	def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      if params[:attachments].present?
        params[:attachments]['data'].each do |d|
          @post.attachments.create!(:data => d)
        end
      end

      redirect_to @post, notice: 'Post editado com sucesso'
    else
      render 'edit'
    end
	end

	def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
	end

  private
    def post_params
      params.require(:post).permit(:text, :tag_list, attachments_attributes: [:id, :post_id, :data])
    end
end
