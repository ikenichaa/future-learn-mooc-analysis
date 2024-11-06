percentage_of_course_success <- function(count_steps, all_steps) {
    c_step <- as.numeric(count_steps)
    return (count_steps/all_steps * 100)
}

steps_in_course_1 <- n_distinct(activity_1$step, activity_1$step_number)
steps_in_course_2 <- n_distinct(activity_2$step, activity_2$step_number)
steps_in_course_3 <- n_distinct(activity_3$step, activity_3$step_number)
steps_in_course_4 <- n_distinct(activity_4$step, activity_4$step_number)
steps_in_course_5 <- n_distinct(activity_5$step, activity_5$step_number)
steps_in_course_6 <- n_distinct(activity_6$step, activity_6$step_number)
steps_in_course_7 <- n_distinct(activity_7$step, activity_7$step_number)

activity_1_learner_progress_archetype <- activity_1 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_course_1)) |>
    merge(y=archetype, by="learner_id", all.x=TRUE)

activity_2_learner_progress_archetype <- activity_2 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_course_2)) |>
    merge(y=archetype, by="learner_id", all.x=TRUE)

activity_3_learner_progress_archetype <- activity_3 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_course_3)) |>
    merge(y=archetype, by="learner_id", all.x=TRUE)

activity_4_learner_progress_archetype <- activity_4 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_course_4)) |>
    merge(y=archetype, by="learner_id", all.x=TRUE)

activity_5_learner_progress_archetype <- activity_5 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_course_5)) |>
    merge(y=archetype, by="learner_id", all.x=TRUE)

activity_6_learner_progress_archetype <- activity_6 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_course_6)) |>
    merge(y=archetype, by="learner_id", all.x=TRUE)

activity_7_learner_progress_archetype <- activity_7 |>
    count(learner_id) |>
    rename(steps_finished = 2) |>
    mutate(finish_percentage = percentage_of_course_success(steps_finished, steps_in_course_7)) |>
    merge(y=archetype, by="learner_id", all.x=TRUE)