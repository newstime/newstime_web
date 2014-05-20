class User < ActiveRecord::Base
  has_and_belongs_to_many :publications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def buy_edition(edition)
    editions << edition unless editions.exists?(edition)
  end

  has_many :subscriptions
  has_and_belongs_to_many :editions

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

end
