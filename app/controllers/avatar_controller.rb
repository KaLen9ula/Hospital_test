class AvatarController < ApplicationController
  def create
    Avatar.create(avatar_params.merge(user_id: current_user.id))
  end

  private

  def avatar_params
    params.require(:avatar).permit(:image)
  end
end
