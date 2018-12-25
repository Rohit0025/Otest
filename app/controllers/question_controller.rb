class QuestionsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:index, :edit, :update, :delete]

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @subjects = Subject.all.collect { |subject| [subject.name, subject.id] } 
  end

  def edit
    @question = Question.find(params[:id])
    @subjects = Subject.all.collect { |subject| [subject.name, subject.id] } 
  end

  def create
    @question = Question.new(params[:question])
    @subjects = Subject.all.collect { |subject| [subject.name, subject.id] }

    if @question.save
      flash.now[:success] = "Succeed in adding question."
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    @subjects = Subject.all.collect { |subject| [subject.name, subject.id] } 
    
    if @question.update_attributes(params[:question])
      flash[:success] = "Question updated"
      redirect_to @question
    else
      render 'edit'
    end
  end
  
  def destroy
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_user
      redirect_to(@user, notice: "You do not have access.") unless current_user.admin?
    end
end