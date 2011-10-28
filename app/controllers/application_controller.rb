class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  def login_required
    if !current_user
      respond_to do |format|
        format.html  {
          redirect_to '/auth/oauth_sn'
        }
        format.json {
          render :json => { 'error' => 'Access Denied' }.to_json
        }
      end
    end
  end

  def current_user
    return nil unless session["user_id"].present?
    @current_user ||= User.find_by_uid(session["user_id"]['uid'])
  end
end
