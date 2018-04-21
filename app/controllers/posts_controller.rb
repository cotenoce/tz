class PostsController < ApplicationController

	before_action :find_category

	def index
		@posts = @category.posts.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = @category.posts.new(post_params)
		if @post.save
			redirect_to  category_path @category
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to  category_path @category
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to category_path @category
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_category
		@category = Category.find(params[:category_id])
	end
end
