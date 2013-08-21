class BooksController < ApplicationController
  before_filter :find_book,          only: [:show, :edit, :update, :destroy]
  before_filter :check_if_user_new,  only: [:new, :create]
  before_filter :check_if_user,      only: [:edit, :update, :destroy]
 # before_filter :check_if_admin, only: [:edit, :update, :destroy]

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
    @book = Book.new(params[:book].permit(:name, :description))
    @book.user_id = current_user.id 
    #@book.save
      if @book.save
        redirect_to @book
      else
      # format.html { render :action => "new" }
        #format.js
        render "new"
      end
  end

  def show
  #	@book = Book.find(params[:id])
  end

  def edit
  end

  def update
  # @book = Book.find(params[:id])
 
  if @book.update(params[:book].permit(:name, :description))
    redirect_to @book
  else
    render 'edit'
  end
 end

 def destroy
    @book.destroy
    redirect_to index_path
 end

 private
  def find_book
    @book = Book.find(params[:id])
  end

 # def check_if_admin
 #   render text: "Fuck you admin", status: 403 unless current_user.rank_id == 2
 # end

  def check_if_user
    render text: "Fuck you user", status: 403 unless current_user.id == @book.user_id || current_user.rank_id == 2
  end

  def check_if_user_new
    render text: "Fuck you user new post", status: 403 unless current_user
  end
end
