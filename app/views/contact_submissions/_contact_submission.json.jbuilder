json.extract! contact_submission, :id, :name, :email, :subject, :message, :created_at, :updated_at
json.url contact_submission_url(contact_submission, format: :json)
