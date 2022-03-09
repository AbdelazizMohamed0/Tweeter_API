class TweetsRepresenter
 def initialize(tweets)
    @tweets = tweets
 end
 def as_json
    tweets.map do |tweet|
        {
            tweet: tweet.id,
            body: tweet.body,
            user_age: tweet.username.age,
            user_name: "#{tweet.username.first_name} #{tweet.username.last_name}"

        }
        end
    end

  private
   attr_reader :tweets
end    