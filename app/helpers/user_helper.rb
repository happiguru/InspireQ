module UserHelper
  def current_user?(user)
    current_user == user
  end

  def not_followed(user)
    User.where.not(follower_id: user)
  end

  def follow_unfollow
    return if current_user?(@user)

    if current_user.following?(@user)
      render 'unfollow'
    else
      render 'follow'
    end
  end

  def user_feed
    if current_user.following?(@user) || current_user == @user
      if @user.quotes.empty?
        raw("<p class='box'>This user does not have posts.</p>")
      else
        render 'feed'
      end
    else
      raw("<p class='box'>Follow this user to see his/her posts.</p>")
    end
  end
end
