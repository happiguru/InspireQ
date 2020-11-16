module QuotesHelper
  def custom_timeline
    friends = current_user.followed_users
    friends_quotes = []
    if friends.empty?
      friends_quotes = current_user.quotes
    else
      friends.each do |friend|
        user_finder = User.find(friend.id)
        friends_quotes = user_finder.quotes + current_user.quotes
      end
    end
    friends
  end

  def edit_delete_own_quote
    return unless current_user?(@quote.user)

    link_to edit_quote_path(@quote), class: 'level-item' do
      raw("  <span class='icon'>
            <i class='fa fa-pencil' aria-hidden='true'></i>
        </span>")
    end

    link_to @quote, method: :delete, data: { confirm: 'Are you sure you want to delete this quote?' },
                    class: 'level-item' do
      raw("  <span class='icon'>
            <i class='fa fa-trash-o' aria-hidden='true'></i>
        </span>")
    end
  end
  
  def delete_own_quote(quote)
    return unless current_user == quote.user
    
    link_to quote, method: :delete, data: { confirm: 'Are you sure you want to delete this quote?' },
                   class: 'level-item delet' do
       raw(" <span class='icon'>
            <i class='fa fa-trash-o'  aria-hidden='true'></i>
        </span>")
    end
  end
end
