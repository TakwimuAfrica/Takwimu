from wazimap.data.tables import FieldTable


FieldTable(['population_sex_2006'], id='population_sex_2006', year='2006', dataset='Census')
FieldTable(['population_sex_2007'], id='population_sex_2007', year='2007', dataset='Census')
FieldTable(['population_sex_2009'], id='population_sex_2009', year='2009', dataset='Census')
FieldTable(['population_sex_2011'], id='population_sex_2011', year='2011', dataset='Census')
FieldTable(['population_sex_2012'], id='population_sex_2012', year='2012', dataset='Census')
FieldTable(['population_sex_2013'], id='population_sex_2013', year='2013', dataset='Census')

FieldTable(['population_residence_2009'], id='population_residence_2009', year='2006', dataset='Census')
FieldTable(['population_residence_2012'], id='population_residence_2012', year='2012', dataset='Census')
FieldTable(['population_residence_2013'], id='population_residence_2013', year='2013', dataset='Census')


FieldTable(['candidate'], id="votes_per_candidate", dataset='Elections', year='2014')
FieldTable(['votes'], id="valid_invalid_votes", dataset='Elections', year='2014')
FieldTable(['voters'], id="registered_accredited_voters", dataset='Elections', year='2014')
FieldTable(['crops'], id='food_production', value_type='Float', dataset='Agriculture', year='2014')
FieldTable(['centers'], id="health_centers", dataset='Health', year='2014')
FieldTable(['centers'], id="hiv_health_centers", dataset='Health', year='2014')
FieldTable(['organization_type'], id="health_centers_ownership", dataset='Health', year='2014')
FieldTable(['workers'], id="health_workers", dataset='Health', year='2014')
FieldTable(['causes_of_death_over_five'], dataset='Health', year='2014')
FieldTable(['causes_of_death_under_five'], dataset='Health', year='2014')
FieldTable(['inpatient_diagnosis_over_five'], dataset='Health', year='2014')
FieldTable(['inpatient_diagnosis_under_five'], dataset='Health', year='2014')
FieldTable(['outpatient_diagnosis_over_five'], dataset='Health', year='2014')
FieldTable(['outpatient_diagnosis_under_five'], dataset='Health', year='2014')
FieldTable(['child_births'], dataset='Health', year='2014')
FieldTable(['size'], id="child_births_by_size")
FieldTable(['reported_birth_weights'], dataset='Health', year='2014',
           id="child_births_with_reported_birth_weights")
FieldTable(['low_birth_weights'], id="child_births_with_low_birth_weights", dataset='Health', year='2014')
FieldTable(
    ['employment_activity_status', 'sex'],
    id='employment_activity_status_sex', dataset='Employment', year='2014'
)
FieldTable(
    ['highest_education_level_reached'],
    id='highest_education_level_reached', dataset='Education', year='2014'
)
FieldTable(['method', 'sex'], id="method_sex", year='2014', dataset='Health')

FieldTable(
    ['school_attendance', 'sex'],
    id='school_attendance_sex',
    dataset='Education', year='2014'
)

FieldTable(['donor'], id='donor', dataset='Donor Assistance', year='2014')

FieldTable(['residence', 'poverty_type'], id='residence_poverty_type', dataset='Social Welfare', year='2014')

FieldTable(['residence', 'age'], id='poverty_age_residence', dataset='Social Welfare', year='2014')

FieldTable(['year', 'type'], id='seized_firearms', dataset='Security', year='2014')

FieldTable(['programme', 'donor'], id='donor_funded_programmes', dataset='Donor Assistance', year='2014')

FieldTable(['year', 'sector'], id='government_funding', dataset='Government', year='2014')

FieldTable(['crime'], universe='Crimes', dataset='Crime',
           year='2014')

FieldTable(['official employment status'], universe='Individuals 15 and older', dataset='Employment', year='2014')

# worldbank

FieldTable(['cereal_yield_kg_per_hectare_year'], year=2017,
           dataset='WorldBank', id='cereal_yield_kg_per_hectare')
FieldTable(['agricultural_land_year'], year=2017, dataset='WorldBank',
           id='agricultural_land')
