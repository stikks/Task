class QuizTaskController < ApplicationController
  layout false
  def index
    @quiz_task = QuizTask.sorted
  end

  def edit
    @quiz_task = QuizTask.find(params[:id])
  end

  def update
    @quiz_task = QuizTask.find(params[:id])
    if @quiz_task.update_attributes(params.require(:quiz_task).permit(:name,:position,:about))
      flash[:notice] = "Quiz successfully edited"
      redirect_to(:action=>'show', :id=>@quiz_task.id) 
    else 
      render ('update')
    end
  end

  def show
    @quiz_task = QuizTask.find(params[:id])
  end

  def create
    @quiz_task = QuizTask.new(params.require(:quiz_task).permit(:name,:position,:about))
    @quiz_task.save
    if @quiz_task.save
      flash[:notice] = "Quiz successfully created"
      redirect_to(:action=>'index')
    else
      render ('new')
    end 
  end

  def delete
    @quiz_task = QuizTask.find(params[:id])
  end

  def destroy 
    subject = QuizTask.find(params[:id]).destroy
    flash[:notice] = "Quiz successfully deleted"
    redirect_to(:action=>'index')
  end

end
