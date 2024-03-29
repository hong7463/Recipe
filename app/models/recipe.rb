class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :directions, dependent: :destroy
  belongs_to :user
accepts_nested_attributes_for :ingredients,
  							  reject_if: proc { |attributes| attributes['name'].blank? },
  							  allow_destroy: true
accepts_nested_attributes_for :directions,
  							  reject_if: proc { |attributes| attributes['step'].blank? },
  							  allow_destroy: true
  

  has_attached_file :image, styles: { :medium => "300x300#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
