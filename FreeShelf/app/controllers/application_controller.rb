class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        User.find_or_create_by(username: "Crystal")
    end
end
