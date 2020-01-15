# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Robot.destroy_all
Ability.destroy_all

abilities = [
  {
    name: "Site Maintenance",
    description: "Keeps the site running by peforming a variety of tasks: cooking, cleaning, etc."
  }, {
    name: "Target Surveillance",
    description: "Stealthily follows a given target, sending reports on all activity and communication with outside parties."
  }, {
    name: "Machine Repair",
    description: "Maintains the durability of various systems, including other robots."
  }, {
    name: "Weapons Dismantlement",
    description: "Disables malicious technology by removing vital components."
  }, {
    name: "Supply Delivery",
    description: "Braves innumerable dangers to distribute essential rations and munitions."
  }, {
    name: "Human Transport",
    description: "Transits important personnel between both safe and danger zones."
  }
]

abilities.each { |ability| Ability.create(ability)}

def generate_name
	alphabet = ('A'..'z').to_a
	digits = ('0'..'9').to_a
	bot_name = ""

	[1,2,3].sample.times do
		bot_name = bot_name + alphabet.sample
	end

	"#{bot_name}-#{digits.sample}#{digits.sample}"
end

robots = []
10.times do
  name = generate_name
  robots << { name: name, image_url: "https://robohash.org/#{name}" }
end

# ---------------
# POWERFUL ROBOTS:
# Once you set up your tables and associations the way you want them, you can
# uncomment the following method to associate robots with their abilities!
# Just uncomment line 53 and run `rake db:seed` again in your terminal.
# (Note: If you try to do this before you set up proper associations, it will error.)
# ---------------
robots = robots.map { |robot| robot.merge( { ability_id: Ability.all.sample.id } ) }
# ---------------

robots.each { |robot| Robot.create(robot) }