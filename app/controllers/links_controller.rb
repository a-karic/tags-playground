# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :authenticate_user!

  def new
    @link = Link.new
  end

  def create
    link_service = LinkService.new(link_params)
    return errors unless link_service.save
    redirect_to dashboard_index_path
  end

  private

  def link_params
    params.require(:link).permit(:url, :tag_list).merge(
      user: current_user
    )
  end

  def errors
    flash.now[:danger] = 'Failed to save link'
    render :new
  end
end
