class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :set_locale, :user_autologin

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def user_autologin
        if cookies[:user_id]
            logger.info 'try to autologin'
            user = User.where(:id => cookies[:user_id]).first;
            logger.info user.inspect
            unless user.nil?
                session[:current_user] = user
                cookies[:user_id] = { :value => user.id, :expires => Time.now + 72 * 3600 } if user.autologin
            end
        end
        unless session[:current_user].nil?
            @logged_user = session[:current_user]
        end
    end

    def default_url_options(options={})
        logger.debug "default_url_options is passed options: #{options.inspect}\n"
        { :locale => I18n.locale }
    end

    def index
    end

    def help
    end

end
