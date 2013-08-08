class Book < ActiveRecord::Base
  belongs_to :user
  has_many :path, dependent: :destroy
  has_many :comment, dependent: :destroy

  def author
   User.find(self.user_id).full_name
  end
end
