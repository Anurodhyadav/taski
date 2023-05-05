class Task < ApplicationRecord
  belongs_to :project

  after_save :update_percent_complete if :mark_completed?

  scope :completed, -> { where(completed: true)}
  # Ex:- scope :active, -> {where(:active => true)}

  def mark_completed
    self.completed == true
  end
  


  def update_percent_complete
    puts "*" * 100
    puts "Beginning of the callback"
    project = Project.find(self.project_id)
    completed_task = project.tasks.completed.count
    total_task = project.tasks.count
    percentage_completed = Counter.calculte_percentage_complete(completed_task, total_task)
    project.update!(percent_complete: percentage_completed)
    puts "#" * 100
    puts "End of the callback"

  end

  
end
