class Terence
  def location
    if tweet
      tweet.place.full_name
    end
  end

  def date
    timestamp.to_date
  end

  private

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
    end
  end

  def tweets
    twitter_client.user_timeline("hone02")
  end

  def tweet
    tweets.detect { |tweet| tweet.place? }
  end

  def timestamp
    tweet.created_at
  end
end
