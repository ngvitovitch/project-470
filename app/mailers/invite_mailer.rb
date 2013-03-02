class InviteMailer < ActionMailer::Base
  default from: "everett.caleb@gmail.com"

  def test(email)
    mail(:from => 'everett.caleb@gmail.com', :to => email, :subject => 'test')
  end

  def invite_email(invite)
    @invite = invite
    @dwelling = invite.dwelling
    puts '--------------------------'
    puts stat = mail( to: invite.email, subject: "You have been invited to join #{@dwelling.name} on Roomie")
    puts stat.errors.any?
    puts '--------------------------'
  end
end
