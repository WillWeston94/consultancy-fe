class TwilioVerifyService
  def initialize
    account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_verification_code(phone_number)
    formatted_phone_number = PhonyRails.normalize_number(phone_number, default_country_code: 'US')
    # binding.pry 
    @client.verify.services(Rails.application.credentials.dig(:twilio, :verify_service_sid))
      .verifications
      .create(to: formatted_phone_number, channel: "sms")
  end

  def check_verification_code(phone_number, code)
    formatted_phone_number = PhonyRails.normalize_number(phone_number, default_country_code: 'US')
    # binding.pry 
    verification_check = @client.verify.services(Rails.application.credentials.dig(:twilio, :verify_service_sid))
      .verification_checks
      .create(to: formatted_phone_number, code: code)

    verification_check
  end
end
