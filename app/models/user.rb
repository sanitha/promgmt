class User < ActiveRecord::Base

    has_many :enquiries, :dependent => :destroy

  validates_presence_of :name, :message => " is mandatory"
  validates :email, :format => {:with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,:message => " is not valid"}
  validates :phone, :format => {:with => /^\d{10}$/,:message => " number is not valid"}  
  validates :password, :length => { :minimum => 4, :maximum => 40 }, :confirmation => true
  validates :email, :uniqueness => true
  validates :username, :uniqueness => true
  validates :phone, :uniqueness => true
end
