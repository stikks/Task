class QuestionController < ApplicationController
  layout false 
  def index
    @question = Question.sorted
  end

  def new
    @question = Question.new
  end

   def create
    @question = Question.new(params.require(:question).permit(:name,:number,:body,:A,:B,:C))
    @question.save
    if @question.save
      flash[:notice] = "Question successfully created"
      redirect_to(:action=>'index')
    else
      render ('new')
    end 
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update 
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:name,:number,:body,:A,:B,:C))
      flash[:notice] = "Question successfully edited"
      redirect_to(:action=>'show', :id=>@question.id) 
    else 
      render ('update')
    end
  end 

  def show
     @question = Question.find(params[:id])
  end

  def delete
    @question = Question.find(params[:id])
  end


  def destroy 
    subject = Question.find(params[:id]).destroy
    flash[:notice] = "Question successfully deleted"
    redirect_to(:action=>'index')
  end

end
