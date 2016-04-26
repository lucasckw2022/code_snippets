class CodesController < ApplicationController

  def new
    @code = Code.new
  end

  def create
    code_params = params.require(:code).permit([:title,:kind_id,:work,:is_private])
    @code = Code.new code_params
    @code.user = current_user
    if @code.save
      redirect_to root_path, notice: "The snippet has been created"
    else
      flash[:notice] = "Failed to save the snippet"
      render :new
    end
  end

  def index
    @kind = Kind.all
    @code = Code.all
  end

  def show
    @kind = Kind.all
    @code = Code.find params[:id]
  end

  def edit
    @code = Code.find params[:id]
  end

  def update
    @code = Code.find params[:id]
    code_params = params.require(:code).permit([:title, :kind_id,:work,:is_private])
    if @code.update code_params
      redirect_to code_path(@code), notice: "The snippet has been modified successfully"
    else
      flash[:notice] = "Failed to modify the snippet"
      render :edit
    end
  end

  def destroy
    @code = Code.find params[:id]
    @code.destroy
    redirect_to root_path, notice: "You have removed the snippet successfully"
  end

  def find_kind(kind_id)
    @code.where(kind_id: kind_id)
  end
  helper_method :find_kind

  def markdown(text)
    options = {
      autolink: true,
      quote: true,
      highlight: true
    }

    extensions = {
      filter_html: true,
      hard_wrap: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
  helper_method :markdown

end
