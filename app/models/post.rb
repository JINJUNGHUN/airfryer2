class Post < ApplicationRecord
  resourcify

  scope :filter, -> (category_id){ includes(:categories).where(categories: {id: category_id}) if category_id.present? }

  is_impressionable
  acts_as_paranoid

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments

  has_many :likes, dependent: :destroy
  has_many   :liked, :through => :likes, :source => :user

  has_many :favorites, dependent: :destroy

  belongs_to :user

  belongs_to :category


  mount_uploader :image, ImageUploader

  # 이미지를 가진 게시글 삭제 시 AWS S3서버에도 자동 삭제처리
  before_destroy :destroy_assets

  def destroy_assets
      self.image.remove! if self.image
      self.save!
  end

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :image, file_size: { less_than: 10.megabytes }

  has_and_belongs_to_many :tags

  after_create do
      post = Post.find_by(id: self.id)
      hashtags = self.description.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
      hashtags.uniq.map do |hashtag|
          tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
          post.tags << tag
      end
  end

  before_update do
      post = Post.find_by(id: self.id)
      post.tags.clear
      hashtags = self.description.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
      hashtags.uniq.map do |hashtag|
          tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
          post.tags << tag
      end
  end

end
