class CommentsController < ApplicationController
	before_action :find_owner, only: :create

	def create
		@owner.comments.create(comment_params)

		redirect_to post_path(@owner)
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy

		redirect_back(fallback_location: root_path)
	end

	private

	def comment_params
		params[:comment].permit(:name, :body, :owner_id, :owner_type)
	end

	def find_owner
		@owner = Post.find(comment_params[:owner_id]) if comment_params[:owner_type] == 'Post'
	end
end
