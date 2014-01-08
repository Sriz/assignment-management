
class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :class_roll_no, :gender,:password, :batch_id, :password_confirmation)}
    end
end