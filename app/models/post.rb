class Post < ApplicationRecord
  has_rich_text :content

  # Enums
  enum :category, [ :technical, :splitboarding ]

  # Validations
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :slug, presence: true, uniqueness: true

  # Callbacks
  before_validation :generate_slug, on: :create

  # Scopes
  scope :published, -> { where.not(published_at: nil).where("published_at <= ?", Time.current) }
  scope :ordered, -> { order(published_at: :desc) }

  def preview_content(length: 200)
    text_content = content.to_plain_text
    text_content.squish!
    text_content.truncate(length, separator: " ", omission: "... Read more")
  end

  private

  def generate_slug
    return if slug.present?

    base_slug = title.to_s.parameterize
    unique_slug = base_slug
    counter = 1

    while Post.exists?(slug: unique_slug)
      unique_slug = "#{base_slug}-#{counter}"
      counter += 1
    end

    self.slug = unique_slug
  end
end
