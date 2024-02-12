class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
    @users = User.all
    @properties = Property.all
  end

  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      redirect_to root_path, notice: 'Assignment was successfully created.'
    else
      render :new
    end
  end

  def update
    @assignment = Assignment.find(assignment_id)
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :property_id)
  end
end
