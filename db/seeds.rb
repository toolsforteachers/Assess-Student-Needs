# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

toby = Teacher.create( name: 'Toby P.', email: 'toby@snaplab.co.uk', password: 'password', password_confirmation: 'password' )
nick = Teacher.create( name: 'Nick T.', email: 'nick@smallfish.net', password: 'f1shes', password_confirmation: 'f1shes' )

alice = Student.create(name: 'Alice')
ben = Student.create(name: 'Ben')
clare = Student.create(name: 'Clare')
dave = Student.create(name: 'Dave')


apples = Group.create(name: 'Apples', teacher: toby)
apples.students << alice
apples.students << ben
apples.students << clare
apples.students << dave
apples.save!

Indicator.create(:level => 1, :key => "MA1_PROBLEM",
  :name => "use mathematics as an integral part of classroom activities",
  :description => "with support
  _ engage with practical mathematical activities involving sorting, counting and measuring by direct comparison
  _ begin to understand the relevance of mathematical ideas to everyday situations by using them in role play")

Indicator.create(:level => 1, :key => "MA1_COMMUNICATING", :position => 1,
  :name => "represent their work with objects or pictures ",
  :description => "")

Indicator.create(:level => 1, :key => "MA1_COMMUNICATING", :position => 2,
  :name => "discuss their work",
  :description => "with support
  _ respond to questions and ideas from peers and adults
  _ refer to the materials they have used and talk about what they have done, patterns they have noticed, etc")

Indicator.create(:level => 1, :key => "MA1_REASONING", :position => 1,
  :name => "draw simple conclusions from their work e.g. with support",
  :description => "_ describe the different ways they have sorted objects, what is the same about objects in a set, how sets differ
  _ Identify which set has most, which object is biggest, smallest, tallest etc
  _ Explain numbers and calculations, how many altogether, how many used or hidden, how many left, how many each, etc.")

Indicator.create(:level => 1, :key => "MA1_REASONING", :position => 1,
  :name => "recognise and use a simple pattern or relationship",
  :description => "_ copy and continue a simple pattern of objects, shapes or numbers")

Indicator.create(:level => 1, :key => "MA2_NUMBERS", :position => 1,
  :name => "count up to 10 objects",
  :description => "_ estimate and check a number")

 Indicator.create(:level => 1, :key => "MA2_NUMBERS", :position => 2,
  :name => "read, write numbers to 10",
  :description => "_ perhaps with some reversal")

Indicator.create(:level => 1, :key => "MA2_NUMBERS", :position => 3  ,
  :name => "order numbers to 10",
  :description => "_ say what number comes next, is one more / less
    _ count back to zero
    _ place 1 to 10 into ascending order
    _ point to first, second.. etc in a line
    _ begin to count in twos")

Indicator.create(:level => 1, :key => "MA2_FRACTIONS", :position => 1,
  :name => "begin to use the fraction, one-half",
  :description => "_ halve shapes including folding paper shapes, lengths of string
  _ put water in a clear container so that it is about 'half-full'
  _ halve an even number of objects")

Indicator.create(:level => 1, :key => "MA2A_OPERATIONS", :position => 1,
  :name => "understand addition as finding the total of two or more sets of objects",
  :description => "")

Indicator.create(:level => 1, :key => "MA2A_OPERATIONS", :position => 2,
  :name => "understand subtraction as 'taking away' objects from a set and finding how many are left",
  :description => "")

Indicator.create(:level => 1, :key => "MA2A_MENTAL_METHODS", :position => 1,
  :name => "add and subtract numbers of objects to 10",
  :description => "-begin to add by counting on
   from the number of objects in
   the first set")

Indicator.create(:level => 1, :key => "MA2A_MENTAL_METHODS", :position => 2,
  :name => "begin to know some addition facts",
  :description => "_ doubles of numbers to double 5")

Indicator.create(:level => 1, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 1,
  :name => "solve addition / subtraction problems involving up to 10 objects",
  :description => "_ given a number work out 'how many more to make'
  _ choose which of given pairs of numbers add to a given total
  _ solve measuring problems such as how many balance with
  _ solve problems involving 1p or &pound;1 coins")

Indicator.create(:level => 1, :key => "MA2A_WRITTEN_METHODS", :position => 1,
  :name => "record their work",
  :description => "_ record their work with objects, pictures or diagrams
  _ begin to use the symbols '+' and   '=' to record additions")

Indicator.create(:level => 1, :key => "MA3_SHAPES", :position => 1,
  :name => "use everyday language to describe properties of 2-D and 3-D shapes,",
  :description => "_ sort shapes and say how they have selected them
  _ use properties such as large, small, triangles, roll, stack
  _ begin to refer to some features of shapes such as side and corner
  _ begin to name the shapes they use in the context of an activity")

Indicator.create(:level => 1, :key => "MA3_POSITION_MOVEMENT", :position => 1,
  :name => "use everyday language to describe positions of 2-D and 3-D shapes",
  :description => "_ respond to and use positional language e.g. 'behind', 'under', 'on top of', 'next to', 'in between'
    _ respond to and use directional language in talk about objects and movement e.g. 'forwards\", 'backwards\", 'turn'")

Indicator.create(:level => 1, :key => "MA3A_MEASURES", :position => 1,
  :name => "measure and order objects using direct comparison",
  :description => "_ compare lengths directly and put them  in order
  _ respond to and use the language of comparison; longer, longest, shorter, shortest, more, less, heavier, lighter
  _ check which of two objects is heavier/lighter and begin to put three objects into order
  _ find objects that are longer/shorter than a metre, heavier/lighter than 500 grams, hold more/less than 1 litre")

Indicator.create(:level => 1, :key => "MA3A_MEASURES", :position => 2,
  :name => "order events",
  :description => "_ order everyday events and describe the sequence
  _ use the vocabulary of time including days of the week
  _ read the time on an analogue clock at the hour and begin to know the half hour")

Indicator.create(:level => 1, :key => "MA4_PROCESSING", :position => 1,
  :name => "sort and classify objects",
  :description => "_ sort using one criterion or sort into disjoint sets using two simple criteria such as boy / girl or thick / thin
  _ sort objects again using a different criterion
  _ sort objects into a given large scale Venn or Carroll diagram")

Indicator.create(:level => 1, :key => "MA4_PROCESSING", :position => 2,
  :name => "present their work",
  :description => "_ use the objects they have sorted as a record
  _ use objects/pictures to create simple block graphs")

Indicator.create(:level => 1, :key => "MA4_INTERPRETING", :position => 1,
  :name => "demonstrate the criterion they have used",
  :description => "_ respond to questions about how they have sorted objects and why each object belongs in a set
  _ talk about which set has most, for example 'most children stayed at school for lunch'
  _ talk about how they have represented their work")

Indicator.create(:level => 2, :key => "MA1_PROBLEM", :position => 1,
  :name => "select the mathematics they use in some classroom activities",
  :description => "with support
  _ find a starting point, identifying key facts / relevant information
  _ use apparatus, diagrams, role play etc to represent and clarify a problem
  _ move between different representations of a problem e.g. a situation described in words, a diagram etc.
  _ adopt a suggested model or systematic approach
  _ make connections and apply their knowledge to similar situations
  _ use mathematical content from levels 1 and 2 to solve problems and investigate")

Indicator.create(:level => 2, :key => "MA1_COMMUNICATING", :position => 1,
  :name => "discuss their work using mathematical language",
  :description => "with support
  _ describe the strategies and methods they use in their work
  _ engage with others' explanations, compare.evaluate")

Indicator.create(:level => 2, :key => "MA1_COMMUNICATING", :position => 2,
  :name => "begin to represent their work using symbols and simple diagrams",
  :description => "with support
  _ use pictures, diagrams and symbols to communicate their thinking, or demonstrate a solution or process
  _ begin to appreciate the need to record and develop their own methods of recording")

Indicator.create(:level => 2, :key => "MA1_REASONING", :position => 1,
  :name => "explain why an answer is correct",
  :description => "with support
  _ test a statement such as, 'The number twelve ends with a 2 so 12 sweets can be shared equally by 2  children'")

Indicator.create(:level => 2, :key => "MA1_REASONING", :position => 2,
  :name => "predict what comes next in a simple number, shape or spatial pattern or sequence and give reasons for their opinions",
  :description => "")

Indicator.create(:level => 2, :key => "MA2_NUMBERS", :position => 1,
  :name => "count sets of objects reliably",
  :description => "_ group objects in tens, twos or fives to count them")

Indicator.create(:level => 2, :key => "MA2_NUMBERS", :position => 2,
  :name => "begin to understand the place value of each digit, use this to order numbers up to 100",
  :description => "_ know the relative size of numbers to 100
  _ use 0 as a place holder
  _ demonstrate knowledge using a range of models/images")

Indicator.create(:level => 2, :key => "MA2_NUMBERS", :position => 3,
  :name => "recognise sequences of numbers, including odd and even numbers",
  :description => "_ continue a sequence that increases or decreases in regular steps
  _ recognise numbers from counting in tens or twos")

Indicator.create(:level => 2, :key => "MA2_FRACTIONS", :position => 1,
  :name => "begin to use halves and quarters",
  :description => " _ use the concept of a fraction of a small quantity in a practical context such as sharing sweets between two and getting _ each , among four and getting _ each
    _ work out halves of numbers up to 20 and beginning to recall them")

Indicator.create(:level => 2, :key => "MA2_FRACTIONS", :position => 2,
  :name => "relate the concept of half of a small quantity to the concept of half of a shape",
  :description => "shade one half or one quarter of a given shape including those divided into equal regions")

Indicator.create(:level => 2, :key => "MA2A_OPERATIONS", :position => 1,
  :name => "use the knowledge that subtraction is the inverse of addition",
  :description => "-begin to understand subtraction as 'difference'
  -given 14, 6 and 8, make related number sentences
  6 + 8 = 14, 14 &#45 8 = 6,
  8 + 6 = 14, 14  &#45 6 = 8")

Indicator.create(:level => 2, :key => "MA2A_OPERATIONS", :position => 2,
  :name => "understand halving as a way of 'undoing' doubling and vice versa",
  :description => "")

Indicator.create(:level => 2, :key => "MA2A_MENTAL_METHODS", :position => 1,
  :name => "use mental recall of addition and subtraction facts to 10",
  :description => "_ use addition/subtraction facts to 10 and place value to add or subtract multiples of 10 e.g. know 3 +  7 = 10 and use place value to derive 30 + 70 = 100.")

Indicator.create(:level => 2, :key => "MA2A_MENTAL_METHODS", :position => 2,
  :name => "use mental calculation strategies to solve number problems including those involving money and measures",
  :description => "_ recall doubles to 10+10 and other significant doubles e.g. double 50p is 100p or &pound;1
  _ use knowledge of doubles to 10 + 10 to derive corresponding halves")

Indicator.create(:level => 2, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 1,
  :name => "choose the appropriate operation when solving addition and subtraction problems",
  :description => "_ use repeated addition to solve multiplication problems
  _ begin to use repeated subtraction or sharing equally to solve division problems")

Indicator.create(:level => 2, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 2,
  :name => "solve number problems involving money and measures",
  :description => "_ add/subtract two-digit and one-digit numbers, bridging tens where necessary in contexts using units such as pence, pounds, centimetres")

Indicator.create(:level => 2, :key => "MA2A_WRITTEN_METHODS", :position => 1,
  :name => "record their work in writing",
  :description => "_ record their mental calculations as number sentences")

Indicator.create(:level => 2, :key => "MA3_SHAPES", :position => 1,
  :name => "use mathematical names for common 3-D and 2-D shapes",
  :description => "_ identify 2-D and 3-D shapes from pictures of them in different orientations, e.g. square, triangle, hexagon, pentagon, octagon, cube, cylinder, sphere, cuboid, pyramid")

Indicator.create(:level => 2, :key => "MA3_SHAPES", :position => 2,
  :name => "describe their properties, including numbers of sides and corners",
  :description => "_ make and talk about shapes referring to features and properties using language such as edge, face, corner
  _ sort 2-D and 3-D shapes according to a single criterion e.g. shapes that are pentagons or shapes with a right angle
  _ visualise frequently used 2-D and 3-D shapes
  _ begin to understand the difference between shapes with two dimensions and those with three
  _ recognise the properties that are the same even when a shape is enlarged e.g. when comparing squares, circles, similar triangles, cubes or spheres of different sizes")

Indicator.create(:level => 2, :key => "MA3_POSITION_MOVEMENT", :position => 1,
  :name => "describe the position of objects",
  :description => "_ use ordinal numbers (first, second, third) to describe the position of objects in a row or when giving directions
  _ recognise and explain that a shape stays the same even when it is held up in different orientations")

Indicator.create(:level => 2, :key => "MA3_POSITION_MOVEMENT", :position => 2,
  :name => "distinguish between straight and turning movements",
  :description => "_ distinguish between left and right and between clockwise and anticlockwise and use these when giving directions
  _ instruct a programmable robot, combining straight-line movements and turns, to move along a defined path or reach a target destination")

Indicator.create(:level => 2, :key => "MA3_POSITION_MOVEMENT", :position => 3,
  :name => "recognise right angles in turns",
  :description => "")

Indicator.create(:level => 2, :key => "MA3A_MEASURES", :position => 1,
  :name => "understand angle as a measurement of turn",
  :description => "_ make whole turns, half-turns and quarter-turns")

Indicator.create(:level => 2, :key => "MA3A_MEASURES", :position => 2,
  :name => "begin to use everyday non-standard and standard units to measure length and mass",
  :description => "_ begin to understand that numbers can be used not only to count discrete objects but also to describe continuous measures e.g. length
  _ know which measuring tools to use to find, for example, how much an object weighs, how tall a child is, how long it takes to run around the edge of the playground, how much water it takes to fill the water tray
  _ read scales to the nearest labelled division
  _ begin to make sensible estimates in relation to familiar units")

Indicator.create(:level => 2, :key => "MA3A_MEASURES", :position => 3,
  :name => "begin to use a wider range of measures",
  :description => "_ make and use a 'right angle checker'
  _ use a time line to order daily events and ordinal numbers (first, second, third) to describe the order of some regular events")

Indicator.create(:level => 2, :key => "MA4_PROCESSING", :position => 1,
  :name => "sort objects and classify them using more than one criterion",
  :description => "_ sort a given set of shapes using two criteria such as triangle / not triangle and blue / not blue")

Indicator.create(:level => 2, :key => "MA4_PROCESSING", :position => 2,
  :name => "understand vocabulary relating to handling data",
  :description => "_ understand vocabulary such as sort, group, set, list, table, most common, most popular")

Indicator.create(:level => 2, :key => "MA4_PROCESSING", :position => 3,
  :name => "collect and sort data to test a simple hypothesis",
  :description => "_ count a show of hands to test the hypothesis 'most children in our class are in bed by 7.30pm'")

Indicator.create(:level => 2, :key => "MA4_PROCESSING", :position => 4,
  :name => "record results in simple lists, tables, pictograms and block graphs",
  :description => "_ present information in lists, tables and simple graphs where one symbol or block represents one unit
  _ enter data into a simple computer database")

Indicator.create(:level => 2, :key => "MA4_INTERPRETING", :position => 1,
  :name => "communicate their findings, using the simple lists, tables, pictograms and block graphs they have recorded",
  :description => "_ respond to questions about the data they have presented, e.g. how many of our names have 5 letters?
  _ pose similar questions about their data for others to answer")

Indicator.create(:level => 3, :key => "MA1_PROBLEM", :position => 1,
  :name => "select the mathematics they use in a wider range of classroom activities",
  :description => "_ use classroom discussions to break into a problem, recognising similarities to previous work
  _ put the  problem into their own words
  _ use mathematical content from levels 2 and 3
  _ choose their own equipment appropriate to the task, including calculators")

Indicator.create(:level => 3, :key => "MA1_PROBLEM", :position => 2,
  :name => "try different approaches and find ways of overcoming difficulties that arise when they are solving problems",
  :description => "_ check their work and make appropriate corrections, for example decide that two numbers less than 100 cannot give a total more than 200 and correct the addition
  _ begin to look for patterns in results as they work and use them to find other possible  outcomes")

Indicator.create(:level => 3, :key => "MA1_COMMUNICATING", :position => 1,
  :name => "begin to organise their work and check results",
  :description => "_ begin to develop own ways of recording
  _ develop an organised approach as they get into recording their work on a problem")

Indicator.create(:level => 3, :key => "MA1_COMMUNICATING", :position => 2,
  :name => "discuss their mathematical work and begin to explain their thinking",
  :description => "_ use appropriate mathematical  vocabulary
  _ talk about their findings by referring to their written work")

Indicator.create(:level => 3, :key => "MA1_COMMUNICATING", :position => 3,
  :name => "use and interpret mathematical symbols and diagrams",
  :description => "")

Indicator.create(:level => 3, :key => "MA1_REASONING", :position => 1,
  :name => "understand a general statement by finding particular examples that match it",
  :description => "_ make a generalisation with the assistance of probing questions and prompts")

Indicator.create(:level => 3, :key => "MA1_REASONING", :position => 2,
  :name => "review their work and reasoning",
  :description => "_ respond to 'What if?' questions
  _ when they have solved a problem, pose a similar problem for a partner")

Indicator.create(:level => 3, :key => "MA2_NUMBERS", :position => 1,
  :name => "understand place value in numbers to 1000",
  :description => "_ represent / compare numbers using number lines, 100-squares, base 10 materials etc
  _ recognise that some numbers can be represented as different arrays
  _ use understanding of place value to multiply/ divide whole numbers by 10 (whole number answers)")

Indicator.create(:level => 3, :key => "MA2_NUMBERS", :position => 2,
  :name => "use place value to make approximations",
  :description => "")

Indicator.create(:level => 3, :key => "MA2_NUMBERS", :position => 3,
  :name => "recognise negative numbers in contexts such as temperature",
  :description => "")

Indicator.create(:level => 3, :key => "MA2_NUMBERS", :position => 4,
  :name => "recognise a wider range of sequences",
  :description => "_ recognise sequences of multiples of 2, 5 and 10")

Indicator.create(:level => 3, :key => "MA2_FRACTIONS", :position => 1,
  :name => "use simple fractions that are several parts of a whole and recognise when two simple fractions are equivalent",
  :description => "_ understand and use unit fractions such as 1/2, 1/4, 1/3, 1/5, 1/10 and find those fractions of shapes and sets of objects
  _ recognise and record fractions that are several parts of the whole such as 3/4, 2/5
  _ recognise some fractions  that are equivalent to 1/2")

Indicator.create(:level => 3, :key => "MA2_FRACTIONS", :position => 2,
  :name => "begin to use decimal notation in contexts such as money",
  :description => "_ order decimals with one dp, or two dp in context of money
  _ know that &pound;3.06 equals 306p")

Indicator.create(:level => 3, :key => "MA2A_OPERATIONS", :position => 1,
  :name => "derive associated division facts from known multiplication facts",
  :description => "_ given a number sentence, use understanding of operations to create related sentences, e.g. given 14 &times; 5 = 70, create 5 &times; 14 = 70, 70 &divide; 5 = 14, 70 &divide; 14 = 5, 14 &times; 5 = 10 &times; 5 add 4 &times; 5
  _ use inverses to find missing whole numbers in problems such as, 'I think of number, double it and add 5. The answer is 35. What was my number?'")

Indicator.create(:level => 3, :key => "MA2A_OPERATIONS", :position => 2,
  :name => "begin to understand the role of '=' , the 'equals' sign",
  :description => "")

Indicator.create(:level => 3, :key => "MA2A_MENTAL_METHODS", :position => 1,
  :name => "add and subtract 2-digit numbers mentally",
  :description => "_ calculate 36 + 19, 63 - 26, and complements to 100 such as 100 - 24")

Indicator.create(:level => 3, :key => "MA2A_MENTAL_METHODS", :position => 2,
  :name => "use mental recall of the 2, 3, 4, 5 and 10 multiplication tables",
  :description => "_ multiply a 2-digit number by 2, 3, 4 or 5
  _ understand finding a quarter of a number of objects as halving the number and halving again.
  _ begin to know multiplication facts for 6, 8, 9 and 7&times; tables")

Indicator.create(:level => 3, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 1,
  :name => "use mental recall of addition and subtraction facts to 20 in solving problems involving larger numbers",
  :description => "_ choose to  calculate mentally, on paper or with apparatus
  _ solve one-step whole number problems appropriately
  _ solve two-step problems that involve addition and subtraction")

Indicator.create(:level => 3, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 2,
  :name => "solve whole number problems including those involving multiplication or division that may give rise to remainders",
  :description => "_ identify appropriate operations to use
  _ round up or down after simple division, depending on context")

Indicator.create(:level => 3, :key => "MA2A_WRITTEN_METHODS", :position => 1,
  :name => "add and subtract 3-digit numbers using written method",
  :description => "_ use written methods that involve bridging 10 or 100
  _ add and subtract decimals in the context of money, where bridging is not required")

Indicator.create(:level => 3, :key => "MA2A_WRITTEN_METHODS", :position => 2,
  :name => "multiply and divide 2-digit numbers by 2, 3, 4 or 5 as well as 10 with whole number answers and remainders",
  :description => "_ calculate 49 &divide; 3")

Indicator.create(:level => 3, :key => "MA3_SHAPES", :position => 1,
  :name => "classify 3-D and 2-D shapes in various ways using mathematical properties such as reflective symmetry for 2-D shapes",
  :description => "_ sort objects and shapes using more than one criterion, e.g. pentagon, not pentagon and all edges the same length/not the same length
  _ sort the shapes which have all edges the same length and all angles the same size from a set of mixed shapes and begin to understand the terms 'regular' and 'irregular'
  _ recognise right angles in shapes in different orientations
  _ recognise angles which are bigger/smaller than 90&deg; and begin to know the terms 'obtuse' and 'acute'
  _ recognise right angled and equilateral triangles
  _ demonstrate that a shape has reflection symmetry by folding and recognise when a shape does not have a line of symmetry
  _ recognise common 3-D shapes e.g. triangular prism, square-based pyramid
  _ relate 3-D shapes to drawings and photographs of them, including from different viewpoints")

Indicator.create(:level => 3, :key => "MA3_SHAPES", :position => 2,
  :name => "begin to recognise nets of familiar 3-D shapes e.g. cube, cuboid, triangular prism, square-based pyramid",
  :description => "")

Indicator.create(:level => 3, :key => "MA3_POSITION_MOVEMENT", :position => 1,
  :name => "recognise shapes in different orientations",
  :description => "")

Indicator.create(:level => 3, :key => "MA3_POSITION_MOVEMENT", :position => 2,
  :name => "reflect shapes, presented on a grid, in a vertical or horizontal mirror line",
  :description => "_ reflect a shape even if the shape is at 45&deg; to the mirror line, touching the line or not
  _ begin to reflect simple shapes in a mirror line presented at 45&deg;")

Indicator.create(:level => 3, :key => "MA3_POSITION_MOVEMENT", :position => 3,
  :name => "describe position and movement",
  :description => "_ use terms such as left/right, clockwise/anticlockwise, quarter turn/90&deg; to give directions along a route")

Indicator.create(:level => 3, :key => "MA3A_MEASURES", :position => 1,
  :name => "use non-standard units and standard metric units of length, capacity and mass in a range of contexts",
  :description => "_ measure a length to the nearest _ cm
  _ read simple scales, e.g.  increments of 2, 5 or 10")

Indicator.create(:level => 3, :key => "MA3A_MEASURES", :position => 2,
  :name => "use standard units of time",
  :description => "_ read a 12-hour clock and generally calculate time durations that do not go over the hour")

Indicator.create(:level => 3, :key => "MA3A_MEASURES", :position => 3,
  :name => "use a wider range of measures",
  :description => "_ begin to understand area as a measure of surface and perimeter as a measure of length.
  _ begin to find areas of shapes by counting squares and explain answers as a number of squares even if not using standard units such as cm2 or m2
  _ recognise angles as a measure of turn and know that one whole turn is 360 degrees")

Indicator.create(:level => 3, :key => "MA4_PROCESSING", :position => 1,
  :name => "gather information",
  :description => "_ decide what data to collect to answer a question e.g. what is the most common way to travel to school
  _ make appropriate choices for recording data, e.g. a tally chart or  frequency table")

Indicator.create(:level => 3, :key => "MA4_PROCESSING", :position => 2,
  :name => "construct bar charts and pictograms, where the symbol represents a group of units",
  :description => "_ decide how best to represent data, for example whether a bar chart, Venn diagram or pictogram would show the information most clearly
  _ decide upon an appropriate scale for a graph, for example labelled divisions of 2, or, for a pictogram, one symbol to represent 2 or 5")

Indicator.create(:level => 3, :key => "MA4_PROCESSING", :position => 3,
  :name => "use Venn and Carroll diagrams to record their sorting and classifying of information",
  :description => "_ represent sorting using one or two criteria typical of level 2 and 3 mathematics e.g. shapes sorted using properties such as right angles and equal sides")

Indicator.create(:level => 3, :key => "MA4_INTERPRETING", :position => 1,
  :name => "extract and interpret information presented in simple tables lists, bar charts and pictograms",
  :description => "_ use a key to interpret represented data
  _ read scales labelled in twos, fives and tens, including reading between labelled divisions such as a point halfway between 40 and 50 or 8 and 10
  _ compare data e.g. say how many more than and recognise the category that has most/least.
  _ respond to questions of a more complex nature such as 'How many children took part in this survey altogether?' or 'How would the data differ if we asked the children in year 6?'
  _ in the context of data relating to everyday situations, understand  the idea  of 'certain' and 'impossible' relating to probability")

Indicator.create(:level => 4, :key => "MA1_PROBLEM", :position => 1,
  :name => "developing own strategies for solving problems",
  :description => "_ make their own suggestions of ways to tackle a range of problems
  _ make connections to previous work
  _ pose and answer questions related to a problem
  _ check answers and ensure solutions make sense in the context of the problem
  _ review their work and approaches")

Indicator.create(:level => 4, :key => "MA1_PROBLEM", :position => 2,
  :name => "use their own strategies within mathematics and in applying mathematics to practical context",
  :description => "_ use mathematical content from levels 3 and 4 to solve problems and investigate")

Indicator.create(:level => 4, :key => "MA1_COMMUNICATING", :position => 1,
  :name => "present information and results in a clear and organised way",
  :description => "_ organise written work, for example record results in order.
  _ begin to work in an organised way from the start
  _ consider appropriate units
  _ use related vocabulary accurately")

Indicator.create(:level => 4, :key => "MA1_REASONING", :position => 1,
  :name => "search for a solution by trying out ideas of their own",
  :description => "_ check their methods and justify answers
  _ identify patterns as they work and form their own generalisations / rules in words")

Indicator.create(:level => 4, :key => "MA2_NUMBERS", :position => 1,
  :name => "recognise and describe number patterns",
  :description => "_ continue sequences involving decimals")

Indicator.create(:level => 4, :key => "MA2_NUMBERS", :position => 2,
  :name => "recognise and describe number relationships including multiple, factor and square",
  :description => "")

Indicator.create(:level => 4, :key => "MA2_NUMBERS", :position => 3,
  :name => "use place value to multiply and divide whole numbers by 10 or 100",
  :description => "")

Indicator.create(:level => 4, :key => "MA2_FRACTIONS", :position => 1,
  :name => "recognise approximate proportions of a whole and use simple fractions and percentages to describe these",
  :description => "_ recognise simple equivalence between fractions, decimals and percentages e.g. 1/2, 1/4, 1/10, 3/4
  _ convert mixed numbers to improper fractions and vice versa")

Indicator.create(:level => 4, :key => "MA2_FRACTIONS", :position => 2,
  :name => "order decimals to three decimal places",
  :description => "")

Indicator.create(:level => 4, :key => "MA2_FRACTIONS", :position => 3,
  :name => "begin to understand simple ratio",
  :description => "")

Indicator.create(:level => 4, :key => "MA2A_OPERATIONS", :position => 1,
  :name => "use inverse operations",
  :description => "_ use a calculator and inverse operations  to find missing numbers, including decimals
  _ 'undo' two-step problems
  _ understand 'balancing sums' including those using division, such as 20 + &ecirc; = 100 &divide; 4")

Indicator.create(:level => 4, :key => "MA2A_OPERATIONS", :position => 2,
  :name => "understand the use of brackets in simple calculations",
  :description => "")

Indicator.create(:level => 4, :key => "MA2A_OPERATIONS", :position => 3,
  :name => "quickly derive division facts that correspond to multiplication facts up to 10 &times; 10",
  :description => "")

Indicator.create(:level => 4, :key => "MA2A_MENTAL_METHODS", :position => 1,
  :name => "use a range of mental methods of computation with the four operations",
  :description => "_ calculate complements to 1000")

Indicator.create(:level => 4, :key => "MA2A_MENTAL_METHODS", :position => 2,
  :name => "recall multiplication facts up to 10 and quickly derive corresponding division facts",
  :description => "_ use their knowledge of tables and place value in calculations with multiples of 10 such as 30 _ 7 , 180 &divide; 3")

Indicator.create(:level => 4, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 1,
  :name => "solve problems with or without a calculator",
  :description => "_ solve two-step problems choosing appropriate operations
  _ deal with two constraints simultaneously
  _  interpret a calculator display of 4.5 as &pound;4.50 in context of money
  _ carry out simple calculations involving negative numbers in context")

Indicator.create(:level => 4, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 2,
  :name => "check the reasonableness of results with reference to the context or size of numbers",
  :description => "")

Indicator.create(:level => 4, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 3,
  :name => "begin to use simple formulae expressed in words",
  :description => "")

Indicator.create(:level => 4, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 4,
  :name => "use and interpret coordinates in the first quadrant",
  :description => "")

Indicator.create(:level => 4, :key => "MA2A_WRITTEN_METHODS", :position => 1,
  :name => "use efficient written methods of addition and subtraction and of short multiplication and division",
  :description => "_ calculate 1202 + 45 + 367 or 1025 - 336")

Indicator.create(:level => 4, :key => "MA2A_WRITTEN_METHODS", :position => 2,
  :name => "add and subtract decimals to two places ",
  :description => "")

Indicator.create(:level => 4, :key => "MA2A_WRITTEN_METHODS", :position => 3,
  :name => "multiply a simple decimal by a single digit",
  :description => "_ calculate 36.2 &times; 8")

Indicator.create(:level => 4, :key => "MA3_SHAPES", :position => 1,
  :name => "use the properties of 2-D and 3-D shapes",
  :description => "_ recognise and name most quadrilaterals e.g. trapezium, parallelogram, rhombus
  _ recognise right-angled, equilateral, isosceles and scalene triangles
  _ recognise an oblique line of symmetry in a shape
  _ use mathematical terms such as horizontal, vertical, congruent (same size, same shape)
  _ understand properties of shapes, e.g. why a square is a special rectangle
  _ visualise shapes and recognise them in different orientation")

Indicator.create(:level => 4, :key => "MA3_SHAPES", :position => 2,
  :name => "make 3-D models by linking given faces or edges",
  :description => "")

Indicator.create(:level => 4, :key => "MA3_POSITION_MOVEMENT", :position => 1,
  :name => "draw common 2-D shapes in different orientations on grids",
  :description => "_ complete a rectangle which has 2 sides drawn at an oblique angle to the grid")

Indicator.create(:level => 4, :key => "MA3_POSITION_MOVEMENT", :position => 2,
  :name => "reflect simple shapes in a mirror line",
  :description => "_ use a grid to plot the reflection in a mirror line presented at 45&degrees; where the shape touches the line or not
  _ begin to use the distance of vertices from the mirror line to reflect shapes more accurately")

Indicator.create(:level => 4, :key => "MA3_POSITION_MOVEMENT", :position => 3,
  :name => "begin to rotate a simple shape or object about its centre or a vertex",
  :description => "")

Indicator.create(:level => 4, :key => "MA3_POSITION_MOVEMENT", :position => 4,
  :name => "translate shapes horizontally or vertically",
  :description => "")

Indicator.create(:level => 4, :key => "MA3A_MEASURES", :position => 1,
  :name => "choose and use appropriate units and instruments",
  :description => "")

Indicator.create(:level => 4, :key => "MA3A_MEASURES", :position => 2,
  :name => "interpret, with appropriate accuracy, numbers on a range of measuring instruments",
  :description => "_ measure a length using mm, to within 2mm
  _ measure and draw acute and obtuse angles to the nearest 5&degrees;, when one edge is horizontal /vertical")

Indicator.create(:level => 4, :key => "MA3A_MEASURES", :position => 3,
  :name => "find perimeters of simple shapes and find areas by counting squares",
  :description => "_ use the terms area and perimeter accurately and consistently
  _ find areas by counting squares and part squares
  _ begin to find the area of shapes that need to be divided into rectangles
  _ use 'number of squares in a row times number of rows' to find the area of a rectangle")

Indicator.create(:level => 4, :key => "MA3A_MEASURES", :position => 4,
  :name => "use units of time",
  :description => "_ calculate time durations that go over the hour.
  _ read and interpret timetables.")

Indicator.create(:level => 4, :key => "MA4_PLANNING", :position => 1,
  :name => "collect discrete data",
  :description => "_ given a problem, suggest possible answers and data to collect
  _ test a hypothesis about the frequency of an event by collecting data, for example collect dice scores to test ideas about how many scores of 6 will occur during 50 throws of a dice")

Indicator.create(:level => 4, :key => "MA4_PLANNING", :position => 2,
  :name => "group data, where appropriate, in equal class intervals",
  :description => "_ decide on a suitable class interval when collecting or representing data about pupils' hours per week spent watching television")

Indicator.create(:level => 4, :key => "MA4_PLANNING", :position => 3,
  :name => "record discrete data using a frequency table",
  :description => "")

Indicator.create(:level => 4, :key => "MA4_PROCESSING", :position => 1,
  :name => "represent collected data in frequency diagrams",
  :description => "_ suggest an appropriate frequency diagram to represent particular data, for example decide whether a bar chart, Venn diagram or pictogram would be most appropriately and for pictograms use one symbol to represent, e.g. 2, 5, 10 or 100")

Indicator.create(:level => 4, :key => "MA4_PROCESSING", :position => 2,
  :name => "construct simple line graphs",
  :description => "_ decide upon an appropriate scale for a graph e.g. labelled divisions representing 2, 5, 10, 100")

Indicator.create(:level => 4, :key => "MA4_PROCESSING", :position => 3,
  :name => "continue to use Venn and Carroll diagrams to record their sorting and classifying of information",
  :description => "_ represent sorting using two criteria typical of level 3 and 4 mathematics such as sorting numbers using properties 'multiples of 8' and 'multiples of 6'")

Indicator.create(:level => 4, :key => "MA4_INTERPRETING", :position => 1,
  :name => "understand and use the mode and range to describe sets of data",
  :description => "_ use mode and range to describe data relating to shoe sizes in their class and begin to compare their data with data from another class")

Indicator.create(:level => 4, :key => "MA4_INTERPRETING", :position => 2,
  :name => "interpret frequency diagrams and simple line graphs",
  :description => "_ interpret simple pie charts
  _ interpret the scale on bar graphs and line graphs, reading between the labelled divisions e.g. reading 17 on a scale labelled in fives
  _ interpret the total amount of data represented
  _ compare data sets and respond to questions e.g. how does our data about favourite televisions programmes compare to the data from year 3 children?
  _ in the context of data relating to everyday situations, understand the language of probability such as 'more likely, equally likely, fair, unfair, certain'")

Indicator.create(:level => 5, :key => "MA1_PROBLEM", :position => 1,
  :name => "identify and obtain necessary information to carry through a task and solve mathematical problems",
  :description => "_ recognise information that is important to solving the problem, determine what is missing and develop lines of enquiry
  _ break a several-step problem or investigation into simpler steps
  _ consider efficient methods, relating problems to previous experiences")

Indicator.create(:level => 5, :key => "MA1_PROBLEM", :position => 1,
  :name => "check results, considering whether these are reasonable",
  :description => "_ check as they work, spotting and correcting errors and reviewing methods")

Indicator.create(:level => 5, :key => "MA1_PROBLEM", :position => 1,
  :name => "solve word problems and investigations from a range of contexts",
  :description => "_ use mathematical content from levels 4 and 5 to solve problems and investigate")

Indicator.create(:level => 5, :key => "MA1_COMMUNICATING", :position => 1,
  :name => "show understanding of situations by describing them mathematically using symbols, words and diagrams",
  :description => "_ organise their work from the outset, looking for ways to record systematically
  _ decide how best to represent conclusions, using appropriate recording
  _ begin to understand and use formulae and symbols to represent problems")

Indicator.create(:level => 5, :key => "MA1_REASONING", :position => 1,
  :name => "draw simple conclusions of their own and give an explanation of their reasoning",
  :description => "_ explain and justify their methods and solution
  _ identify more complex patterns, making generalisations in words and begin to express generalisations using symbolic notation
  _ use examples and counter examples to justify conclusions")

Indicator.create(:level => 5, :key => "MA2_NUMBERS", :position => 1,
  :name => "use understanding of place value to multiply and divide whole numbers and decimals by 10, 100 and 1000 and explain the effect",
  :description => "")

Indicator.create(:level => 5, :key => "MA2_NUMBERS", :position => 2,
  :name => "round decimals to the nearest decimal place",
  :description => "")

Indicator.create(:level => 5, :key => "MA2_NUMBERS", :position => 3,
  :name => "order negative numbers in context",
  :description => "")

Indicator.create(:level => 5, :key => "MA2_NUMBERS", :position => 4,
  :name => "recognise and use number patterns and relationships",
  :description => "_ find two-digit prime numbers
  _ make generalisations about sequences saying whether much larger numbers will be in the sequence or not")

Indicator.create(:level => 5, :key => "MA2_FRACTIONS", :position => 1,
  :name => "use equivalence between fractions",
  :description => "_ convert fractions such as 2/5  into tenths or hundredths and express them as decimals or percentages and vice versa")

Indicator.create(:level => 5, :key => "MA2_FRACTIONS", :position => 2,
  :name => "reduce a fraction to its simplest form by cancelling common factors",
  :description => "")

Indicator.create(:level => 5, :key => "MA2_FRACTIONS", :position => 3,
  :name => "order fractions and decimals",
  :description => "_ order fractions with different denominators
  _ order decimals that have a mixture of 1, 2 or 3 decimal places")

Indicator.create(:level => 5, :key => "MA2_FRACTIONS", :position => 4,
  :name => "understand simple ratio",
  :description => "")

Indicator.create(:level => 5, :key => "MA2A_OPERATIONS", :position => 1,
  :name => "use known facts, place value and knowledge of operations to calculate",
  :description => "_ calculate decimal complements to 10 or 100, such as 100 _ 63.8
  _ multiply a two-digit number by a single digit e.g. 39 _ 7
  _ calculate simple fractions or percentages of a number/quantity e.g. _ of 400g or 60&percent; of &pound;300")

Indicator.create(:level => 5, :key => "MA2A_OPERATIONS", :position => 2,
  :name => "apply inverse operations",
  :description => "")

Indicator.create(:level => 5, :key => "MA2A_OPERATIONS", :position => 3,
  :name => "use brackets appropriately",
  :description => "_ know and use the order of operations, including brackets")

Indicator.create(:level => 5, :key => "MA2A_MENTAL_METHODS", :position => 1,
  :name => "add and subtract negative numbers in context",
  :description => "")

Indicator.create(:level => 5, :key => "MA2A_MENTAL_METHODS", :position => 21,
  :name => "estimate using approximations",
  :description => "")

Indicator.create(:level => 5, :key => "MA2A_MENTAL_METHODS", :position => 3,
  :name => "use all four operations with decimals to two places",
  :description => "_ add and subtract numbers which do not have the same number of decimal places
  _ multiply or divide decimal numbers by a single digit e.g. 31.62 &divide; 7")

Indicator.create(:level => 5, :key => "MA2A_MENTAL_METHODS", :position => 4,
  :name => "use a calculator where appropriate to calculate fractions/percentages of quantities/measurements",
  :description => "_ find fractions of quantities such as 3/8 of 980
  _ find percentages such as 15&percent; of 360g")

Indicator.create(:level => 5, :key => "MA2A_MENTAL_METHODS", :position => 5,
  :name => "understand and use an appropriate non-calculator method for solving problems that involve multiplying and dividing any three-digit number by any two-digit number",
  :description => "")

Indicator.create(:level => 5, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 1,
  :name => "solve simple problems involving ordering, adding, subtracting negative numbers in context",
  :description => "")

Indicator.create(:level => 5, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 2,
  :name => "solve simple problems involving ratio and direct proportion",
  :description => "_ begin to use multiplication rather than trial and improvement to solve ratio problems")

Indicator.create(:level => 5, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 3,
  :name => "approximate to check answers to problems are of the correct magnitude",
  :description => "")

Indicator.create(:level => 5, :key => "MA2A_NUMERICAL_PROBLEMS", :position => 4,
  :name => "check solutions by applying inverse operations or estimating using approximations",
  :description => "")

Indicator.create(:level => 5, :key => "MA2A_WRITTEN_METHODS", :position => 1,
  :name => "construct, express in symbolic form, and use simple formulae involving one or two operations",
  :description => "_ understand simple expressions using symbols e.g. '2 less than n' can be written as 'n _ 2'
  _ evaluate expressions by substituting numbers into them
  _ use symbols to represent an unknown number or a variable")

Indicator.create(:level => 5, :key => "MA2A_WRITTEN_METHODS", :position => 2,
  :name => "use and interpret coordinates in all four quadrants",
  :description => "")

Indicator.create(:level => 5, :key => "MA3_SHAPES", :position => 1,
  :name => "use a wider range of properties of 2-D and 3-D shapes",
  :description => "_ understand 'parallel' and begin to understand 'perpendicular' in relation to edges or faces
  _ classify quadrilaterals, including trapezium and kite, using their properties e.g. number of parallel sides
  _ reason about special triangles and quadrilaterals e.g. given the perimeter and one side of an isosceles triangle, find both possible triangles
  _ draw a parallelogram or trapezium of a given area on a square grid
  _ given the coordinates of three vertices of a parallelogram, find the fourth")

Indicator.create(:level => 5, :key => "MA3_SHAPES", :position => 2,
  :name => "know and use the angle sum of a triangle and that of angles at a point",
  :description => "_ calculate 'missing angles' in triangles, including isosceles triangles or right angled triangles, when only one/one other angle is given
  _ calculate angles on a straight line or at a point such as the angle between the hands of a clock, or intersecting  diagonals at the centre of a regular hexagon")

Indicator.create(:level => 5, :key => "MA3_POSITION_MOVEMENT", :position => 1,
  :name => "identify all the symmetries of 2-D shapes",
  :description => "(for rotation symmetry see key stage 3 programme of study )
  _ find lines of reflection symmetry in shapes and diagrams
  _ recognise order of rotation symmetry")

Indicator.create(:level => 5, :key => "MA3_POSITION_MOVEMENT", :position => 2,
  :name => "transform shapes",
  :description => "_ reflect shapes in oblique (45&degrees;) mirror lines where the shape either does not touch the mirror line, or where the shape crosses the mirror line
  _ reflect shapes not presented on grids, by measuring perpendicular distances to/from the mirror
  _ reflect shapes in two mirror lines, where the shape is not parallel or perpendicular to either mirror
  _ rotate shapes, through 90&degrees; or 180&degrees;, when the centre of rotation is a vertex of the shape and recognise such rotations
  _ translate shapes along an oblique line")

Indicator.create(:level => 5, :key => "MA3_POSITION_MOVEMENT", :position => 3,
  :name => "reason about shapes, positions and movements",
  :description => "_ visualise a 3-D shape from its net and match vertices that will be joined
  _ visualise where patterns drawn on a 3-D shape will occur on its net e.g. when shown a cube with patterns drawn on two or three faces, create the net to make the cube
  _ draw shapes with a fixed number of lines of symmetry")

Indicator.create(:level => 5, :key => "MA3A_MEASURES", :position => 1,
  :name => "measure and draw angles to the nearest degree, when constructing models and drawing or using shapes",
  :description => "_ measure and draw reflex angles to the nearest degree, when neither edge is horizontal / vertical
  _ construct a triangle given the length of two sides and the angle between them (accurate to 1mm and 2&degrees;)")

Indicator.create(:level => 5, :key => "MA3A_MEASURES", :position => 2,
  :name => "use language associated with angle",
  :description => "")

Indicator.create(:level => 5, :key => "MA3A_MEASURES", :position => 3,
  :name => "read and interpret scales on a range of measuring instruments, explaining what each labelled division represents",
  :description => "")

Indicator.create(:level => 5, :key => "MA3A_MEASURES", :position => 4,
  :name => "solve problems involving the conversion of units",
  :description => "_ solve problems such as 1.5kg &divide; 30g
  _ work out approximately how many km are equivalent to 20 miles")

Indicator.create(:level => 5, :key => "MA3A_MEASURES", :position => 5,
  :name => "make sensible estimates of a range of measures in relation to everyday situations",
  :description => "")

Indicator.create(:level => 5, :key => "MA3A_MEASURES", :position => 6,
  :name => "understand and use the formula for the area of a rectangle and distinguish area from perimeter",
  :description => "_ find the length of a rectangle given its perimeter and width
  _ find the area or perimeter of simple L shapes, given some edge lengths")

Indicator.create(:level => 5, :key => "MA4_PLANNING", :position => 1,
  :name => "ask questions, plan how to answer them and collect the data required",
  :description => "")

Indicator.create(:level => 5, :key => "MA4_PLANNING", :position => 2,
  :name => "in probability, select methods based on equally likely outcomes and experimental evidence, as appropriate",
  :description => "_ decide if a probability can be calculated or if it can only be estimated from the results of an experiment")

Indicator.create(:level => 5, :key => "MA4_PLANNING", :position => 3,
  :name => "understand that different outcomes may result from repeating an experiment",
  :description => "")

Indicator.create(:level => 5, :key => "MA4_PROCESSING", :position => 1,
  :name => "understand and use the mean of discrete data",
  :description => "_ use the mean of a set of measurements from a science experiment")

Indicator.create(:level => 5, :key => "MA4_PROCESSING", :position => 2,
  :name => "understand and use the probability scale from 0 to 1 (from the key stage 3 programme of study)",
  :description => "")

Indicator.create(:level => 5, :key => "MA4_PROCESSING", :position => 3,
  :name => "use methods based on equally likely outcomes and experimental evidence, as appropriate, to find and justify probabilities, and approximations to these (from the key stage 3 programme of study)",
  :description => "_ compare two spinners e.g. to find which is more likely to result in an even number")

Indicator.create(:level => 5, :key => "MA4_PROCESSING", :position => 4,
  :name => "create and interpret line graphs where the intermediate values have meaning",
  :description => "_ draw and use a conversion graph for pounds and Euros")

Indicator.create(:level => 5, :key => "MA4_INTERPRETING", :position => 1,
  :name => "compare two simple distributions, using the range and one of mode, median or mean (mean and median are drawn from the key stage 3 programme of study)",
  :description => "_ describe and compare two sets of football results, by using the range and mode
  _ solve problems such as, 'Find 5 numbers where the mode is 6 and the range is 8'")

Indicator.create(:level => 5, :key => "MA4_INTERPRETING", :position => 2,
  :name => "interpret graphs and diagrams, including pie charts, and draw conclusions",
  :description => "_ complete a 2-way table, given some of the data
  _ interpret bar graphs with grouped data
  _ interpret and compare pie charts where it is not necessary to measure angles
  _ read between labelled divisions on a scale, for example read 34 on a scale labelled in tens or 3.7 on a scale labelled in ones, and find differences to answer, 'How much more?'
  _ recognise the difference between discrete and continuous data
  _ recognise when information is presented in a misleading way, for example compare two pie charts where the sample sizes are different
  _ when drawing conclusions, identify further questions to ask
  _ describe and predict outcomes from data using the language of chance or likelihood")
