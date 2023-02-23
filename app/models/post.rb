class Post < ApplicationRecord

  belongs_to :customer
  has_one_attached :image

  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres
  accepts_nested_attributes_for :post_genres

  has_many :favorites, dependent: :destroy
  
  validates :post_text, presence: true,
    length: { minimum: 1, maximum: 300 }
  

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end