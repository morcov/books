class Path < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  def book
  	Book.find(self.book_id).name
  end
end
