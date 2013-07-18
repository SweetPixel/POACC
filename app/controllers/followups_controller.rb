class FollowupsController < ApplicationController
  before_action :set_followup, only: [:show, :edit, :update, :destroy]

  # GET /followups
  # GET /followups.json
  def index
    @followups = Followup.all
  end

  # GET /followups/1
  # GET /followups/1.json
  def show
  end

  # GET /followups/new
  def new
    @followup = Followup.new
  end

  # GET /followups/1/edit
  def edit
  end

  # POST /followups
  # POST /followups.json
  def create
    @followup = Followup.new(followup_params)

    respond_to do |format|
      if @followup.save
        format.html { redirect_to @followup, notice: 'Followup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @followup }
      else
        format.html { render action: 'new' }
        format.json { render json: @followup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /followups/1
  # PATCH/PUT /followups/1.json
  def update
    respond_to do |format|
      if @followup.update(followup_params)
        format.html { redirect_to @followup, notice: 'Followup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @followup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followups/1
  # DELETE /followups/1.json
  def destroy
    @followup.destroy
    respond_to do |format|
      format.html { redirect_to followups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_followup
      @followup = Followup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def followup_params
      params.require(:followup).permit(:Date, :ClinicalPicture, :Plan)
    end
end
