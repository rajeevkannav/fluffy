class Api::TodosController < ApiController

  before_action :set_todo, only: [:show, :update, :restore, :destroy]

  # GET /api/todos
  def index
    @todos = Todo.all.page params[:page]
  end

  # GET /api/todos/:todo_id
  def show
  end

  # POST /api/todos
  def create
    @todo = Todo.new(todo_params)
    render status: :created if @todo.save!
  end

  # PUT /api/todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE  /api/todos/:todo_id
  def destroy
    @todo.update(is_deleted: true) unless @todo.is_deleted
    head :no_content
  end

  # PATCH /api/todos/:id/restore
  def restore
    @todo.update(is_deleted: false) if @todo.is_deleted
    head :no_content
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

end
