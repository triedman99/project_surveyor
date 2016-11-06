class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    @options = Option.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(whitelisted_survey_parameters)
    if @survey.save
      redirect_to new_survey_question_path(@survey)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def whitelisted_survey_parameters
    params.require(:survey).permit(:title, :description)
  end

end
