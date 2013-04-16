class CommentsController < ApplicationController
	before_filter :get_dwelling_item_and_comment

	def show
	end

	def create
		@comment = @dwelling_item.comments.create(params[:comment])
		@comment.dwelling = @dwelling_item.dwelling
		@comment.owner = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@dwelling_item], notice: 'Comment was successfully created.' }
      else
        format.html { render action: "new" }
      end
		end
	end

	private

	def get_dwelling_item_and_comment
		@dwelling = current_dwelling
		if params[:post_id]
			@dwelling_item = @dwelling.posts.find(params[:post_id])
		elsif params[:comment_id]
			@dwelling_item = @dwelling.comments.find(params[:comment_id])
		# elsif params[`other id`]
			# get other
		end

		if params[:id]
			if @dwelling_item
				@comment = @dwelling_item.comments.find(params[:id])
			else
				@comment = @dwelling.comments.find(params[:id])
			end
		end
	end
end
