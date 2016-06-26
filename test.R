test_string <- " (2003), advisory committee on teacher education and qualifications advisory committee on teacher education and qualifications, hong kongberliner, d.c., expertise: the wonder of exemplary performances (1994), pp. 161-186. , harcourt brace college, fort worth, txbeyer, l.e., the politics of standards and the education of teachers (2002), 13 (3), pp. 305-316beyer, l.e., the politics of standardization: teacher education in the usa (2002), 28 (3), pp. 239-245bullough, r.v., clark, d.c., patterson, r.s., getting in step: accountability, accreditation and the standardization of teacher education in the united states (2003), 29 (1), pp. 35-51burroughs, r., composing standards and composing teachers (2001), 52 (3), pp. 223-232creswell, j.w., (2002), pearson education, upper saddle river, njcreswell, j.w., miller, d., determining validity in qualitative inquiry (2000), 39, pp. 124-130crooks, t., some criteria for intelligent accountability applied to accountability in new zealand (2003) annual conference of the american educational research association chicago, , paper presented at the; danielson, c., mcgreal, t.l., (2000), association for supervision and curriculum development, alexandria, vadelandshere, g., arens, s.a., representations of teaching and standards-based reform: are we closing the debate about teacher education? (2001), 17 (5), pp. 547-566feeney, e.j., quality feedback: the essential ingredient for teacher success (2007), 80 (4), pp. 191-198fessler, r., christensen, j.c., (1992), allyn and bacon, boston, mafuller, f.f., bown, o.h., becoming a teacher (1975), pp. 25-52. , univ. of chicago press, chicagohuberman, m., teacher development and instructional mastery (1993), pp. 122-142. , teachers college press, new yorkkleinhenz, e., ingvarson, l., teacher accountability in australia: current policies and practices and their relation to the improvement of teaching and learning (2004), 19 (1), pp. 31-49klenowski, v., student self-evaluation process in student-centered teaching and learning contexts of australia and england (1995), 2, pp. 145-163knight, p., summative assessment in higher education: practices in disarray (2002), 27 (3), pp. 275-286mayer, d., mitchell, j., macdonald, d., bell, r., professional standards for teachers: a case study of professional learning (2005), 33 (2), pp. 159-179miles, m.b., huberman, a.m., (1994), sage, thousand oakspendry, a., mcintyre, d., trying to make profiling useful for teacher education: the oxford experience (1996), pp. 56-71. , david fulton, londonpyke, c.l., lynch, s., mathematics and science teachers' preparation for national board of professional teaching standards certification (2005), 105 (1), pp. 25-35reynolds, a., what is competent beginning teaching? (1992), 62 (1), pp. 1-35ross, j.a., bruce, c.d., teacher self-assessment: a mechanism for facilitating professional growth (2007), 23 (2), pp. 147-159(2003), open univ. press, buckingham, uksadler, d.r., formative assessment and the design of instructional systems (1989), 18, pp. 119-144sadler, d.r., formative assessment: revisiting the territory (1998), 5 (1), pp. 77-85sadler, d.r., interpretations of criteria-based assessment and grading in higher education (2005), 30 (2), pp. 175-194sergiovanni, t.j., starratt, r.j., (2002), mcgraw-hill, bostonsmith, k., teacher educators' expertise: what do novice teachers and teacher educators say? (2005), 21, pp. 177-192smith, k., tillema, h., use of criteria in assessing teaching portfolios: judgmental practices in summative evaluation (2007), 51 (1), pp. 103-117steffy, b.e., (1989), technomic, lancaster, pavonk, j.h.c., (1989) becoming a teacher, brace yourself, , vrije univ, amsterdam, netherlands; ward, j.r., mccotter, s.s., reflection as a visible outcome for preservice teachers (2004), 20 (2), pp. 243-257wiggins, g., creating tests worth teaching (1992), 49, pp. 26-33"

##grep("^?[1-2][0-9][0-9][0-9])?$", test_string)
grep ("[1-2][0-9][0-9][0-9]", test_string, perl=TRUE)


test_string2 <- sapply(test_string, 
                        function(x){gsub(pattern = "[1-2][0-9][0-9][0-9]",
                                         replacement = ";", x)})

test_string <- "abc 1999: def(2000), cba 2016 a; aa"

# m <- regexpr(pattern, x)
# regmatches(x, m)

regmatches(test_string, regexpr("a+",test_string))
require(stringr,quietly=TRUE)
str_count(test_string, "[(][1-2][0-9][0-9][0-9][)]")

# for (row_index in 1:nrow(data)){
#   data[row_index,"no_references"] <- str_count(data[row_index,"references"], ";")+1
# }

char_index<- which(data$source.title=="history of education" & data$volume==40 & data$issue==3 & 
        data$page.start==315)

data[char_index,"abstract"]
grep("aimã© bogaerts",data[char_index,"abstract"])
