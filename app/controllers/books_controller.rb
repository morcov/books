class BooksController < ApplicationController
  def index
  	@books = Book.paginate :page => params[:page], :per_page => 10, :order => 'name'
  	#:per_page => 50
  end

  def new
  	@book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  def create
   if current_user
    @book = Book.new(params[:book].permit(:name, :description))
    @book.user_id = current_user.id 
    #@book.save
      if @book.save
       format.html { redirect_to redirect_to @book }
        format.js
      else
       format.html { render :action => "new" }
        format.js
      end
    
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
