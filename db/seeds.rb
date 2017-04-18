

youtube = Platform.create({ name: "Youtube", base_url: "https://www.youtube.com", entry_validation: '(\/watch\?v=[a-zA-Z0-9\-\_]+)', harvest: '(\/watch\?v=[a-zA-Z0-9\-\_]+)' })

youtube.metadata_rules.create({ name:'category', xpath:'/html/body//meta[@itemprop="genre"]/@content'})
youtube.metadata_rules.create({ name:'publish_date', xpath:'/html/body//meta[@itemprop="datePublished"]/@content'})
youtube.metadata_rules.create({ name:'title', xpath:'/html/body//meta[@itemprop="name"]/@content'})
youtube.metadata_rules.create({ name:'platform_id', xpath: '/html/body//meta[@itemprop="videoId"]/@content'})
youtube.metadata_rules.create({ name:'views', xpath: '/html/body//meta[@itemprop="interactionCount"]/@content'})
youtube.metadata_rules.create({ name:'video_duration', xpath: '/html/body//meta[@itemprop="duration"]/@content'})
youtube.metadata_rules.create({ name:'description', xpath: '/html/body//meta[@itemprop="description"]/@content'})
youtube.metadata_rules.create({ name:'channel_id', xpath: '/html/body//meta[@itemprop="channelId"]/@content'})
youtube.metadata_rules.create({ name:'is_family_friendly', xpath: '/html/body//meta[@itemprop="isFamilyFriendly"]/@content'})
youtube.metadata_rules.create({ name:'regions_allowed', xpath: '/html/body//meta[@itemprop="regionsAllowed"]/@content'})
youtube.metadata_rules.create({ name:'unlisted', xpath: '/html/body//meta[@itemprop="unlisted"]/@content'})
youtube.metadata_rules.create({ name:'verified', xpath: '/html/body//span[@aria-label="Verified"]/@aria-label'})
youtube.metadata_rules.create({ name:'publisher', xpath:'/html/body//div[@class="yt-user-info"]/a/text()'})
youtube.metadata_rules.create({ name:'publisher_url', xpath: '/html/body//div[@class="yt-user-info"]/a/@href'})

youtube.metadata_rules.create({ name:'likes', xpath: '/html/body//button[contains(@class, "like-button-renderer-like-button-clicked")]/span/text()'})
youtube.metadata_rules.create({ name:'dislikes', xpath: '/html/body//button[contains(@class, "like-button-renderer-dislike-button-clicked")]/span/text()'})
youtube.metadata_rules.create({ name:'embed_url', xpath: '/html/body//link[@itemprop="embedURL"]/@href'})

youtube.metadata_rules.create({ name:'subscriptions', xpath: '/html/body//span[contains(@class, "yt-subscriber-count")]/@title'})
youtube.metadata_rules.create({ name:'category_url', regex: '<h4 class="title">\s+Category\s+<\/h4>\s+<ul class="content watch-info-tag-list">\s+<li><a href="([\w\-\_\/]+)"'})
youtube.metadata_rules.create({ name:'licence', regex: '<h4 class="title">\s+Licence\s+<\/h4>\s+<ul class="content watch-info-tag-list">\s+<li>(.+)<\/li>'})

Entry.create({ url: 'http://www.youtube.com/watch?v=dQw4w9WgXcQo', state: 0})