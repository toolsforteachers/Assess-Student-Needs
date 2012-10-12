class Indicator < ActiveRecord::Base
  validates_numericality_of :level, allow_nil: false, greater_than_or_equal_to: 1, less_than_or_equal_to: 7
  validates_presence_of :name

  def self.grouped_options
    ret = []
    1.upto(5) do |i|
      ret << ["Level #{ i }", Indicator.where(level: i).all.map{ |indicator| [indicator.name, indicator.id]}]
    end
    ret
  end

  def self.grouped_strands
    [
      [
        "Using and applying",
        [
          ["Problem solving", "MA1_PROBLEM"],
          ["Communicating", "MA1_COMMUNICATING"],
          ["Reasoning", "MA1_REASONING"]
        ]
      ],
      [
        "Numbers",
        [
          ["Numbers and the number system", "MA2_NUMBERS"],
          ["Fractions", "MA2_FRACTIONS"]
        ]
      ],
      [
        "Calculating - Knowing and using number facts",
        [
          ["Operations, relationships between them", "MA2A_OPERATIONS"],
          ["Mental methods", "MA2A_MENTAL_METHODS"]
        ]
      ],
      [
        "Calculating - Other",
        [
          ["Solving numerical problems", "MA2A_NUMERICAL_PROBLEMS"],
          ["Written methods", "MA2A_WRITTEN_METHODS"]
        ]
      ],
      [
        "Shape, Space and Measures - Understanding shapes",
        [
          ["Properties of shape", "MA3_SHAPES"],
          ["Properties of position and movement", "MA3_POSITION_MOVEMENT"]
        ]
      ],
      [
        "Measuring",
        [
          ["Measures", "MA3A_MEASURES"]
        ]
      ],
      [
        "Handling data and Using and applying",
        [
          ["Specifying the problem and planning, collecting data", "MA4_PLANNING"],
          ["Processing and representing data", "MA4_PROCESSING"],
          ["Interpreting data", "MA4_INTERPRETING"]
        ]
      ]
    ]
  end
end
