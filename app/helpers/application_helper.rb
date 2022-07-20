module ApplicationHelper
  def avatar_for(user)
    @avatar = user.avatar&.image&.url
    if user.avatar
      @avatar = user.avatar&.image&.url
    else
      image_path('avatars.jpg')
    end
  end
end
