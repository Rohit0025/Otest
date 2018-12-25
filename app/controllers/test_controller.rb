class TestsController < ApplicationController
  def index
    current_user = User.find_by_remember_token(cookies[:remember_token])
    @tests = Test.where(current_user)
  end

  def show
    @test = Test.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @test }
    end
  end

  def new
    @test = Test.new

    respond_to do |format|
      format.html 
      format.json { render json: @test }
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.new(params[:test])

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render json: @test, status: :created, location: @test }
      else
        format.html { render action: "new" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @test = Test.find(params[:id])

    respond_to do |format|
      if @test.update_attributes(params[:test])
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
    end
  end
end
