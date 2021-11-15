class StudyTimesController < ApplicationController
  before_action :set_study_time, only: %i[ show edit update destroy ]

  # GET /study_times or /study_times.json
  def index
    @study_times = StudyTime.all
  end

  # GET /study_times/1 or /study_times/1.json
  def show
  end

  # GET /study_times/new
  def new
    @study_time = StudyTime.new
  end

  # GET /study_times/1/edit
  def edit
  end

  # POST /study_times or /study_times.json
  def create
    @study_time = StudyTime.new(study_time_params)

    respond_to do |format|
      if @study_time.save
        format.html { redirect_to @study_time, notice: "Study time was successfully created." }
        format.json { render :show, status: :created, location: @study_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @study_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_times/1 or /study_times/1.json
  def update
    respond_to do |format|
      if @study_time.update(study_time_params)
        format.html { redirect_to @study_time, notice: "Study time was successfully updated." }
        format.json { render :show, status: :ok, location: @study_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @study_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_times/1 or /study_times/1.json
  def destroy
    @study_time.destroy
    respond_to do |format|
      format.html { redirect_to study_times_url, notice: "Study time was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_time
      @study_time = StudyTime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def study_time_params
      params.require(:study_time).permit(:user_id, :time)
    end
end
