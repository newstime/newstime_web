class Newsrack < ActiveRecord::Base

  #@editions = Edition.all.order(created_at: :desc).take(24)

  def self.create_newsrack(editions)
    mc = MakeCompositeAction.new(@editions)
    newsrack = create(edition_ids: editions.map(&:id).join(','))
    newsrack.create_sprite!
    newsrack
  end

  def self.share_path
    Rails.root.join("share/newsracks")
  end

  def editions
    @editions ||= begin
      _editions = Edition.find(edition_ids.split(',')).group_by(&:id)
      # Reorder to match edition_ids string.
      edition_ids.split(',').map(&:to_i).map { |id| _editions[id].first }
    end
  end

  def create_sprite!
    mc = MakeCompositeAction.new(editions)
    mc.make_composite!
    self.sprite_path = mc.sprite_path
    save
  end

end
