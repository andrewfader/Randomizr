class Jumper < ActiveRecord::Base
  belongs_to :randomizer
  acts_as_list :scope => :randomizer
  validates_presence_of :randomizer

end