from wazimap.data.tables import FieldTable

FieldTable(['Population_Sex'])
FieldTable(['Population_Residence'])
FieldTable(['candidate'], id="votes_per_candidate")
FieldTable(['votes'], id="valid_invalid_votes")
FieldTable(['voters'], id="registered_accredited_voters")
FieldTable(['crops'], id='food_production', value_type='Float')
FieldTable(['centers'], id="health_centers")
FieldTable(['centers'], id="hiv_health_centers")
FieldTable(['organization_type'], id="health_centers_ownership")
FieldTable(['workers'], id="health_workers")
FieldTable(['causes_of_death_over_five'])
FieldTable(['causes_of_death_under_five'])
FieldTable(['inpatient_diagnosis_over_five'])
FieldTable(['inpatient_diagnosis_under_five'])
FieldTable(['outpatient_diagnosis_over_five'])
FieldTable(['outpatient_diagnosis_under_five'])
FieldTable(['child_births'])
FieldTable(['size'], id="child_births_by_size")
FieldTable(['reported_birth_weights'], id="child_births_with_reported_birth_weights")
FieldTable(['low_birth_weights'], id="child_births_with_low_birth_weights")
FieldTable(
    ['employment_activity_status', 'sex'],
    id='employment_activity_status_sex'
)
FieldTable(
    ['highest_education_level_reached'],
    id='highest_education_level_reached'
)
FieldTable(['method', 'sex'], id="method_sex")

FieldTable(
    ['school_attendance', 'sex'],
    id='school_attendance_sex'
)

FieldTable(['donor'], id='donor')

FieldTable(['residence', 'poverty_type'], id='residence_poverty_type')

FieldTable(['residence', 'age'], id='poverty_age_residence')

FieldTable(['age'], id='fgm_prevalence')