class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  # Members List
  def members
    @group = Group.find_by_groupname(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.admin_id = current_user.id
    if Group.find_by_groupname(group_params[:groupname]) != nil
      render :new
      flash[:error] = "The group name already exits, please use another one!"
      return
    end
    @group.save
    redirect_to group_path(@group)
  end

  def show
    @group = Group.find_by_groupname(params[:id])
    # unless @group
    #   render 'users/not_found'
    # end
    
    user_id_list = []
    @group.users.each do |user|
      user_id_list << user.id
    end
    @user_events = Event.where(user_id: user_id_list)

    group_id_list = []
    group_id_list << @group.id
    @group_events = Groupevent.where(group_id: group_id_list)  
  end

  def send_notify
    @event = Groupevent.find(params[:id])
    @group = Group.find_by_id(@event.group_id)

    @group.users.each do |user|
      @user = user 
      UserMailer.notify_user(@event, @user).deliver 
    end

    flash[:notice] = "An email reminder has been sent to all group members"
    redirect_to group_path(@group)
  end


  private

    def group_params
      params.require(:group).permit(:groupname, :title, :description, :avatar)
    end
end