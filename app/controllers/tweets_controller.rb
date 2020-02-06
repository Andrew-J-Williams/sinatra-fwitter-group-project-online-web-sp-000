class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
        @tweets = Tweet.all
        erb :"/tweets/tweets"
    else
        redirect to '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
        erb :"/tweets/new"
    else
        redirect to '/login'
    end
  end

  post '/tweets' do
    tweet = Tweet.new(params[:content])
    @tweets = Tweet.all
    @tweets << tweet

  end


end
