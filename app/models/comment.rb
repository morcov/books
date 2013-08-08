class Comment < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  def author
   User.find(self.user_id).full_name
  end
end
