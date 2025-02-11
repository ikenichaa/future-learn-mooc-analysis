# For the enrolments dataset, filter only the role learner who has never been unenrolled
enroll_1 <- cyber.security.1_enrolments |> filter(role=='learner' & unenrolled_at == '')
enroll_2 <- cyber.security.2_enrolments |> filter(role=='learner' & unenrolled_at == '')
enroll_3 <- cyber.security.3_enrolments |> filter(role=='learner' & unenrolled_at == '')
enroll_4 <- cyber.security.4_enrolments |> filter(role=='learner' & unenrolled_at == '')
enroll_5 <- cyber.security.5_enrolments |> filter(role=='learner' & unenrolled_at == '')
enroll_6 <- cyber.security.6_enrolments |> filter(role=='learner' & unenrolled_at == '')
enroll_7 <- cyber.security.7_enrolments |> filter(role=='learner' & unenrolled_at == '')

# Cache the dataframe
cache('enroll_1')
cache('enroll_2')
cache('enroll_3')
cache('enroll_4')
cache('enroll_5')
cache('enroll_6')
cache('enroll_7')