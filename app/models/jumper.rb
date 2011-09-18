class Jumper < InheritedResources::Base
  belongs_to :randomizer
  acts_as_list
end