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
    user = Helpers.current_user(session)
    if params["content"].empty?
      flash[:empty_tweet] = "Please enter content for your tweet"
      redirect to '/tweets/new'
    end
    tweet = Tweet.create(:content => params["content"], :user_id => user.id)

    redirect to '/tweets'
  end


end
