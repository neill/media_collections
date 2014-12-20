module MediaPagesHelper
    def submit_content_btn
        if params[:action] == 'edit'
            return "Edit Media"
        else
            return "Add Media"
        end
    end
end
