class Chore < ActiveRecord::Base
#relationship
has_many :chores
has_many :children, through: :chores

#validation
validates_presence_of :name
validates_numericality_of :ponints

#scopes
scope :alphabetical, ->{order ()}
end
