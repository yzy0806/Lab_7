class Chore < ActiveRecord::Base
#relationship
belongs_to :child
belongs_to :task

#validation
validates_date :due_on

#scopes
# what you had was:
# scope :by_task, joins(:task).order('tasks.name')
# all scopes should be put in a lambda (->), so better is:
  scope :by_task, -> { joins(:task).order('tasks.name') }
# scope :chronological, -> { order('due_on') }
  scope :chronological, -> { order('due_on') }
# scope :pending, where(completed:false)
  scope :pending, -> { where(completed: false) }
# scope :done, where(completed:true)
  scope :done, -> { where(completed: true) }
# scope :upcoming, where('due_on>=?', Date.today)
  scope :upcoming, -> { where('due_on >= ?', Date.today) }
# scope :past, where('due_on<?', Date.today)
  scope :past, -> { where('due_on < ?', Date.today) }
# BTW, need better indenting...



#methods
def status
  if(completed==true)
    return "Completed"
  else
    return "Pending"
  end
end

end
