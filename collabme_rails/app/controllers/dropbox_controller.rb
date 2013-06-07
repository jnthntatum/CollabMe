
class DropboxController < ApplicationController

def authorize
    require 'dropbox-api'


    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = consumer.get_request_token
    # Store the token and secret so after redirecting we have the same request token
    session[:token] = request_token.token
    session[:token_secret] = request_token.secret
    request_token.authorize_url(:oauth_callback => 'http://yoursite.com/callback')
    # Here the user goes to Dropbox, authorizes the app and is redirected
    hash = { oauth_token: session[:token], oauth_token_secret: session[:token_secret]}
    request_token  = OAuth::RequestToken.from_hash(consumer, hash)
    result = request_token.get_access_token(:oauth_verifier => hash[oauth_token])


    client = Dropbox::API::Client.new :token => result.token, :secret => result.secret
  end

  def upload
    return redirect_to(:action => 'authorize') unless session[:dropbox_session]
    dropbox_session = Dropbox::Session.deserialize(session[:dropbox_session])
    return redirect_to(:action => 'authorize') unless dropbox_session.authorized?

    if request.method == :post then
      dropbox_session.upload params[:file], 'My Uploads'
      render :text => 'Uploaded OK'
    else
      # display a multipart file field form
    end
  end

end