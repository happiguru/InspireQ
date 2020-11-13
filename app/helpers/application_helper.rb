module ApplicationHelper
  def follow!(other_user)
    relationships.create!(followed_id: other_user)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def like_or_dislike_btn(quote)
    like = Like.find_by(quote: quote, user: current_user)
    if like
      link_to('👎', quote_like_path(id: like.id, quote_id: quote.id), method: :delete, class: 'likes')
    else
      link_to('👍', quote_likes_path(quote_id: quote.id), method: :quote, class: 'likes')
    end
  end

  def flash_notice
    if flash[:notice]
      raw("<div class='notification is-primary global-notification mb-0'>
            <p class='notice'>#{notice}</p>
            </div>")
    end
  end

  def flash_alert
    if flash[:alert]
      raw("<div class='notification is-danger global-notification mb-0'>
            <p class='alert'>#{alert}</p>
        </div>")
    end
  end

  def side_panel_on
    if signed_in?
      raw("<div class='is-flex h-100 '>
            <div class='side-panel px-2 py-2'>
                #{render 'users/side_panel'}
            </div>")
    end
  end

  def nav_bar
    if user_signed_in?
      raw("<p class='control user_name'>
                #{link_to current_user.fullname, user_path(current_user), class: 'button is-info '}
            </p>
            <p>
            #{link_to 'Logout', destroy_user_session_path, method: :delete, class: 'button is-danger'}
            </p>")
    else
      raw("
            <p class='control'>
                #{link_to 'Sign In', new_user_session_path, class: 'button is-info'}
            </p>
            <p class='control'>
                #{link_to 'Sign Up', new_user_registration_path, class: 'button is-info'}
            </p>")
    end
  end
end
