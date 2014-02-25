class Task < ActiveRecord::Base
#relationship
has_many :chores
has_many :children, through: :chores

#validation
validates_presence_of :name, :points
validates_numericality_of :points, :greater_than_or_equal_to=> 0,:only_integer => true

#scopes
scope :alphabetical, ->{order('name')}
scope :active, ->{where(active: true)}

end
