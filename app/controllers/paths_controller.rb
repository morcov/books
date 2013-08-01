class PathsController < ApplicationController
 def new
  @path = Path.new
 end

 def create
   if current_user
   	@book = Book.params[:id]
    @path = Path.new(params[:path].permit(:path, :text))
    @path.user_id = current_user.id
    @path.book_id = @book.id
    @path.save
    redirect_to @path
   else
    redirect_to log_in_path
   end
  end

  def show
   @path = Path.find(params[:id])
 end
end