FieldTable(['gini_index_year'], year=2017, dataset='WorldBank',
           id='gini_index')
FieldTable(['access_to_basic_services_year'], year=2017, dataset='WorldBank',
           id='access_to_basic_services')
FieldTable(['primary_school_enrollment_year', 'sex'], year=2017,
           dataset='WorldBank', id='primary_school_enrollment')
FieldTable(['sex', 'account_ownership_year'], year=2017, dataset='WorldBank',
           id='account_ownership')
FieldTable(['youth_unemployment_year', 'sex'], year=2017, dataset='WorldBank',
           id='youth_unemployment')
FieldTable(['adult_literacy_rate_year', 'sex'], year=2017,
           dataset='WorldBank', id='adult_literacy_rate')
FieldTable(['foreign_direct_investment_net_inflows_year'], year=2017,
           dataset='WorldBank', id='foreign_direct_investment_net_inflows')
FieldTable(['maternal_mortality_year'], year=2017, dataset='WorldBank',
           id='maternal_mortality')
FieldTable(['hiv_prevalence_year', 'sex'], year=2017, dataset='WorldBank',
           id='hiv_prevalence')
FieldTable(['employment_to_population_ratio_year', 'sex'], year=2017,
           dataset='WorldBank', id='employment_to_population_ratio')
FieldTable(['total_population_year'], year=2017, dataset='WorldBank',
           id='total_population')
FieldTable(['gdp_per_capita_year'], year=2017, dataset='WorldBank',
           id='gdp_per_capita')
FieldTable(['primary_education_completion_rate_year'], year=2017,
           dataset='WorldBank', id='primary_education_completion_rate')
FieldTable(['secondary_school_enrollment_year', 'sex'], year=2017,
           dataset='WorldBank', id='secondary_school_enrollment')
FieldTable(['fgm_prevalence_year'], year=2017, dataset='WorldBank',
            id='fgm_prevalence')
FieldTable(['nurses_and_midwives_year'], year=2017, dataset='WorldBank',
           id='nurses_and_midwives')
FieldTable(['mobile_phone_subscriptions_year'], year=2017,
           dataset='WorldBank', id='mobile_phone_subscriptions')
FieldTable(['gdp_per_capita_growth_year'], year=2017, dataset='WorldBank',
           id='gdp_per_capita_growth')
FieldTable(['prevalence_of_undernourishment_year'], year=2017,
           dataset='WorldBank', id='prevalence_of_undernourishment')
FieldTable(['physicians_nurses_and_midwives_year'], year=2017,
           dataset='WorldBank', id='physicians_nurses_and_midwives')
FieldTable(['life_expectancy_at_birth_year', 'sex'], year=2017,
           dataset='WorldBank', id='life_expectancy_at_birth')
FieldTable(['tax_as_percentage_of_gdp_year'], year=2017, dataset='WorldBank',
           id='tax_as_percentage_of_gdp')
FieldTable(['births_attended_by_skilled_health_staff_year'], year=2017,
           dataset='WorldBank', id='births_attended_by_skilled_health_staff')
FieldTable(['incidence_of_malaria_per_1000_pop_at_risk_year'],
           year=2017, dataset='WorldBank',
           id='incidence_of_malaria_per_1000_pop_at_risk')
FieldTable(['tax_revenue_year'], year=2017, dataset='WorldBank',
           id='tax_revenue')
FieldTable(['gdp_year'], year=2017, dataset='WorldBank', id='gdp')
FieldTable(['gdp_growth_year'], year=2017, dataset='WorldBank',
           id='gdp_growth')
FieldTable(['employment_in_agriculture_year', 'sex'], id='employment_in_agriculture', dataset='Agriculture', year='2014')
FieldTable(['mortality_year', 'infant_under5'], id='infant_under5_mortality', dataset='Health', year='2014')
FieldTable(['women_parliament_year'], id="women_in_parliament", dataset='Elections', year='2014')
FieldTable(['position'], id="women_in_government", dataset='Elections', year='2014')
FieldTable(['year','workers'], id="health_workers_distribution", dataset='Health', year='2014')