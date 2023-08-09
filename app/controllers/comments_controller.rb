class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        flash.now[:notice] = "Comment was successfully created."
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "new_comment", partial: 'comments/form', locals: { comment: @comment })
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'Comment was successfully updated.'
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.destroy
        flash.now[:notice] = 'Comment was successfully destroyed.'
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      else
        format.html { redirect_to @post, notice: 'Comment was not destroyed.' }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:id, :content)
  end
end
