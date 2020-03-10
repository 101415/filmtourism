class UsersController < ApplicationController

  def index
    @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').page(params[:page]).per(9).pluck(:tweet_id))
  end
  
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').page(params[:page]).per(9).pluck(:tweet_id))
  end
end
