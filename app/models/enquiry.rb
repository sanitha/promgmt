class Enquiry < ActiveRecord::Base
  
  belongs_to :user
  has_one :project

   
end
