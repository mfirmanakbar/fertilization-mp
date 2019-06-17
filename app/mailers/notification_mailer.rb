class NotificationMailer < ApplicationMailer
  default from: "Fertilization-MP"

  def notification_email(receiver_email, reset_new_password)
    datenow = Time.now.strftime("%Y%d%m%H%M%S")
    subs = "#{"Fertilization-MP #"+datenow} Reset Password"
    # mail(to: receiver_email, subject: subs)
    mail(to: receiver_email, subject: subs) do |format|
      # @u = User.new
      # @u.email = "gogo@gogo.com"
      format.html {
        "
          <!DOCTYPE html>
          <html lang='en' dir='ltr'>
            <head>
              <meta charset='utf-8'>
              <title></title>
            </head>
            <body>
              <br>
              <b>Dear User</b>
              <br>
              <p>Your new password is '<b>#{reset_new_password}</b>' Please log in to <a href='https://fertilization-mp.herokuapp.com'>Fertilization-Mp</a></p>
              <br>
              <b>Thanks</b>
              <br>
              <span>Github Link <a href='https://github.com/mfirmanakbar/fertilization-mp'>(Fertilization-Mp)</a></span>
            </body>
          </html>
        "
      }
      # format.html { render 'notification_email', obj: @u }
      # format.text { render plain: 'Render text' }
    end

  end

end
