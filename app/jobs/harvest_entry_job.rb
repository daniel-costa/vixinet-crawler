class HarvestEntryJob < ApplicationJob
  queue_as :low

  def perform(crops, entry_id)

    # Find `Entry`
    entry = Entry.find(entry_id)

    if entry.nil?
      return nil
    end

    # Harvest similar pages
    crops.each do |crop|
      new_entry = Entry.find_or_initialize_by(url: "#{entry.platform.base_url}#{crop}", platform: entry.platform)
      if new_entry.save()
        # ToDo Avoid crawling if it's not a new entry
        CrawlEntryJob.perform_later(new_entry.id.to_s)
      end
    end
  end
end
