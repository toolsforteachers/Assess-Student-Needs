namespace :asn do
  desc 'scrape maths'
  task scrape_maths: :environment do
    GDS_MATHS = 'https://www.gov.uk/government/publications/national-curriculum-in-england-mathematics-programmes-of-study/national-curriculum-in-england-mathematics-programmes-of-study'
    GdsCurriculumPage.new(GDS_MATHS, 'Maths')
  end

  desc 'scrape english'
  task scrape_english: :environment do
    GDS_ENGLISH = 'https://www.gov.uk/government/publications/national-curriculum-in-england-english-programmes-of-study/national-curriculum-in-england-english-programmes-of-study'
    GdsCurriculumPage.new(GDS_ENGLISH, 'English')
  end
end
