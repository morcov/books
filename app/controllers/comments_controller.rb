class CommentsController < ApplicationController
  before_filter :find_book,             only: [:create, :destroy]
  before_filter :check_if_user_new,     only: [:create]
  before_filter :check_if_user_destroy, only: [:destoy]

  def create
    @comment = @book.comment.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id
     @comment.save
    redirect_to book_path(@book)
  end

  def edit
  end

  def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
 
    redirect_to book_path(@book)
  end

  private
   def find_book
    @book = Book.find(params[:book_id])
   end

   def check_if_user_destroy
    render text: "Fuck you user destroy comment", status: 403 unless current_user.id == @comment.user_id || current_user.rank_id == 2
   end

   def check_if_user_new
    render text: "Fuck you user new comment", status: 403 unless current_user
   end
end
