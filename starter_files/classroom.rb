#        ,___          .-;'
#        `"-.`\_...._/`.`
#     ,      \        /
#  .-' ',    / ()   ()\
# `'._   \  /()    .  (|
#     > .' ;,     -'-  /
#    / <   |;,     __.;
#    '-.'-.|  , \    , \
#       `>.|;, \_)    \_)
#        `-;     ,    /
#           \    /   <
#            '. <`'-,_)
#             '._)

# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  return grade_hash[student][assignment_num-1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
    outArray = []
    grade_hash.each do |key, value|
        outArray.push(value[assignment_num-1])

    end
    return outArray
end



# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
    sum, n = 0, 0
    grade_hash.each do |k,v|
        n += 1
        sum += v[assignment_num-1]
    end
    return sum/n
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
# def averages(grade_hash)

# end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
    output = case score
        when 0...60
            'F'
        when 60..69
            'D'
        when 70..79
            'C'
        when 80..89
            'B'
        when 90..100
            'A'
        end

        return output
end

# Return a hash of students and their final letter grade, as determined
# by their average.
# def final_letter_grades(grade_hash)
# end

# Return the average for the entire class.
def class_average(grade_hash)
    sum, n = 0, 0
    grade_hash.each do |k,array|
        array.each do |grade|
            n += 1
            sum += grade
        end
    end
    return sum/n
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
    outArray = []
    grade_hash.each do |name, scores|
        sum, n = 0, 0
        scores.each do |x|
            n += 1
            sum += x
        end
        outArray.push([sum/n, name])
    end
    final_answer = []
    outArray.sort.reverse[0...number_of_students].each do |grade,name|
        final_answer.push(name)
    end
    return final_answer
end
