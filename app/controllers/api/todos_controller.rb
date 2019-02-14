class Api::TodosController < ApiController

  before_action :set_todo, except: [:index, :create, :restore, :find_by_tags]
  before_action :set_deleted_todo, only: [:restore]

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
    head :no_content if @todo.update!(todo_params)
  end

  # PATCH /api/todos/:id/update_status
  def update_status
    head :no_content if @todo.update!(todo_status_params)
  end

  # PATCH /api/todos/:id/assign_tags
  def assign_tags
    head :no_content if @todo.update!(todo_tags_params)
  end

  # DELETE  /api/todos/:todo_id
  def destroy
    @todo.update(is_deleted: true)
    head :no_content
  end

  # PATCH /api/todos/:id/restore
  def restore
    @todo.update(is_deleted: false)
    head :no_content
  end

  # GET /api/todos/find_by_tags/:tag
  def find_by_tags
    @todos = Todo.where(tags: {'$in': find_tag_params}).page params[:page]
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def todo_tags_params
    params.require(:todo).permit(tags: [])
  end

  def todo_status_params
    params.require(:todo).permit(:status)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_deleted_todo
    @todo = Todo.unscoped.find(params[:id])
  end

  def find_tag_params
    params[:tags].split(',') rescue []
  end
end
