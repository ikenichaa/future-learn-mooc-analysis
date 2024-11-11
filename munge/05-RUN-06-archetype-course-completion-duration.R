# Get the duration that each learner use to complete each week number of the course
activity_6_study_duration <- cyber.security.1_step.activity |>
    group_by(learner_id, week_number) |>
    summarise(
        min_first_visited_at = min(first_visited_at),
        max_last_completed_at = max(last_completed_at),
        .groups = "drop_last"
    ) |> filter(max_last_completed_at != "") |>
    mutate(duration = difftime(max_last_completed_at, min_first_visited_at, units = "hours"))

# Get the steps of each week in the course
steps_in_course_6 <- cyber.security.6_step.activity |>
    select(week_number, step_number) |>
    distinct() |>
    group_by(week_number) |>
    summarise(step_count = n())

# Function to find number of steps in the input week
find_steps_per_week <- function(week) {
    steps_per_week <- steps_in_course_6 |> filter(week_number == week) |> select(step_count) |> pull(step_count)

    return (steps_per_week)
}

# Get the number of steps each learner done in each courses' week
activity_6_steps_finish_per_week <- cyber.security.6_step.activity |>
    group_by(learner_id, week_number) |>
    count(learner_id) |>
    rename(steps_finished = 3)

# Add total number of steps per week to the data frame
activity_6_steps_finish_per_week['steps_per_week'] <- sapply(activity_6_steps_finish_per_week$week_number, find_steps_per_week)

# Calculate the percentage of steps finished
activity_6_steps_finish_per_week['percent_of_steps_finished'] <-
    round(activity_6_steps_finish_per_week$steps_finished/activity_6_steps_finish_per_week$steps_per_week * 100, 2)

# Retrieve only the course completer
activity_6_completer <- activity_6_steps_finish_per_week |>
    filter(percent_of_steps_finished > 80) |>
    select(learner_id, week_number, percent_of_steps_finished)

# Merge with duration_week_a6
# and drop rows with NA out because don't have last completed
activity_6_completer_study_duration <- activity_6_completer |>
    merge(y = activity_6_study_duration, by=c("week_number", "learner_id"), all.x=TRUE) |>
    na.omit()

activity_6_completer_study_duration_with_archetype <-
    activity_6_completer_study_duration |>
    merge(y=activity_6_learner_progress_archetype, by="learner_id", all.x=TRUE) |>
    select(learner_id, week_number, percent_of_steps_finished, duration, archetype) |>
    mutate(duration_numeric = as.numeric(duration))


