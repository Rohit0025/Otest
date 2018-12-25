class PapersController < ApplicationController
  def index
    @papers = Paper.all

    respond_to do |format|
      format.html 
      format.json { render json: @papers }
    end
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def new
    @paper = Paper.new
    @subjects = Subject.all.collect { |subject| [subject.name, subject.id] }
  end

  def create
    @paper = Paper.new(params[:paper])
    @subjects = Subject.all.collect { |subject| [subject.name, subject.id] }

      end

      students = User.where("faculty_id=?", @paper.faculty_id)
      students.each do |stu|
        p "1111111111111111111#{stu.name}"
        p "2222222222222222222#{@paper.id}" 
        test = Test.new
        test.user = stu
        test.paper = @paper

        test.save
      end
      flash.now[:success] = "Success."
      redirect_to @paper
    else
      render new
    end
  end
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    respond_to do |format|
      format.html { redirect_to papers_url }
    end
  end
end