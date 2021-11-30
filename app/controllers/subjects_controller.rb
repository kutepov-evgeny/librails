class SubjectsController < ApplicationController

  def index
    @subject = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to @subject
    else
      render :new
    end
  end

  def delete
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to root_path
  end

  private
    def subject_params
      params.require(:subject).permit(:name)
    end

end
