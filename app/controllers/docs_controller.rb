class DocsController < ApplicationController

  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.sorted
  end

  def show
  end

  def new
    @doc = current_user.docs.build
  end

  def create
    @doc = current_user.docs.build(doc_params)
    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render 'edit'
      Rails.logger.info(@doc.errors.inspect)
    end
  end

  def destroy
    @doc.destroy
    redirect_to @docs
  end

  private

  def find_doc
    @doc = current_user.docs.find(params[:id])
  end

  def doc_params
    params.require(:doc).permit(:title, :content)
  end
end
