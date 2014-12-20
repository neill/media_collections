module UsersHelper
    def submit_user_btn
        if params[:action] == 'edit'
            return "Edit User"
        else
            return "Sign-up!"
        end
    end
end
