class PathsController < ApplicationController
  before_filter :find_path,          only: [:show, :edit, :update, :destroy]
  before_filter :book_new_path,      only: [:new] #:create don't security
 # before_filter :book_create_path,   only: [:create]
  before_filter :check_if_user_new,  only: [:new] #:create
  before_filter :check_if_user,      only: [:edit, :update, :destroy]

 def new
  @path = Path.new
 end

 def create
  @path = Path.new(params[:path].permit(:path, :text, :book_id))
  @path.user_id = current_user.id
  if @path.save
    #if @path.error.emply?
    redirect_to @path
  else
    render "new"
  end
 end

 def show
 end

 def edit
 end

 def update 
  if @path.update(params[:path].permit(:path, :text))
    redirect_to @path
  else
    render 'edit'
  end
 end

 def destroy
    @path.destroy
   redirect_to book_path(@path.book_id)
 end


 private
  def book_new_path
    @book = Book.find(params[:id])
  end

  #def book_create_path
  #  @book = Book.find(@path.book_id)
  #end

  def find_path
    @path = Path.find(params[:id])
  end

  def check_if_user
    render text: "Fuck you user", status: 403 unless current_user.id == @path.user_id || current_user.rank_id == 2
  end

  def check_if_user_new
    render text: "Fuck you user new path", status: 403 unless current_user.id == @book.user_id
  end
end