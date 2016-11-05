class QuestionsController < ApplicationController

  def index
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @question = Question.new(survey_id: @survey.id)
  end

  def create
    @question = Question.new(whitelisted_question_params)
    if @question.save
      redirect_to edit_survey_question_path(@question.survey_id, @question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @survey = @question.survey
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(whitelisted_question_params)
      redirect_to question_edit_options_path(@question)
    else
      render :edit
    end
  end

  def edit_options
    @question = Question.find(params[:id])
    @survey = @question.survey
    @num_options = @question.num_options
    @options = Option.all
  end

  def update_options
    @question = Question.find(params[:id])
    @survey= @question.survey
    if @question.update(whitelisted_question_params)
      redirect_to new_survey_question_path(@survey)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @survey = @question.survey
    if @question.delete
      render :index
    else
      @num_options = @question.num_options
      render :edit_options
    end
  end

  private

  def whitelisted_question_params
    params.require(:question).permit(:question_type, :num_options, :body, :survey_id, :multi_select, :required,
                                     { :options_attributes => [:body, :_destroy] } )
  end

end
