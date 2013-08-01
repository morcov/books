class IndexController < ApplicationController
  def index
  	@books = Book.paginate :page => params[:page], :per_page => 5, :order => 'updated_at DESC'
  	#:per_page => 20
  end


end
