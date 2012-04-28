require 'spec_helper'

describe LessonStudent do
  it { should belong_to(:lesson) }
  it { should belong_to(:student) }
end
