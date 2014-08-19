class Employee < ActiveRecord::Base
  has_one :project
  belongs_to :team
  belongs_to :user

  validates_presence_of :lastname,:firstname,:designation,:qualification, :message => " is mandatory"
  validates :phone, :format => {:with => /^\d{10}$/,:message => " number is not valid"}
  validates :emp_ID, :uniqueness => true
  validates :email, :uniqueness => true
  validates :salary, :format => {:with => /^\d{3,}$/,:message => " not valid"}
end
