class Jumper < ActiveRecord::Base
  belongs_to :randomizer
  acts_as_list :scope => :randomizer
  validates_presence_of :randomizer
  validates_presence_of :embedded_id, :if => :embedded?

  def randomize
    case jumper_type
      when "text"
        if text.present?
          textArr = text.split("\r\n")
          textArr[rand(textArr.size)]
        end
      when "embedded"
        embedded.randomize
    end
  end

  def embedded
    Randomizer.find(embedded_id)
  end

  def text?
    jumper_type == "text"
  end

  def embedded?
    jumper_type == "embedded"
  end
end