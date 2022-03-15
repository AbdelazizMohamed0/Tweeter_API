# frozen_string_literal: true

module Api
  module V1
    class TweetsController < ApplicationController
      def index
        tweets = Tweet.all
        render json: TweetsRepresenter.new(tweets).as_json
      end

      def create
        # user = Username.create!(user_params)
        tweet = Tweet.new(tweet_params.merge(username_id: current_user.id))

        if  tweet.save
          render json: tweet, status: :created
        else
          render json: tweet.error, status: :unprocessable_entity
        end
      end

      def destroy
        tweet = Tweet.find(params[:id])
        if tweet.destroy
          head :no_content
        else
          render json: tweet.error, status: :unprocessable_entity
        end
      end

      def update
        tweet = Tweet.find(params[:id])

        if tweet.update(tweet_params)
          render json: tweet, status: :created
        else
          render json: tweet, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :age)
      end

      def tweet_params
        params.require(:tweet).permit(:body)
      end
    end
  end
end
