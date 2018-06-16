# frozen_string_literal: true

class LinkService
  def initialize(params)
    @params = params
    @link = Link.find_or_initialize_by(formated_url: formated_url, user: user)
  end

  def save
    return unless tag_list.present?
    @link.url = url
    @link.tag_list << tag_list # because of the bug in taggable gem in Rails 5.2
    return false unless @link.save
    true
  end

  def errors
    @link.errors
  end

  private

  def tag_list
    @params[:tag_list].split(',')
  end

  def user
    @params[:user]
  end

  def formated_url
    FormatUrl.new(url).formated_url
  end

  def url
    @params[:url]
  end

  def link_params
    {
      user: user,
      url: url,
      formated_url: formated_url
    }
  end
end
