class UserMailer < ApplicationMailer
    def send_client_id(user)
        @user = user
        mail(to: @user.email, Subject: "Your Login ID")
    end
end
