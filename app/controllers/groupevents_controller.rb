class GroupeventsController < ApplicationController
  @@group 

  def new
    set_group
    @groupevent = @@group.groupevents.new
  end

  def create
    @@group.groupevents.create(groupevent_parameter)
    redirect_to group_path(@@group)
  end

  private

  def set_group
    @@group = Group.find(params[:group_id])
  end

  def groupevent_parameter
    params.permit(:title, :content, :group_id, :start_time)
  end

end
