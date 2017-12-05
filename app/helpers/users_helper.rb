module UsersHelper
  def avatar_user?(user)
    avatar_url == @user.avatar_url(128)
  end
end
