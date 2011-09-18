class Randomizer < ActiveRecord::Base
  belongs_to :user
  has_many :jumpers
  validates_presence_of :name
  validates :name, :length => {:minimum => 1}

  def randomize
    random = []
    if jumpers.present?
      jumpers.sort_by { |jumper| jumper.position || 0 }.each do |jumper|
        random << "#{jumper.randomize} "
      end
    end
    random
  end
end