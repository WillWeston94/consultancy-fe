class VerificationController < ApplicationController
  before_action :authenticate_user!

  def show_verification_form
    # Your code for showing the verification form
  end

  def send_code
    if request.post?
      phone_number = params[:phone_number]
      service = TwilioVerifyService.new
      verification = service.send_verification_code(phone_number)

      if verification.status == "pending"
        redirect_to show_confirmation_form_path(phone_number: phone_number), notice: "Verification code sent successfully"
      else
        redirect_to show_verification_form_path, notice: "Unable to send verification code. Please Try Again"
      end
    else
      # Handle invalid HTTP method (e.g., GET)
      render plain: "Method Not Allowed", status: :method_not_allowed
    end
  end

  def show_confirmation_form
    @phone_number = params[:phone_number]
  end

  def verify_code
    if request.post?
      phone_number = params[:phone_number]
      service = TwilioVerifyService.new
      verification_check = service.check_verification_code(phone_number, params[:code])

      if verification_check.status == "approved"
        current_user.verify_two_factor_auth
        redirect_to root_path, notice: "Phone number verified successfully"
      else
        render :show_confirmation_code, notice: "Unable to verify code. Please Try Again"
      end
    else
      # Handle invalid HTTP method (e.g., GET)
      render plain: "Method Not Allowed", status: :method_not_allowed
    end
  end
end
