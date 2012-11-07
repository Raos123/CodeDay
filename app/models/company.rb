class Company < ActiveRecord::Base
  attr_protected
  
  validates :name, presence: true
  
  has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects
end
