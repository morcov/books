class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comment.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id
     @comment.save
    redirect_to book_path(@book)
  end

  def edit
  end

  def destroy
  	comment = Comment.find(params[:id])
    if current_user.id == comment.user_id || current_user.rank_id == 2
     @book = Book.find(params[:book_id])
     @comment = Comment.find(params[:id])
     @comment.destroy
    end
   redirect_to book_path(@book)
  end
end
