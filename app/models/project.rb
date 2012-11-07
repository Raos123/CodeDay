class Project < ActiveRecord::Base
  belongs_to :company
  attr_accessible :name, :company_id

  validates :company_id, presence: true
  validates :name, presence: true
  
  has_many :tasks, class_name: 'Timer'
end
