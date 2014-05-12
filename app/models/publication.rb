class Publication
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :slug, type: String

  has_many :editions, inverse_of: :publication

  def share_path
    Rails.root.join('share', 'publications', id.to_s)
  end

end
