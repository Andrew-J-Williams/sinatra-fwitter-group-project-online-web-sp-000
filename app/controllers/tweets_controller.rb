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
    user = current_user #Sets variable equal to the user's session
    if params["content"].empty? #Checks to see if the user has written a blank tweet
      "Please enter content for your tweet"
      redirect to '/tweets/new' #Send the user back to the create screen if tweet is blank
    else
      tweet = Tweet.create(:content => params["content"], :user_id => user.id)
    end

    redirect to '/tweets'
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find_by(params[:id])
      erb :'/tweets/show'
    else
      redirect to '/login'
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find_by(params[:id])
      erb :'/tweets/edit'
    else
      redirect to '/login'
    end
  end

  patch '/tweets/:id' do
    user = current_user
    tweet = Tweet.find(params[:id])
    if params["content"].empty?
      "Please enter content for your tweet"
      redirect to "/tweets/#{params[:id]}/edit"
    end
      tweet.update(:content => params["content"])
      tweet.save

      redirect to "/tweets/#{tweet.id}"
  end

end
