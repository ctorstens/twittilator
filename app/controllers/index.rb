get '/' do
  erb :index
end

get '/:twitterhandle' do
  @user = User.find_or_create_by_twitter_handle(params[:twitterhandle])
  @tweets = @user.tweets.limit(10) unless @user.tweets_stale? 
  erb :user_tweets
end

post '/users_tweets' do 
  content_type :json
  @user = User.find_by_twitter_handle(params[:twitter_handle])
  @user.fetch_tweets!
  @tweets = @user.tweets.limit(10)
  (erb :_tweets, :layout => false).to_json
end

