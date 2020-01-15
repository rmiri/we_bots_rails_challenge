class Robot < ApplicationRecord
  belongs_to :ability

  validates :name, presence: true, uniqueness: true

  def self.robot_image_generator
    images = []
    Robot.all.map do |robot| 
      images.push(robot.image_url)
    end
    images.sample
  end

  def set_img_to_robot
    self.image_url = Robot.robot_image_generator
  end

end
