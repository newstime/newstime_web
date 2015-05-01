class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  has_many :organization_users
  has_many :organizations, through: :organization_users

  belongs_to :current_organization, class_name: "Organization"
  has_one :wallet

  has_many :purchases, -> { order 'created_at DESC' }


  has_many :edition_copies
  has_many :editions, :through => :edition_copies
  #has_and_belongs_to_many :editions

  has_many :subscriptions
  has_many :publications

  def subscribe_to_publication(publication)
    subscription = subscriptions.find_or_create_by(publication: publication)
    subscription.active = true
    subscription.save
    subscription
  end

  def owner?(edition)
    # If open subscription, treat as if they own while the subscription is active.
    subscriber?(edition.publication) || editions.exists?(edition)
  end

  def subscriber?(publication)
    subscriptions.exists?(publication_id: publication.id, active: true)
  end

  def wallet
    super || create_wallet
  end

  def publications
    Publication.all
  end

  def has_publications?
    true
  end

end
