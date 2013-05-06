class User < ActiveRecord::Base
  has_many :tweets
  
  attr_reader :entered_password

  # validates :first_name, :length => { :minimum => 3, :message => "must be at least 3 characters" }
  # validates :last_name, :length => { :minimum => 3, :message => "must be at least 3 characters" }
  # validates :user_name, :length => { :minimum => 3, :message => "must be at least 3 characters" }
  # validates :entered_password, :length => { :minimum => 6 }
  # validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  include BCrypt

  def tweets_scale?
    
  end



  def fetch_tweets!
    fetched_tweets = Twitter.user_timeline(self.twitter_handle).map {|tweet| tweet.text}
    fetched_tweets.each do |t| 
      self.tweets << Tweet.create(:text => t)
    end
    self.save
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(user_name, password)
    user = User.find_by_user_name(user_name)
    return user if user && (user.password == password)
    nil # either invalid user_name or wrong password
  end

end
