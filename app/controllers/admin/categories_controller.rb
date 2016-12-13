class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(id: :desc).all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.'}
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def category_params
      params.fetch(:category, {}).permit(:name)
    end

end
