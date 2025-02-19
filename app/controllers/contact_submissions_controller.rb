class ContactSubmissionsController < ApplicationController
  before_action :set_contact_submission, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ new ]

  # GET /contact_submissions or /contact_submissions.json
  def index
    @contact_submissions = ContactSubmission.all
  end

  # GET /contact_submissions/1 or /contact_submissions/1.json
  def show
  end

  # GET /contact_submissions/new
  def new
    @contact_submission = ContactSubmission.new
  end

  # GET /contact_submissions/1/edit
  def edit
  end

  # POST /contact_submissions or /contact_submissions.json
  def create
    @contact_submission = ContactSubmission.new(contact_submission_params)

    respond_to do |format|
      if @contact_submission.save
        ContactMailer.new_contact(@contact_submission).deliver_later
        format.html { redirect_to @contact_submission, notice: "Contact submission was successfully sent." }
        format.json { render :show, status: :created, location: @contact_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_submissions/1 or /contact_submissions/1.json
  def update
    respond_to do |format|
      if @contact_submission.update(contact_submission_params)
        format.html { redirect_to @contact_submission, notice: "Contact submission was successfully updated." }
        format.json { render :show, status: :ok, location: @contact_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_submissions/1 or /contact_submissions/1.json
  def destroy
    @contact_submission.destroy!

    respond_to do |format|
      format.html { redirect_to contact_submissions_path, status: :see_other, notice: "Contact submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_submission
      @contact_submission = ContactSubmission.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contact_submission_params
      params.expect(contact_submission: [ :name, :email, :subject, :message ])
    end
end
