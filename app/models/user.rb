class User < ActiveRecord::Base
   belongs_to :rank
   has_many :book
   has_many :path

   #attr_accessible :name, :surname, :email, :password, :password_confirmation
  
  #attr_accessor :password
  
  has_secure_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def full_name
    "#{name} #{surname}"
  end

end
