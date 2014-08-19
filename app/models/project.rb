class Project < ActiveRecord::Base
  belongs_to :team
  belongs_to :enquiry
  has_many :employees
  WillPaginate.per_page = 10

end
