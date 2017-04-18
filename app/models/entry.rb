class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid

  field :url, type: String
  as_enum :state, [:pending, :processing, :crawled, :unknow_url], field: { :type => Integer, :default => 0 }

  belongs_to :platform, optional: true #, :autosave => true
  embeds_many :metadatum

  validates :url, :format => { :with => URI::regexp, :message => "url '%{value}' not valid" }
end
