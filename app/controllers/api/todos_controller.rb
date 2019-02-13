class Api::TodosController < ApiController

  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /api/todos
  def index
    @todos = Todo.all
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
    @todo.destroy
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
