class ContactMailer < ApplicationMailer
  def new_contact(contact_submission)
    @contact_submission = contact_submission
    mail(to: "davenmport@gmail.com", subject: "New Contact Form Submission")
  end
end
