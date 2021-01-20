class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end
  
  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subjects = Subject.new
    @books = Book.all
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to action: "index"
    else
      render action: "new"
    end
  end

  def subject_params
     params.require(:subject).permit(:name)
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      redirect_to action: "index"
    else
      render action: "edit"
    end
  end

  def destroy
    Subject.find(params[:id]).destroy
    redirect_to action: "index"
  end
end
