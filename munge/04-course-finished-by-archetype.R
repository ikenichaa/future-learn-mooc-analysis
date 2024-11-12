percentage_of_course_success <- function(count_steps, all_steps) {
    return (count_steps/all_steps * 100)
}

# Count the number of steps in each run
steps_in_run_1 <- n_distinct(activity_1$week_number, activity_1$step_number)
steps_in_run_2 <- n_distinct(activity_2$week_number, activity_2$step_number)
steps_in_run_3 <- n_distinct(activity_3$week_number, activity_3$step_number)
steps_in_run_4 <- n_distinct(activity_4$week_number, activity_4$step_number)
steps_in_run_5 <- n_distinct(activity_5$week_number, activity_5$step_number)
steps_in_run_6 <- n_distinct(activity_6$week_number, activity_6$step_number)
steps_in_run_7 <- n_distinct(activity_7$week_number, activity_7$step_number)

# Get the percentage of steps completion for each learner
# and merge with the archetype table to know the type of learner
# repeat these to all 7 runs
activity_1_learner_progress_archetype <- activity_1 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_run_1)) |>
    mutate(finish = finish_percentage>80) |>
    merge(y=arch_1[,c('learner_id', 'archetype')], by="learner_id", all.x=TRUE)

activity_2_learner_progress_archetype <- activity_2 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_run_2)) |>
    mutate(finish = finish_percentage>80) |>
    merge(y=arch_2[,c('learner_id', 'archetype')], by="learner_id", all.x=TRUE)

activity_3_learner_progress_archetype <- activity_3 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_run_3)) |>
    mutate(finish = finish_percentage>80) |>
    merge(y=arch_3[,c('learner_id', 'archetype')], by="learner_id", all.x=TRUE)

activity_4_learner_progress_archetype <- activity_4 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_run_4)) |>
    mutate(finish = finish_percentage>80) |>
    merge(y=arch_4[,c('learner_id', 'archetype')], by="learner_id", all.x=TRUE)

activity_5_learner_progress_archetype <- activity_5 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_run_5)) |>
    mutate(finish = finish_percentage>80) |>
    merge(y=arch_5[,c('learner_id', 'archetype')], by="learner_id", all.x=TRUE)

activity_6_learner_progress_archetype <- activity_6 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_run_6)) |>
    mutate(finish = finish_percentage>80) |>
    merge(y=arch_6[,c('learner_id', 'archetype')], by="learner_id", all.x=TRUE)

activity_7_learner_progress_archetype <- activity_7 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_run_7)) |>
    mutate(finish = finish_percentage>80) |>
    merge(y=arch_7[,c('learner_id', 'archetype')], by="learner_id", all.x=TRUE)

cache('activity_1_learner_progress_archetype')
cache('activity_2_learner_progress_archetype')
cache('activity_3_learner_progress_archetype')
cache('activity_4_learner_progress_archetype')
cache('activity_5_learner_progress_archetype')
cache('activity_6_learner_progress_archetype')
cache('activity_7_learner_progress_archetype')