class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(quote_id: params[:quote_id])
    @quotes = Quote.all.order('created_at DESC').includes(%i[user replies])

    if @like.save
      redirect_to request.referrer, notice: 'You liked a quote.'
    else
      redirect_to request.referrer, alert: 'You cannot like this quote.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, quote_id: params[:quote_id])
    if like
      like.destroy
      redirect_to request.referrer, notice: 'You disliked a quote.'
    else
      redirect_to request.referrer, alert: 'You cannot dislike quote that you did not like before.'
    end
  end
end
