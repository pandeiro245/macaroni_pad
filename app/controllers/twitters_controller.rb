#_ -*r coding: utf-8 -*-
class TwittersController < ApplicationController
  def login
    @auth = request.env["omniauth.auth"]
    session[:oauth] = @auth[:credentials]
    session[:twitter_id] = @auth[:uid]
    twitter = Twitter.updt_via_auth(@auth)
    session[:twitter_id]  = twitter.user_id if twitter
    redirect_to '/'
  end

  def logout
    session.destroy
    redirect_to '/'
  end
end
