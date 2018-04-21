class CommentsController < ApplicationController
	before_action :find_owner, only: :create
	before_action :find_collection, only: :destroy

	def create
		@comment = @owner.comments.create(comment_params)
		respond_to do |format|
			format.js
			format.html
		end
	end

	def destroy
		@comment.destroy
		respond_to do |format|
			format.js
			format.html { redirect_back(fallback_location: root_path) }
		end
	end

	private

	def comment_params
		params[:comment].permit(:name, :body, :owner_id, :owner_type)
	end

	def find_owner
		@owner = Post.find(comment_params[:owner_id]) if comment_params[:owner_type] == 'Post'
		@owner = Category.find(comment_params[:owner_id]) if comment_params[:owner_type] == 'Category'
	end

	def find_collection
		@comment = Comment.find(params[:id])
		@comments = @comment.owner.comments
	end
end
