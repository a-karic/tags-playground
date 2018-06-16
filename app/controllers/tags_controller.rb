# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :authenticate_user!

  def from_users
    return unless links
    render json: links.tag_counts.to_json
  end

  def from_page
    tags = FindTagsInUrl.new(params[:url]).top_tags
    return unless tags.present?
    render json: tags.to_json
  end

  private

  def links
    formated_url = FormatUrl.new(params[:url]).formated_url
    @links ||= Link.where(formated_url: formated_url)
  end
end
