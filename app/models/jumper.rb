class Jumper < ActiveRecord::Base
  belongs_to :randomizer
  acts_as_list :scope => :randomizer
  validates_presence_of :randomizer

  def randomize
    if text.present?
      textArr = text.split("\r\n")
      textArr[rand(textArr.size)]
    end
  end
end