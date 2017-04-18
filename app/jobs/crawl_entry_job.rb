class CrawlEntryJob < ApplicationJob
  queue_as :default

  def perform(entry_id)

    # Find `Entry`
    entry = Entry.find(entry_id)

    if entry.nil? # || !entry.pending? 
      return nil
    end

    # Update state to :processing
    entry.processing!
    entry.save
    
    # Get Platforms
    Platform.all.each do |platform|
      # ToDo match with the name of the platform too
      if /#{platform.entry_validation}/.match(entry.url)
        entry.platform = platform
        break
      end
    end if entry.platform.nil?
  
    # -> if not Update state to :unknow_url
    if entry.platform.nil?
      entry.unknow_url!
      entry.save
      return nil
    end
    
    # Crawl page contant
    response = HTTParty.get(entry.url, headers: {"Accept-Language" => "en-GB"})
    if response.code != 200
      return nil
    end
  
    doc = Nokogiri::HTML(response.body)

    # Get `MetadataRules`
    entry.platform.metadata_rules.all.each do |metadata_rule|
      begin
        _value = nil

        if !metadata_rule.xpath.nil?
          doc.xpath(metadata_rule.xpath).each do |value|
            _value = value
          end
        elsif !metadata_rule.regex.nil?
          m = /#{metadata_rule.regex}/.match(response.body)
          if m 
            _value = m[1]
          end
        end

        if !_value.nil?
          # Create `Metadata`
          metadata = entry.metadatum.find_or_initialize_by(name: metadata_rule.name)
          metadata.set(value: _value)
          metadata.save
        end
      rescue => e 
        puts e
      end
    end
    
    # Update state to :crawled
    entry.crawled!
    entry.save

    sleep(0.05)

    HarvestEntryJob.perform_later(doc.xpath('/html/body//a[starts-with(@href, "/watch?v=")]/@href').map{ |node| node.value }.uniq, entry_id)

  end

end
