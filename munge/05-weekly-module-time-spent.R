# Activity 3:

# Merge activity 3 with learner progress table
# To know which learner finish the course
run_3_activity_with_finish_flag <- cyber.security.3_step.activity |>
    subset(select = -c(step)) |>
    merge(y = activity_3_learner_progress_archetype[,c("learner_id", "finish")], by=c("learner_id"), all.x = TRUE)

# Calculate the duration that each complete learner take to finish the weekly module
run_3_weekly_module_time_spent_for_finisher <- run_3_activity_with_finish_flag |>
    filter(finish == TRUE) |>
    filter(last_completed_at != "") |>
    group_by(learner_id, week_number)|>
    summarise(duration_in_days = difftime(max(last_completed_at), min(first_visited_at), units = "days"))

# Merge to get the archetype
run_3_weekly_module_time_spent_with_arch <- weekly_module_time_spent_for_finisher |>
    merge(y = activity_3_learner_progress_archetype[,c("learner_id", "archetype")], by=c("learner_id"), all.x = TRUE) |>
    mutate(duration_in_days_int = as.numeric(duration_in_days)) |>
    mutate(run = 3)

# ----------
# Activity 4:

# Merge activity 4 with learner progress table
# To know which learner finish the course
run_4_activity_with_finish_flag <- cyber.security.4_step.activity |>
    subset(select = -c(step)) |>
    merge(y = activity_4_learner_progress_archetype[,c("learner_id", "finish")], by=c("learner_id"), all.x = TRUE)

# Calculate the duration that each complete learner take to finish the weekly module
run_4_weekly_module_time_spent_for_finisher <- run_4_activity_with_finish_flag |>
    filter(finish == TRUE) |>
    filter(last_completed_at != "") |>
    group_by(learner_id, week_number)|>
    summarise(duration_in_days = difftime(max(last_completed_at), min(first_visited_at), units = "days"))

# Merge to get the archetype
run_4_weekly_module_time_spent_with_arch <- weekly_module_time_spent_for_finisher |>
    merge(y = activity_4_learner_progress_archetype[,c("learner_id", "archetype")], by=c("learner_id"), all.x = TRUE) |>
    mutate(duration_in_days_int = as.numeric(duration_in_days)) |>
    mutate(run = 4)

# ----------
# Activity 5:

# Merge activity 5 with learner progress table
# To know which learner finish the course
run_5_activity_with_finish_flag <- cyber.security.5_step.activity |>
    subset(select = -c(step)) |>
    merge(y = activity_5_learner_progress_archetype[,c("learner_id", "finish")], by=c("learner_id"), all.x = TRUE)

# Calculate the duration that each complete learner take to finish the weekly module
run_5_weekly_module_time_spent_for_finisher <- run_3_activity_with_finish_flag |>
    filter(finish == TRUE) |>
    filter(last_completed_at != "") |>
    group_by(learner_id, week_number)|>
    summarise(duration_in_days = difftime(max(last_completed_at), min(first_visited_at), units = "days"))

# Merge to get the archetype
run_5_weekly_module_time_spent_with_arch <- weekly_module_time_spent_for_finisher |>
    merge(y = activity_5_learner_progress_archetype[,c("learner_id", "archetype")], by=c("learner_id"), all.x = TRUE) |>
    mutate(duration_in_days_int = as.numeric(duration_in_days)) |>
    mutate(run = 5)

# ----------
# Activity 6:

# Merge activity 6 with learner progress table
# To know which learner finish the course
run_6_activity_with_finish_flag <- cyber.security.6_step.activity |>
    subset(select = -c(step)) |>
    merge(y = activity_6_learner_progress_archetype[,c("learner_id", "finish")], by=c("learner_id"), all.x = TRUE)

# Calculate the duration that each complete learner take to finish the weekly module
run_6_weekly_module_time_spent_for_finisher <- run_6_activity_with_finish_flag |>
    filter(finish == TRUE) |>
    filter(last_completed_at != "") |>
    group_by(learner_id, week_number)|>
    summarise(duration_in_days = difftime(max(last_completed_at), min(first_visited_at), units = "days"))

# Merge to get the archetype
run_6_weekly_module_time_spent_with_arch <- weekly_module_time_spent_for_finisher |>
    merge(y = activity_6_learner_progress_archetype[,c("learner_id", "archetype")], by=c("learner_id"), all.x = TRUE) |>
    mutate(duration_in_days_int = as.numeric(duration_in_days)) |>
    mutate(run = 6)

# ----------
# Activity 7:

# Merge activity 7 with learner progress table
# To know which learner finish the course
run_7_activity_with_finish_flag <- cyber.security.7_step.activity |>
    subset(select = -c(step)) |>
    merge(y = activity_7_learner_progress_archetype[,c("learner_id", "finish")], by=c("learner_id"), all.x = TRUE)

# Calculate the duration that each complete learner take to finish the weekly module
run_7_weekly_module_time_spent_for_finisher <- run_7_activity_with_finish_flag |>
    filter(finish == TRUE) |>
    filter(last_completed_at != "") |>
    group_by(learner_id, week_number)|>
    summarise(duration_in_days = difftime(max(last_completed_at), min(first_visited_at), units = "days"))

# Merge to get the archetype
run_7_weekly_module_time_spent_with_arch <- weekly_module_time_spent_for_finisher |>
    merge(y = activity_7_learner_progress_archetype[,c("learner_id", "archetype")], by=c("learner_id"), all.x = TRUE) |>
    mutate(duration_in_days_int = as.numeric(duration_in_days)) |>
    mutate(run = 7)

# Combine All runs together
weekly_module_time_spent_with_arch <- rbind(
    run_3_weekly_module_time_spent_with_arch,
    run_4_weekly_module_time_spent_with_arch,
    run_5_weekly_module_time_spent_with_arch,
    run_6_weekly_module_time_spent_with_arch,
    run_7_weekly_module_time_spent_with_arch
)

