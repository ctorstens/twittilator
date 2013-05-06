get '/' do
  erb :index
end

get '/:twitterhandle' do
  @user = User.find_or_create_by_twitter_handle(params[:twitterhandle])
    if @user.tweets_stale? 
      @user.fetch_tweets!
    end
  @tweets = @user.tweets.limit(10)

  erb :user_tweets
end


