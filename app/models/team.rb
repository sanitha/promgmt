class Team < ActiveRecord::Base
  has_many :employees, :dependent => :destroy
  has_one :project
end
