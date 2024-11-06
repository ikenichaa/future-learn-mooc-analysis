arch_1 <- cyber.security.1_archetype.survey.responses
arch_2 <- cyber.security.2_archetype.survey.responses
arch_3 <- cyber.security.3_archetype.survey.responses
arch_4 <- cyber.security.4_archetype.survey.responses
arch_5 <- cyber.security.5_archetype.survey.responses
arch_6 <- cyber.security.6_archetype.survey.responses
arch_7 <- cyber.security.7_archetype.survey.responses

arch_1 <- arch_1[, c('learner_id', 'archetype')]
arch_2 <- arch_2[, c('learner_id', 'archetype')]
arch_3 <- arch_3[, c('learner_id', 'archetype')]
arch_4 <- arch_4[, c('learner_id', 'archetype')]
arch_5 <- arch_5[, c('learner_id', 'archetype')]
arch_6 <- arch_6[, c('learner_id', 'archetype')]
arch_7 <- arch_7[, c('learner_id', 'archetype')]

arch_1$Run <- "1"
arch_2$Run <- "2"
arch_3$Run <- "3"
arch_4$Run <- "4"
arch_5$Run <- "5"
arch_6$Run <- "6"
arch_7$Run <- "7"

archetype <- rbind(arch_1, arch_2, arch_3, arch_4, arch_5, arch_6, arch_7)

archetype_counts <- archetype %>%
    group_by(Run, archetype) %>%
    summarise(count = n(), .groups = 'drop')

archetype_str <- c('Advancers', 'Explorers', 'Fixers', 'Flourishers', 'Hobbyists',
                   'Other', 'Vitalisers', 'Preparers')

run <- c('1', '2', '3', '4', '5', '6')

for (r in run) {
    print(r)
    for (a in archetype_str) {
        missing_row <- nrow(archetype_counts |> filter(Run == r & archetype == a )) == 0
        if (missing_row) {
            archetype_counts <- archetype_counts |> add_row(Run = r, archetype = a, count = 0)
        }
    }
}
