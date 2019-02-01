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
FieldTable(['reported_birth_weights'],
           id="child_births_with_reported_birth_weights")
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

FieldTable(['year', 'type'], id='seized_firearms')

FieldTable(['programme', 'donor'], id='donor_funded_programmes')

FieldTable(['year', 'sector'], id='government_funding')

FieldTable(['crime'], universe='Crimes', dataset='Police Crime Statistics 2014',
           year='2014')

FieldTable(['official employment status'], universe='Individuals 15 and older')

FieldTable(['Cereal yield (kg per hectare)', 'year', ], year=2017,
           dataset='WorldBank', id='cereal_yield_kg_per_hectare')
FieldTable(['Agricultural land (% of land area)', 'year', ], year=2017,
           dataset='WorldBank', id='agricultural_land')
FieldTable(['GINI index (World Bank estimate)', 'year', ], year=2017,
           dataset='WorldBank', id='gini_index')
FieldTable(
    ['People using at least basic drinking water services (% of population)',
     'year', ], year=2017, dataset='WorldBank', id='access_to_basic_services')
FieldTable(['School enrollment, primary (% gross)', 'year', 'sex', ], year=2017,
           dataset='WorldBank', id='primary_school_enrollment')
FieldTable([
               'Account ownership at a financial institution or with a mobile-money-service provider, female (% of population ages 15+)',
               'year', 'sex', ], year=2017, dataset='WorldBank',
           id='account_ownership')
FieldTable(
    ['Unemployment, youth (% of labor force ages 15-24) (modeled ILO estimate)',
     'sex', 'year', ], year=2017, dataset='WorldBank', id='youth_unemployment')
FieldTable(['year', 'Literacy rate, adult (% of population ages 15 and above)',
            'sex', ], year=2017, dataset='WorldBank', id='adult_literacy_rate')
FieldTable(['Foreign direct investment, net inflows (% of GDP)', 'year', ],
           year=2017, dataset='WorldBank',
           id='foreign_direct_investment_net_inflows')
FieldTable(
    ['Maternal mortality ratio (modeled estimate, per 100,000 live births)',
     'year', ], year=2017, dataset='WorldBank', id='maternal_mortality')
FieldTable(['Prevalence of HIV, (% ages 15-24)', 'year', 'sex', ], year=2017,
           dataset='WorldBank', id='hiv_prevalence')
FieldTable(
    ['sex', 'Employment to population ratio, 15+, (%) (modeled ILO estimate)',
     'year', ], year=2017, dataset='WorldBank',
    id='employment_to_population_ratio')
FieldTable(['Population, total', 'year', ], year=2017, dataset='WorldBank',
           id='total_population')
FieldTable(['GDP per capita (current US$)', 'year', ], year=2017,
           dataset='WorldBank', id='gdp_per_capita')
FieldTable(
    ['Primary completion rate, female (% of relevant age group)', 'year', ],
    year=2017, dataset='WorldBank', id='primary_education_completion_rate')
FieldTable(['year', 'School enrollment, secondary (% gross)', 'sex', ],
           year=2017, dataset='WorldBank', id='secondary_school_enrollment')
FieldTable(['Female genital mutilation prevalence (%)', 'year', ], year=2017,
           dataset='WorldBank', id='fgm_prevalence')
FieldTable(['Nurses and midwives (per 1,000 people)', 'year', ], year=2017,
           dataset='WorldBank', id='nurses_and_midwives')
FieldTable(['Mobile cellular subscriptions (per 100 people)', 'year', ],
           year=2017, dataset='WorldBank', id='mobile_phone_subscriptions')
FieldTable(['GDP per capita growth (annual %)', 'year', ], year=2017,
           dataset='WorldBank', id='gdp_per_capita_growth')
FieldTable(['Prevalence of undernourishment (% of population)', 'year', ],
           year=2017, dataset='WorldBank', id='prevalence_of_undernourishment')
FieldTable(['Physicians (per 1,000 people)', 'year', ], year=2017,
           dataset='WorldBank', id='physicians_nurses_and_midwives')
FieldTable(['Life expectancy at birth (years)', 'year', 'sex', ], year=2017,
           dataset='WorldBank', id='life_expectancy_at_birth')
FieldTable(['year', 'Tax revenue (% of GDP)', ], year=2017, dataset='WorldBank',
           id='tax_as_percentage_of_gdp')
FieldTable(['year', 'Births attended by skilled health staff (% of total)', ],
           year=2017, dataset='WorldBank',
           id='births_attended_by_skilled_health_staff')
FieldTable(['Incidence of malaria (per 1,000 population at risk)', 'year', ],
           year=2017, dataset='WorldBank',
           id='incidence_of_malaria_per_1000_population_at_risk')
FieldTable(['Tax revenue (current LCU)', 'year', ], year=2017,
           dataset='WorldBank', id='tax_revenue')
FieldTable(['GDP (current US$)', 'year', ], year=2017, dataset='WorldBank',
           id='gdp')
FieldTable(['GDP growth (annual %)', 'year', ], year=2017, dataset='WorldBank',
           id='gdp_growth')
