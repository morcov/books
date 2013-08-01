class BooksController < ApplicationController
  def index
  	@books = Book.paginate :page => params[:page], :per_page => 10, :order => 'updated_at DESC'
  	#:per_page => 50
  end

  def new
  	@book = Book.new
  end

  def create
   if current_user
    @book = Book.new(params[:book].permit(:name, :description))
    @book.user_id = current_user.id 
    @book.save
    redirect_to @book
   else
    redirect_to log_in_path
   end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	book = Book.find(params[:id])
  	if current_user.id == book.user_id || current_user.rank_id == 2
     @book = Book.find(params[:id])
    else
     redirect_to books_path
    end
  end

  def update
   @book = Book.find(params[:id])
 
  if @book.update(params[:book].permit(:name, :description))
    redirect_to @book
  else
    render 'edit'
  end
 end

 def destroy
  book = Book.find(params[:id])
  if current_user.id == book.user_id || current_user.rank_id == 2
  	@book = Book.find(params[:id])
    @book.destroy
  end
  redirect_to books_path
 end
end
