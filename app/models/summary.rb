class Summary < ActiveRecord::Base

  # User who wrote the summary.
  # column :user_id
  validates :user_id, :presence => true
  belongs_to :user

  # Is this summary public?
  # column :public

  # The raw content as entered by the user.
  # column :content
  validates :content, :presence => true

  # The markdown'd content. Cached.
  # column :markdown_content
  before_save :cache_markdown_content

  # The URL we are talking about.
  # column :url
  validates :url, :presence => true

  # Private: Take the content and process it through Markdown. Cache it.
  #
  # Returns TrueClass.
  def cache_markdown_content
    self.markdown_content = GitHub::Markdown.render(content)
  end

end
