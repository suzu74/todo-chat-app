class TasksController < ApplicationController

  def index
    @board = Board.find(params[:board_id]) 
    @tasks = Task.where(board_id: @board.id)
  end
  def new
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.build
  end

  def create
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.build(task_params)
    @task.board_id = @board.id
    if @task.save
      redirect_to board_tasks_path, notice: 'タスクを保存しました'
    else
      flash.now[:error] = 'タスクの保存に失敗しました'
      render :new
    end
  end

  def show
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
  end
  
  def edit
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@board, @task), notice: 'タスクを更新しました'
    else
      flash.now[:error] = 'タスクの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to board_tasks_path ,notice: 'deleted!'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :eyecatch)
  end
end

