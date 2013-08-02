class PathsController < ApplicationController

 def new
  @path = Path.new
  @book = Book.find(params[:id])
 end

 def create
   # render text: params[:path].inspect
   # book = Book.find(params[:book_id])
   if current_user#.id == book.user_id
    @path = Path.new(params[:path].permit(:path, :text, :book_id))
    @path.user_id = current_user.id
    @path.save
    redirect_to @path
   else
    if current_user
     redirect_to index_path
    else
     redirect_to log_in_path
    end
   end
 end

 def show
   @path = Path.find(params[:id])
 end

 def edit
    path = Path.find(params[:id])
    if current_user.id == path.user_id || current_user.rank_id == 2
     @path = Path.find(params[:id])
    else
     redirect_to paths_path
    end
 end

 def update
   @path = Path.find(params[:id])
 
  if @path.update(params[:path].permit(:path, :text))
    redirect_to @path
  else
    render 'edit'
  end
 end

 def destroy
  path = Path.find(params[:id])
  if current_user.id == path.user_id || current_user.rank_id == 2
    @path = Path.find(params[:id])
    @path.destroy
  end
   redirect_to book_path(path.book_id)
 end
end