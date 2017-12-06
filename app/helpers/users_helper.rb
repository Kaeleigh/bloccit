module UsersHelper
  def users_has_no_post?(user)
    user.posts.count == 0
  end

  def users_has_no_comment?(user)
    user.comments.count == 0
  end

  def users_has_no_favorite?(user)
    user.favorites.count == 0
  end
end
