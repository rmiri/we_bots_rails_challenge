class RobotsController < ApplicationController
    def index
        @robots = Robot.all
    end
    def show
        @robot = Robot.find(params[:id])
    end
    def new
        @robot = Robot.new
    end
    def create
        robot = Robot.new(robot_params)
        robot.set_img_to_robot
        if robot.valid?
            robot.save
            redirect_to robot
        else
            flash[:errors] = robot.errors.full_messages
            redirect_to new_robot_path
        end
    end
    def edit
        @robot = Robot.find(params[:id])
    end
    def update
        robot = Robot.update(robot_params)
        redirect_to robot_path
    end
    def destroy
        @robot = Robot.find(params[:id])
        @robot.destroy

        redirect_to robots_path
    end

    private
    def robot_params
        params.require(:robot).permit(:name, :ability_id)
    end
end
