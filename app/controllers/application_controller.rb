class ApplicationController < ActionController::Base
    protect_from_forgery
    before_action :set_locale   
    def set_locale
        I18n.locale = params[:locale] if params[:locale].present?
    end
        
    def default_url_options(options = {})
        options.merge(locale: I18n.locale)
    end
    helper_method :current_user

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end
end
