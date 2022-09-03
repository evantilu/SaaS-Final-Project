class MembershipsController < ApplicationController
  def create
    group = Group.find(params[:id])
    # if signed_in? && group
    membership = Membership.new(user: current_user, group: group)
      # if
    membership.save
    flash[:success] = 'Joined!'
    redirect_to group_path(group)
      # else
      #   flash[:error] = 'Error'
      #   redirect_back(fallback_location: '/')
      # end
    # else
    #   flash[:error] = 'Error'
    #   redirect_back(fallback_location: '/')
    # end
  end

  def destroy
    group = Group.find(params[:id])
    if signed_in? && group
      membership = Membership.find_by(user_id: current_user.id, group_id: group.id)
      if membership.destroy
      flash[:success] = 'Successfully Quited Group'
      redirect_to group_path(group)
      # else
      #   flash[:error] = 'Error'
      end
    end
  end
end