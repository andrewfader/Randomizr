class Randomizer < ActiveRecord::Base
  belongs_to :user
  has_many :jumpers
  validates_presence_of :name
  validates :name, :length => { :minimum => 1 }
end