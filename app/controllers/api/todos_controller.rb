class Api::TodosController < ApiController

  ### Callbacks
  before_action :set_todo, except: [:index, :create, :restore]
  before_action :set_deleted_todo, only: [:restore]

  # GET /api/todos
  def index
    @todos = if (params[:archived] == "true")
               Todo.unscoped.all.where(is_deleted: true).page params[:page]
             else
               Todo.all.page params[:page]
             end
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
    @todo.update!(todo_params)
  end

  # PATCH /api/todos/:id/update_status
  def update_status
    @todo.update!(todo_status_params)
  end

  # PATCH /api/todos/:id/assign_tags
  def assign_tags
    head :no_content if @todo.tags << Tag.find_or_create_by(tags_params)
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

  private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def tags_params
    params.require(:tag).permit(:name)
  end

  def todo_status_params
    params.permit(:status)
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
