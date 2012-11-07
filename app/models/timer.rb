class Timer < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :description, :duration, :project_id
  
  validates :project, presence: true

  def start
    self.last_activated_at = Time.now
    self.save
  end
  
  def stop
    self.duration += (Time.now - self.last_activated_at)/3600
    self.last_activated_at = nil
    self.save
  end
end
