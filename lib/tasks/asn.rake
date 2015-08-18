namespace :asn do
  GDS_MATHS = 'https://www.gov.uk/government/publications/national-curriculum-in-england-mathematics-programmes-of-study/national-curriculum-in-england-mathematics-programmes-of-study'
  GDS_ENGLISH = 'https://www.gov.uk/government/publications/national-curriculum-in-england-english-programmes-of-study/national-curriculum-in-england-english-programmes-of-study'
  GDS_SCIENCE = 'https://www.gov.uk/government/publications/national-curriculum-in-england-science-programmes-of-study/national-curriculum-in-england-science-programmes-of-study'

  desc 'scrape gds'
  task scrape_gds: :environment do
    nc = Curriculum.create!(name: 'National curriculum in England')
    GdsCurriculumPage.new(GDS_MATHS, 'Maths', nc)
    GdsCurriculumPage.new(GDS_ENGLISH, 'English', nc)
    GdsCurriculumPage.new(GDS_SCIENCE, 'Science', nc)
  end
end
