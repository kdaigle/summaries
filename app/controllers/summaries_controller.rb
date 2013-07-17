class SummariesController < ApplicationController

  before_filter :current_user_required

  def index
    @summaries = current_user.summaries
  end

  def new
    @summary = current_user.summaries.new
  end

  def create
    @summary = current_user.summaries.new
    @summary.content = params[:summary][:content]
    @summary.url     = params[:summary][:url]

    if @summary.save
      redirect_to @summary
    else
      render :new
    end
  end

  def show
    @summary = current_user.summaries.find(params[:id])
  end

  def edit
    @summary = current_user.summaries.find(params[:id])
  end

  def update
    @summary = current_user.summaries.find(params[:id])
    @summary.content = params[:summary][:content]
    @summary.url     = params[:summary][:url]

    if @summary.save
      redirect_to @summary
    else
      render :new
    end
  end

end
