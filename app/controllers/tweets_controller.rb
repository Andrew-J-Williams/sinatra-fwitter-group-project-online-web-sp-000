class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
        @tweets = Tweet.all
        erb :"/tweets/tweets"
    else
        redirect to '/login'
    end
  end

  get '/new' do
    if logged_in?
        @tweets = Tweet.all
        erb :"/tweets/new"
    else
        redirect to '/login'
    end
  end


end
