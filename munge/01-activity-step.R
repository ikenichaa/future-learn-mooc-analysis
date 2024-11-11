# For the step activity table, filter out the row with no last completed at to pick only the step that users completed
# Then filter only learner_id, week_number, step_number
# Repeat this to all runs
activity_1 <- distinct(
        cyber.security.1_step.activity |>
        filter(last_completed_at != "") |>
        select(learner_id, week_number, step_number)
    )

activity_2 <- cyber.security.2_step.activity |>
    filter(last_completed_at != "") |>
    select(learner_id, week_number, step_number)

activity_3 <- cyber.security.3_step.activity |>
    filter(last_completed_at != "") |>
    select(learner_id, week_number, step_number)

activity_4 <- cyber.security.4_step.activity |>
    filter(last_completed_at != "") |>
    select(learner_id, week_number, step_number)

activity_5 <- cyber.security.5_step.activity |>
    filter(last_completed_at != "") |>
    select(learner_id, week_number, step_number)

activity_6 <- cyber.security.6_step.activity |>
    filter(last_completed_at != "") |>
    select(learner_id, week_number, step_number)

activity_7 <- cyber.security.7_step.activity |>
    filter(last_completed_at != "") |>
    select(learner_id, week_number, step_number)