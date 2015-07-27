namespace :asn do
  desc 'scrape'
  task scrape_maths: :environment do
    GDS_MATHS = 'https://www.gov.uk/government/publications/national-curriculum-in-england-mathematics-programmes-of-study/national-curriculum-in-england-mathematics-programmes-of-study'
    GdsCurriculumPage.new(GDS_MATHS)
  end
end
