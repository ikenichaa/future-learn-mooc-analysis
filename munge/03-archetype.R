# Read the archetype survey response for all runs
arch_1 <- cyber.security.1_archetype.survey.responses |> filter(archetype != 'Other')
arch_2 <- cyber.security.2_archetype.survey.responses |> filter(archetype != 'Other')
arch_3 <- cyber.security.3_archetype.survey.responses |> filter(archetype != 'Other')
arch_4 <- cyber.security.4_archetype.survey.responses |> filter(archetype != 'Other')
arch_5 <- cyber.security.5_archetype.survey.responses |> filter(archetype != 'Other')
arch_6 <- cyber.security.6_archetype.survey.responses |> filter(archetype != 'Other')
arch_7 <- cyber.security.7_archetype.survey.responses |> filter(archetype != 'Other')

# Choose only learner id and archetype
arch_1 <- arch_1[, c('learner_id', 'archetype')]
arch_2 <- arch_2[, c('learner_id', 'archetype')]
arch_3 <- arch_3[, c('learner_id', 'archetype')]
arch_4 <- arch_4[, c('learner_id', 'archetype')]
arch_5 <- arch_5[, c('learner_id', 'archetype')]
arch_6 <- arch_6[, c('learner_id', 'archetype')]
arch_7 <- arch_7[, c('learner_id', 'archetype')]

# Add the field run with run number as a value
arch_1$run <- "1"
arch_2$run <- "2"
arch_3$run <- "3"
arch_4$run <- "4"
arch_5$run <- "5"
arch_6$run <- "6"
arch_7$run <- "7"

# Combine all archetype response from all runs together
archetype <- rbind(arch_1, arch_2, arch_3, arch_4, arch_5, arch_6, arch_7)

# Count the number of each archetype in each run
archetype_counts <- archetype |>
    group_by(run, archetype) |>
    summarize(count = n(), .groups = 'drop')

archetype_str <- c('Advancers', 'Explorers', 'Fixers', 'Flourishers', 'Hobbyists',
                   'Vitalisers', 'Preparers')

run <- c('1', '2', '3', '4', '5', '6')

# Add missing archetypes to the run, so all runs will have the same number of archetypes
for (r in run) {
    for (a in archetype_str) {
        missing_row <- nrow(archetype_counts |> filter(run == r & archetype == a )) == 0
        if (missing_row) {
            archetype_counts <- archetype_counts |> add_row(run = r, archetype = a, count = 0)
        }
    }
}

cache('archetype_counts')
cache('arch_1')
cache('arch_2')
cache('arch_3')
cache('arch_4')
cache('arch_5')
cache('arch_6')
cache('arch_7')
