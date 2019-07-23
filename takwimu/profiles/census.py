from collections import OrderedDict
import logging

from django.conf import settings
from wazimap.data.utils import dataset_context, merge_dicts, get_session, get_stat_data
from wazimap.models.data import DataNotFound
from wazimap.geo import geo_data

from takwimu.data.utils import get_primary_release_year_per_geography

log = logging.getLogger(__name__)

SECTIONS = settings.HURUMAP.get('topics', {})

LOCATIONNOTFOUND = {'is_missing': True, 'name': 'No Data Found',
                    'numerators': {'this': 0},
                    'values': {'this': 0}}

METADATA = {
    'kenya': {
        'country': {
            'donor_assistance_dist': {
                'qualifier': '\n'.join([
                    'ADF: African Development Fund',
                    'BMGF: Bill & Melinda Gates Foundation',
                    'GF: Global Fund',
                    'IDA: International Development Association',
                ]),
                'source': {
                    'link': 'http://www.oecd.org/dac/financing-sustainable-development/development-finance-data/aid-at-a-glance.htm',
                    'title': 'OECD, 2016',
                },
            },
            'crop_distribution': {
                'source': {
                    'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                    'title': 'Kenya National Bureau of Statistics, 2018',
                },
            },
            'employment_in_agriculture': {
                'source': {
                    'link': 'https://data.worldbank.org/indicator/SL.AGR.EMPL.MA.ZS?locations=KE',
                    'title': 'WorldBank, 2018',
                },
            },
            'health_workers_distribution_per_year': {
                'source': {
                    'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                    'title': 'Kenya National Bureau of Statistics, 2018',
                },
            },
            'women_in_government': {
                'source': {
                    'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                    'title': 'Kenya National Bureau of Statistics, 2018',
                },
            },
            'women_in_parliament': {
                'source': {
                    'link': 'https://data.worldbank.org/indicator/SG.GEN.PARL.ZS?end=2017&locations=KE&start=1997',
                    'title': 'WorldBank, 2017',
                },
            },
            'infant_under5_mortality': {
                'source': {
                    'link': 'https://data.worldbank.org/indicator/SP.DYN.IMRT.IN?end=2017&locations=KE&start=1990',
                    'title': 'WorldBank, 2017',
                },
            },
            'prevention_methods_dist': {
                'source': {
                    'link': 'https://dhsprogram.com/pubs/pdf/fr308/fr308.pdf',
                    'title': 'Kenya Demographic and Health Survey, 2014'
                },
            },
            'donor_programmes_dist': {
                'qualifier': '\n'.join([
                    'AGI: Adolescent Girls Initiative',
                    'DIFPARK: Delivering Increased Family Planning Across Rural Kenya',
                    'KMAP: Kenya Market Assistance Programme',
                    'RMNDK: Reducing Maternal and Newborn Deaths in Kenya',
                    'KCSAP: Kenya Climate Smart Agriculture Project',
                    'NARIGP: National Agricultural and Rural Inclusive Growth Project',
                    'PRIEDE: Primary Education Development Project',
                    'SEQUIP: Kenya Secondary Education Quality Improvement Project',
                    'THSUCP: Transforming Health Systems for Universal Care Project',
                ]),
                'source': {
                    'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                    'title': 'Kenya National Bureau of Statistics, 2018',
                },
            },
            'seized_firearms_dist': {
                'source': {
                    'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                    'title': 'Kenya National Bureau of Statistics, 2018',
                },
            },
            'health_centers_dist': {
                'source': {
                    'link': 'http://www.health.go.ke/wp-content/uploads/2016/04/Kenya-HRH-Strategy-2014-2018.pdf',
                    'title': 'Ministry of Health, 2014',
                },
            },
            'government_expenditure_dist': {
                'source': {
                    'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                    'title': 'Kenya National Bureau of Statistics, 2018',
                },
            },
            'poverty_age_dist': {
                'qualifier': '\n'.join([
                    'N: National',
                    'P: Peri-Urban',
                    'R: Rural',
                    'U: Urban',
                ]),
                'source': {
                    'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                    'title': 'Kenya National Bureau of Statistics, 2018',
                },
            },
            'poverty_residence_dist': {
                'source': {
                    'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                    'title': 'Kenya National Bureau of Statistics, 2018',
                },
            },
            'fgm_age_dist': {
                'source': {
                    'link': 'https://dhsprogram.com/pubs/pdf/fr308/fr308.pdf',
                    'title': 'Kenya Demographic and Health Survey, 2014'
                },
            },
            "gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?locations=KE",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=KE",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=KE",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=KE",
                    "title": "WorldBank"
                }
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=KE",
                    "title": "WorldBank"
                }
            },
            "gdp_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?locations=KE",
                    "title": "WorldBank"
                }
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=KE",
                    "title": "WorldBank"
                }
            },
            "primary_education_completion_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=KE",
                    "title": "WorldBank"
                }
            },
            "tax_revenue": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=KE",
                    "title": "WorldBank"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=KE",
                    "title": "WorldBank"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=KE",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=KE",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=KE",
                    "title": "WorldBank"
                }
            },
            "access_to_basic_services": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=KE",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=KE",
                    "title": "WorldBank"
                }
            },
            "physicians_nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=KE",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=KE",
                    "title": "WorldBank"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=KE",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=KE",
                    "title": "WorldBank"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=KE",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=KE",
                    "title": "WorldBank"
                }
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=KE",
                    "title": "WorldBank"
                }
            },
            "fgm_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=KE",
                    "title": "WorldBank"
                }
            },
            "nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=KE",
                    "title": "WorldBank"
                }
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=KE",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "hiv_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=KE",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=KE",
                    "title": "WorldBank"
                }
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=KE",
                    "title": "WorldBank"
                }
            },
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=KE",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
        },
    },
    'nigeria': {
        'country': {
            "sex_dist_per_year": {
                'source': {
                    'link': 'https://nigerianstat.gov.ng/resource/POPULATION%20PROJECTION%20Nigeria%20sgfn.xls',
                    'title': 'Nigeria Bureau of Statistics, 2016',
                },
            },
            "senior_secondary_school_enrollment": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "junior_secondary_school_enrollment": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "primary_school_enrollment_distribution": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "primary_school_completion_sex": {
                "source": {
                    "link": "https://www.nemis.gov.ng/downloads_fold/Nigeria%20Education%20Indicators%202016.pdf#page=13",
                    "title": "Nigeria Federal Ministry of Education, 2016"
                }
            },
            "literacy_sex": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": "National Bureau of Statistics, 2018"
                }
            },
            "prevalence_fgm": {
                "source": {
                    "link": "https://mics-surveys-prod.s3.amazonaws.com/MICS5/West%20and%20Central%20Africa/Nigeria/2016-2017/Final/Nigeria%202016-17%20MICS_English.zip",
                    "title": "MICS, 2016-17"
                }
            },
            "malaria_prevalence": {
                "source": {
                    "link": "https://dhsprogram.com/pubs/pdf/MIS20/MIS20.pdf",
                    "title": "Nigeria Demographic Health Survey, 2015"
                }
            },
            "hiv_patients_distribution": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": "National Bureau of Statistics, 2018"
                }
            },
            "doctors_per_sex_year": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": "National Bureau of Statistics, 2018"
                }
            },
            "dentists_per_sex_year": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": "National Bureau of Statistics, 2018"
                }
            },
            "human_development_indices": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/830",
                    "title": "Computation of Human Development Indices for the UNDP Nigeria Human Development Report (2016)"
                }
            },
            "youth_unemployment_2017": {
                "source": {
                    "link": "https://africacheck.org/wp-content/uploads/2018/03/q1-q3_2017_unemployment_report_VOLUME_1-1.pdf2",
                    "title": "National Bureau of Statistics, 2017"
                }
            },
            "access_to_electricity_water": {
                "source": {
                    "link": "http://microdata.worldbank.org/index.php/catalog/3002/download/41925",
                    "title": "Nigeria National Bureau of Statistics, 2017"
                }
            },
            "account_ownership_indicator": {
                "source": {
                    "link": "https://mics-surveys-prod.s3.amazonaws.com/MICS5/West%20and%20Central%20Africa/Nigeria/2016-2017/Final/Nigeria%202016-17%20MICS_English.zip",
                    "title": "Multiple Indicator Cluster Survey, 2016-17"
                }
            },
            'child_births_by_size_dist': {
                'source': {
                    'link': 'https://dhsprogram.com/pubs/pdf/fr293/fr293.pdf',
                    'title': 'Nigeria Demographic and Health Survey 2013',
                },
            },
            "gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?locations=NG",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=NG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=NG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=NG",
                    "title": "WorldBank"
                }
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=NG",
                    "title": "WorldBank"
                }
            },
            "gdp_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?locations=NG",
                    "title": "WorldBank"
                }
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=NG",
                    "title": "WorldBank"
                }
            },
            "primary_education_completion_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=NG",
                    "title": "WorldBank"
                }
            },
            "tax_revenue": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=NG",
                    "title": "WorldBank"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=NG",
                    "title": "WorldBank"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=NG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=NG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=NG",
                    "title": "WorldBank"
                }
            },
            "access_to_basic_services": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=NG",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=NG",
                    "title": "WorldBank"
                }
            },
            "physicians_nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=NG",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://msdat.fmohconnect.gov.ng/#/central_analytics/ODY",
                    "title": "Federal Ministry of Health, 2018"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=NG",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=NG",
                    "title": "WorldBank"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=NG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=NG",
                    "title": "WorldBank"
                }
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=NG",
                    "title": "WorldBank"
                }
            },
            "fgm_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=NG",
                    "title": "WorldBank"
                }
            },
            "nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=NG",
                    "title": "WorldBank"
                }
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=NG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "hiv_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=NG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=NG",
                    "title": "WorldBank"
                }
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=NG",
                    "title": "WorldBank"
                }
            },
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=NG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
        },
        'level1': {
            "sex_dist_per_year": {
                'source': {
                    'link': 'https://nigerianstat.gov.ng/resource/POPULATION%20PROJECTION%20Nigeria%20sgfn.xls',
                    'title': 'Nigeria Bureau of Statistics, 2016',
                },
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "senior_secondary_school_enrollment": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "junior_secondary_school_enrollment": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "primary_school_enrollment_distribution": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://msdat.fmohconnect.gov.ng/#/central_analytics/ODY",
                    "title": "Federal Ministry of Health, 2018"
                }
            },
            "primary_school_completion_sex": {
                "source": {
                    "link": "https://www.nemis.gov.ng/downloads_fold/Nigeria%20Education%20Indicators%202016.pdf#page=13",
                    "title": "Nigeria Federal Ministry of Education, 2016"
                }
            },
            "literacy_sex": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "prevalence_fgm": {
                "source": {
                    "link": "https://mics-surveys-prod.s3.amazonaws.com/MICS5/West%20and%20Central%20Africa/Nigeria/2016-2017/Final/Nigeria%202016-17%20MICS_English.zip",
                    "title": "MICS, 2016-17"
                }
            },
            "malaria_prevalence": {
                "source": {
                    "link": "https://dhsprogram.com/pubs/pdf/MIS20/MIS20.pdf",
                    "title": "Nigeria Demographic Health Survey, 2015"
                }
            },
            "hiv_patients_distribution": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": " National Bureau of Statistics, 2018"
                }
            },
            "doctors_per_sex_year": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": "National Bureau of Statistics, 2018"
                }
            },
            "dentists_per_sex_year": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/952",
                    "title": "National Bureau of Statistics, 2018"
                }
            },
            "human_development_indices": {
                "source": {
                    "link": "https://nigerianstat.gov.ng/download/830",
                    "title": "Computation of Human Development Indices for the UNDP Nigeria Human Development Report (2016)"
                }
            },
            "access_to_electricity_water": {
                "source": {
                    "link": "http://microdata.worldbank.org/index.php/catalog/3002/download/41925",
                    "title": "Nigeria National Bureau of Statistics, 2017"
                }
            },
            "account_ownership_indicator": {
                "source": {
                    "link": "https://mics-surveys-prod.s3.amazonaws.com/MICS5/West%20and%20Central%20Africa/Nigeria/2016-2017/Final/Nigeria%202016-17%20MICS_English.zip",
                    "title": "Multiple Indicator Cluster Survey, 2016-17"
                }
            },
            "youth_unemployment_2017": {
                "source": {
                    "link": "https://africacheck.org/wp-content/uploads/2018/03/q1-q3_2017_unemployment_report_VOLUME_1-1.pdf2",
                    "title": "National Bureau of Statistics, 2017"
                }
            }
        }
    },
    'ethiopia': {
        'country': {
            'sex_dist': {
                'source': {
                    'link': 'http://www.ethiopianreview.com/pdf/001/Cen2007_firstdraft(1).pdf',
                    'title': 'Summary and Statistical Report of the 2007 Population and Housing Census'
                },
            },
            'residence_dist': {
                'source': {
                    'link': 'http://www.ethiopianreview.com/pdf/001/Cen2007_firstdraft(1).pdf',
                    'title': 'Summary and Statistical Report of the 2007 Population and Housing Census'
                },
            },
            "gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?locations=ET",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=ET",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=ET",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=ET",
                    "title": "WorldBank"
                }
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=ET",
                    "title": "WorldBank"
                }
            },
            "gdp_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?locations=ET",
                    "title": "WorldBank"
                }
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=ET",
                    "title": "WorldBank"
                }
            },
            "primary_education_completion_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=ET",
                    "title": "WorldBank"
                }
            },
            "tax_revenue": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=ET",
                    "title": "WorldBank"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=ET",
                    "title": "WorldBank"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=ET",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=ET",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=ET",
                    "title": "WorldBank"
                }
            },
            "access_to_basic_services": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=ET",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=ET",
                    "title": "WorldBank"
                }
            },
            "physicians_nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=ET",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=ET",
                    "title": "WorldBank"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=ET",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=ET",
                    "title": "WorldBank"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=ET",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=ET",
                    "title": "WorldBank"
                }
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=ET",
                    "title": "WorldBank"
                }
            },
            "fgm_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=ET",
                    "title": "WorldBank"
                }
            },
            "nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=ET",
                    "title": "WorldBank"
                }
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=ET",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "hiv_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=ET",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=ET",
                    "title": "WorldBank"
                }
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=ET",
                    "title": "WorldBank"
                }
            },
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=ET",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            }
        }
    },
    'south africa': {
        "country": {
            "gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=ZA",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=ZA",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "gdp_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "primary_education_completion_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "tax_revenue": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=ZA",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=ZA",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "access_to_basic_services": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "physicians_nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=ZA",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "fgm_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=ZA",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "hiv_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=ZA",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=ZA",
                    "title": "WorldBank"
                }
            },
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=ZA",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            }
        }},
    'tanzania': {
        'country': {
            "gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=TZ",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=TZ",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "gdp_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "primary_education_completion_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "tax_revenue": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=TZ",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=TZ",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "access_to_basic_services": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "physicians_nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=TZ",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "fgm_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=TZ",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "hiv_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=TZ",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=TZ",
                    "title": "WorldBank"
                }
            },
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=TZ",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            }
        }},
    'senegal': {
        'country': {
            "gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?locations=SN",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=SN",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=SN",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=SN",
                    "title": "WorldBank"
                }
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=SN",
                    "title": "WorldBank"
                }
            },
            "gdp_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG?locations=SN",
                    "title": "WorldBank"
                }
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=SN",
                    "title": "WorldBank"
                }
            },
            "primary_education_completion_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=SN",
                    "title": "WorldBank"
                }
            },
            "tax_revenue": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=SN",
                    "title": "WorldBank"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=SN",
                    "title": "WorldBank"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=SN",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=SN",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=SN",
                    "title": "WorldBank"
                }
            },
            "access_to_basic_services": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=SN",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=SN",
                    "title": "WorldBank"
                }
            },
            "physicians_nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=SN",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=SN",
                    "title": "WorldBank"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=SN",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=SN",
                    "title": "WorldBank"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=SN",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=SN",
                    "title": "WorldBank"
                }
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=SN",
                    "title": "WorldBank"
                }
            },
            "fgm_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=SN",
                    "title": "WorldBank"
                }
            },
            "nurses_and_midwives": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=SN",
                    "title": "WorldBank"
                }
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=SN",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "hiv_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=SN",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=SN",
                    "title": "WorldBank"
                }
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=SN",
                    "title": "WorldBank"
                }
            },
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=SN",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            }
        }},
    'burkina-faso': {
        'country': {
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=BF",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.MA.ZS?locations=BF",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=BF"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=BF",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=BF",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=BF",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=BF",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=BF",
                    "title": "WorldBank"
                }
            },
            "fgm_prevalence": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=BF",
                    "title": "WorldBank"
                }
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=BF",
                    "title": "WorldBank, 2017"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=BF",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=BF",
                    "title": "WorldBank, 2017"
                }
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=BF",
                    "title": "WorldBank, 2017"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=BF",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=BF",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=BF",
                    "title": "WorldBank, 2018"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=BF",
                    "title": "WorldBank, 2017"
                }
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=BF",
                    "title": "WorldBank, 2017"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=BF",
                    "title": "WorldBank, 2018"
                }
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=BF",
                    "title": "WorldBank, 2017"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=BF",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=BF",
                    "title": "WorldBank, 2017"
                }
            }
        }
    },
    'democratic-republic-of-congo':{
        'country': {
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=CD",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=CD",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=CD",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=CD",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=CD",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=CD",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=CD",
                    "title": "WorldBank"
                }
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=CD",
                    "title": "WorldBank, 2018"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=CD",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=CD",
                    "title": "WorldBank, 2017"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=CD",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=CD",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=CD",
                    "title": "WorldBank, 2018"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=CD",
                    "title": "WorldBank, 2017"
                }
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=CD",
                    "title": "WorldBank, 2017"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=CD",
                    "title": "WorldBank, 2018"
                }
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=CD",
                    "title": "WorldBank, 2017"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=CD",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=CD",
                    "title": "WorldBank, 2017"
                }
            }
        }
    },
    'uganda':{
        'country': {
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=UG",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=UG",
                    "title": "WorldBank, 2013"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=UG",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=UG",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=UG",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=UG",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=UG",
                    "title": "WorldBank"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=UG",
                    "title": "WorldBank, 2017"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=UG",
                    "title": "WorldBank, 2017"
                }
            },
            "secondary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=UG",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=UG",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=UG",
                    "title": "WorldBank, 2017"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=UG",
                    "title": "WorldBank, 2017"
                }
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=UG",
                    "title": "WorldBank, 2017"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=UG",
                    "title": "WorldBank, 2018"
                }
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=UG",
                    "title": "WorldBank, 2017"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=UG",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=UG",
                    "title": "WorldBank, 2016"
                }
            }
        }
    },
    'zambia':{
        'country': {
            "account_ownership": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=ZM",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "adult_literacy_rate": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=ZM",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "agricultural_land": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=ZM",
                    "title": "WorldBank"
                }
            },
            "births_attended_by_skilled_health_staff": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=ZM",
                    "title": "WorldBank"
                }
            },
            "cereal_yield_kg_per_hectare": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=ZM",
                    "title": "WorldBank"
                }
            },
            "employment_to_population_ratio": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=ZM",
                    "title": "WorldBank"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "foreign_direct_investment_net_inflows": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/?locations=ZM",
                    "title": "WorldBank"
                }
            },
            "gdp_per_capita": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.CD?locations=ZM",
                    "title": "WorldBank, 2017"
                }
            },
            "youth_unemployment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=ZM",
                    "title": "WorldBank, 2017"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "prevalence_of_undernourishment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=ZM",
                    "title": "WorldBank"
                }
            },
            "tax_as_percentage_of_gdp": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=ZM",
                    "title": "WorldBank, 2017"
                }
            },
            "primary_school_enrollment": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=ZM",
                    "title": "WorldBank, 2018"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "total_population": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.POP.TOTL?locations=ZM",
                    "title": "WorldBank, 2018"
                }
            },
            "mobile_phone_subscriptions": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=ZM",
                    "title": "WorldBank, 2017"
                }
            },
            "gini_index": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SI.POV.GINI?locations=ZM",
                    "title": "WorldBank, 2017"
                }
            },
            "gdp_per_capita_growth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/NY.GDP.PCAP.KD.ZG?locations=ZM",
                    "title": "WorldBank, 2018"
                }
            },
            "life_expectancy_at_birth": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=ZM",
                    "title": "WorldBank, 2017"
                },
                "qualifier": "M: Male\nF: Female"
            },
            "maternal_mortality": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.STA.MMRT?locations=ZM",
                    "title": "WorldBank"
                }
            },
            "incidence_of_malaria_per_1000_pop_at_risk": {
                "source": {
                    "link": "https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=ZM",
                    "title": "WorldBank, 2016"
                }
            },
        }
    }
}

def get_appropriate_dbtable(country, table_prefix):
    pass


def get_profile(geo, profile_name, request):
    session = get_session()
    (country, level) = get_country_and_level(geo)
    comparative_geos = geo_data.get_comparative_geos(geo)
    sections = list(SECTIONS)
    data = {}
    try:
        for section in sections:
            function_name = 'get_%s_profile' % section
            if function_name in globals():
                func = globals()[function_name]
                data[section] = func(geo, session, country, level)
                # get profiles for comparative geometries
                if not data[section]['is_missing'] and not data[section]['is_missing'] is None:
                    for comp_geo in comparative_geos:
                        try:
                            merge_dicts(
                                data[section], func(
                                    comp_geo, session, country, level), comp_geo.geo_level)
                        except KeyError as e:
                            msg = "Error merging data into %s for section '%s' from %s: KeyError: %s" % (
                                geo.geoid, section, comp_geo.geoid, e)
                            log.fatal(msg, exc_info=e)
                            raise ValueError(msg)

        tabs = OrderedDict({'all': {'name': 'All', 'href': ''}})
        if not (data['demographics']['is_missing'] and \
                data['worldbank']['youth_unemployment'].get('is_missing') and \
                data['worldbank']['employment_to_population_ratio'].get('is_missing') and \
                data['poverty'].get('is_missing')):
            tabs['demographics'] = {'name': 'Demographics', 'href': '#demographics'}

        if not (data['elections'].get('is_missing') and \
                data['worldbank']['women_in_parliament'].get('is_missing')  and \
                data['worldbank']['women_in_government'].get('is_missing')):
            tabs['elections'] = {'name': 'Elections', 'href': '#elections'}

        if not (data['fgm'].get('is_missing') and \
                data['health_workers'].get('is_missing') and \
                data['health'].get('is_missing') and \
                data['worldbank']['access_to_basic_services'].get('is_missing') and \
                data['worldbank']['prevalence_of_undernourishment'].get('is_missing') and \
                data['worldbank']['maternal_mortality'].get('is_missing')):
            tabs['health'] = {'name': 'Health', 'href': '#health'}

        if not (data['crops']['crop_distribution'].get('is_missing') and \
                data['worldbank']['agricultural_land'].get('is_missing') and \
                data['worldbank']['cereal_yield_kg_per_hectare'].get('is_missing')):
            tabs['agriculture'] = {'name': 'Agriculture', 'href': '#agriculture'}

        if not (data['education']['is_missing'] and \
                data['worldbank']['primary_school_enrollment'].get('is_missing') and \
                data['worldbank']['adult_literacy_rate'].get('is_missing') and \
                data['worldbank']['secondary_school_enrollment'].get('is_missing')):
            tabs['education'] = { 'name': 'Education', 'href': '#education' }

        if not (data['financial_inclusion'].get('is_missing') and \
                data['worldbank']['account_ownership'].get('is_missing') and \
                data['worldbank']['mobile_phone_subscriptions'].get('is_missing')):
            tabs['financial_inclusion'] = {'name': 'Financial Inclusion', 'href': '#financial-inclusion'}

        if not data['budget'].get('is_missing'):
            tabs['budget'] = {'name': 'Budget', 'href': '#budget'}

        if not data['worldbank'].get('is_missing'):
            tabs['public_finances'] = {'name': 'Public Finances', 'href': '#public-finances'}

        if not (data['donors'].get('is_missing') and \
                data['worldbank']['foreign_direct_investment_net_inflows'].get('is_missing')):
            tabs['oda'] = {'name': 'ODA', 'href': '#oda'}

        data['tabs'] = tabs
        return data
    finally:
        session.close()


def get_country_and_level(geo):
    level = geo.geo_level.lower()
    country = ''
    if level != 'continent':
        country = geo.name.lower() \
            if level == 'country' \
            else geo.ancestors()[-2].name.lower() #-1 (last element is continent)

    return (country, level)


def get_demographics_profile(geo, session, country, level):
    year = get_primary_release_year_per_geography(geo)
    population_data = get_population(geo, session, country, level, year)
    child_births_data = get_child_births(geo, session, country, level)
    demographics_data = dict(
        list(population_data.items()) + list(child_births_data.items()))
    demographics_data['is_missing'] = population_data.get('is_missing')

    return demographics_data


def get_population(geo, session, country, level, year):
    sex_dist, total_population_sex = LOCATIONNOTFOUND, 0
    residence_dist, total_population_residence = LOCATIONNOTFOUND, 0
    sex_dist_per_year = LOCATIONNOTFOUND
    human_development_indices_dist = LOCATIONNOTFOUND
    youth_unemployment_dist = LOCATIONNOTFOUND

    db_table = db_column_name = 'population_sex_' + str(year)
    try:
        sex_dist, total_population_sex = get_stat_data(
            db_table, geo, session, table_fields=[db_column_name])

    except Exception:
        pass

    try:
        db_table = db_column_name = 'population_residence_' + str(year)
        residence_dist, total_population_residence = get_stat_data(
            db_table, geo, session,
            table_fields=[db_column_name])
    except Exception:
        pass

    with dataset_context(year='2018'):
        try:
            human_development_indices_dist, _ = get_stat_data(
                ['human_dev_indices'], geo, session, percent=False)
        except Exception:
            pass

        try:
            youth_unemployment_dist, _ = get_stat_data(['youth_unemployment_period'], geo, session,
                                    percent=False )
        except Exception:
            pass

    with dataset_context(year='2016'):
        try:
            sex_dist_per_year, _ = get_stat_data( ['population_year', 'population_sex'], geo, session,
                                    table_name='population_sex_year' )
        except Exception:
            pass

    total_population = 0
    is_missing = sex_dist.get('is_missing') and \
                 residence_dist.get('is_missing') and \
                 sex_dist_per_year.get('is_missing') and \
                human_development_indices_dist.get('is_missing') and \
                    youth_unemployment_dist.get('is_missing')
    if not is_missing:
        total_population = total_population_sex if total_population_sex > 0 else total_population_residence

    #if total population is 0, take world bank tot population
    if total_population == 0:
        with dataset_context(year='2017'):
            try:
                _, worldbank_population = get_stat_data(['total_population_year' ],
                                                    geo, session, only={'total_population_year': ['2017']}, percent=False)
                total_population = worldbank_population
            except Exception:
                pass

    total_population_dist = _create_single_value_dist(
        'People', total_population)

    demographics_data = {
        'is_missing': is_missing,
        'sex_dist': _add_metadata_to_dist(sex_dist, 'sex_dist', country, level),
        'sex_dist_per_year': _add_metadata_to_dist(sex_dist_per_year, 'sex_dist_per_year', country, level),
        'residence_dist': _add_metadata_to_dist(residence_dist,
                                                'residence_dist', country,
                                                level),
        'human_development_indices': _add_metadata_to_dist(human_development_indices_dist,
                                                'human_development_indices', country,
                                                level),   
        'youth_unemployment_2017': _add_metadata_to_dist(youth_unemployment_dist,
                                                'youth_unemployment_2017', country, level),

        'total_population': _add_metadata_to_dist(total_population_dist,
                                                  'total_population_dist',
                                                  country, level),
    }

    if geo.square_kms:
        demographics_data['population_density'] = {
            'name': "people per square kilometre",
            'values': {"this": total_population / geo.square_kms},
        }
    return demographics_data


def _create_single_value_dist(name='', value=0):
    return {
        'name': name,
        'numerators': {'this': value},
        'values': {'this': value},
    }


def _add_metadata_to_dist(dist, dist_name, country, level):
    if not dist.get('is_missing'):
        country_metadata = METADATA.get(country)
        if country_metadata:
            level_metadata = country_metadata.get(level)

            # Revert to 'country' level metadata if level-specific metadata is missing
            level_metadata = level_metadata \
                if level_metadata or level == 'country' \
                else country_metadata.get('country')
            if level_metadata:
                metadata = level_metadata.get(dist_name)
                if metadata:
                    # Only update relevant keys, don't replace the whole thing
                    dist['metadata'].update(metadata)
    return dist


def get_child_births(geo, session, country, level):
    with dataset_context(year='2014'):
        child_births_dist, total_child_births = LOCATIONNOTFOUND, 0
        child_births_by_size_dist = LOCATIONNOTFOUND
        total_reported_birth_weights = 0
        total_low_birth_weights = 0

        try:
            child_births_dist, total_child_births = get_stat_data(
                'child_births', geo, session, order_by='-total')
        # except Exception:
        #     pass
        # except DataNotFound:
        #     pass
        # except ValueError:
        #     pass
        except Exception as e:
            pass

        try:
            child_births_by_size_dist, _ = get_stat_data(
                'size', geo, session, table_fields=['size'],
                table_name='child_births_by_size')
        except Exception:
            pass
        except DataNotFound:
            pass
        except ValueError:
            pass

        try:
            _, total_reported_birth_weights = get_stat_data(
                'reported_birth_weights', geo, session,
                table_fields=['reported_birth_weights'],
                table_name='child_births_with_reported_birth_weights',
                order_by='-total')
        except Exception:
            pass
        except DataNotFound:
            pass
        except ValueError:
            pass

        try:
            _, total_low_birth_weights = get_stat_data(
                'low_birth_weights', geo, session,
                table_fields=['low_birth_weights'],
                table_name='child_births_with_low_birth_weights')
        except Exception:
            pass
        except DataNotFound:
            pass
        except ValueError:
            pass

    is_missing = child_births_dist.get('is_missing')
    total_child_births_dist = _create_single_value_dist(
        'Total births', total_child_births)
    total_reported_birth_weights_dist = _create_single_value_dist(
        'Of all births have a reported birth weight',
        total_reported_birth_weights)
    total_low_birth_weights_dist = _create_single_value_dist(
        'Of all reported birth weights are less than 2.5 kg',
        total_low_birth_weights)

    return {
        'is_missing': is_missing,
        'child_births_dist': child_births_dist,
        'total_child_births_dist': total_child_births_dist,
        'child_births_by_size_dist': _add_metadata_to_dist(
            child_births_by_size_dist, 'child_births_by_size_dist', country,
            level),
        'total_reported_birth_weights_dist': total_reported_birth_weights_dist,
        'total_low_birth_weights_dist': total_low_birth_weights_dist,
    }


def get_elections_profile(geo, session, country, level):
    with dataset_context(year='2014'):
        candidate_dist = LOCATIONNOTFOUND
        valid_invalid_dist = LOCATIONNOTFOUND
        registered_accred_dist = LOCATIONNOTFOUND

        # Each of these fetches may fail due to data unavailability but failure of one
        # does not imply failure of another i.e. they are independent.
        try:
            candidate_dist, _ = get_stat_data(
                'candidate', geo, session, table_fields=['candidate'])
        except Exception:
            pass

        try:
            valid_invalid_dist, _ = get_stat_data('votes', geo, session,
                                                  table_fields=[
                                                      'votes'],
                                                  table_name='valid_invalid_votes')
        except Exception:
            pass

        try:
            registered_accred_dist, _ = get_stat_data('voters', geo, session,
                                                      table_fields=[
                                                          'voters'],
                                                      table_name='registered_accredited_voters')
        except Exception:
            pass

    is_missing = candidate_dist.get('is_missing') and \
                 valid_invalid_dist.get('is_missing') and \
                 registered_accred_dist.get('is_missing')
    return {
        'is_missing': is_missing,
        'candidate_dist': candidate_dist,
        'valid_invalid_dist': valid_invalid_dist,
        'registered_accred_dist': registered_accred_dist,
    }


def get_crops_profile(geo, session, country, level):
    with dataset_context(year='2014'):
        crop_distribution = LOCATIONNOTFOUND

        try:
            crop_distribution, _ = get_stat_data(
                'crops', geo, session, table_fields=['crops'])
        except Exception as e:
            pass
            
    return {
        'is_missing': crop_distribution.get('is_missing'),
        'crop_distribution': _add_metadata_to_dist(
            crop_distribution, 'crop_distribution', country, level)
    }


def get_health_centers_profile(geo, session, country, level):
    with dataset_context(year='2014'):
        health_centers_dist, total_health_centers = LOCATIONNOTFOUND, 0
        health_centers_ownership_dist = LOCATIONNOTFOUND
        hiv_health_centers_dist, total_hiv_health_centers = LOCATIONNOTFOUND, 0
        prevention_methods_dist = LOCATIONNOTFOUND

        try:
            health_centers_dist, total_health_centers = get_stat_data(
                'centers', geo, session, table_name='health_centers',
                order_by='-total')
        except Exception:
            pass

        try:
            hiv_health_centers_dist, total_hiv_health_centers = get_stat_data(
                'centers', geo, session, table_name='hiv_health_centers',
                order_by='-total')
        except Exception:
            pass

        try:
            health_centers_ownership_dist, _ = get_stat_data(
                'organization_type', geo, session,
                table_name='health_centers_ownership', order_by='-total')
        except Exception:
            pass

        try:
            prevention_methods_dist, _ = get_stat_data(['method', 'sex'], geo,
                                                       session)
        except Exception:
            pass

    is_missing = health_centers_dist.get('is_missing') and \
                 health_centers_ownership_dist.get('is_missing') and \
                 hiv_health_centers_dist.get('is_missing') and \
                 prevention_methods_dist.get('is_missing')
    total_health_centers_dist = _create_single_value_dist(
        'Total health centers in operation (2014)', total_health_centers)
    total_hiv_health_centers_dist = _create_single_value_dist(
        'HIV care and treatment centers (2014)', total_hiv_health_centers)
    return {
        'is_missing': is_missing,
        'health_centers_dist': _add_metadata_to_dist(
            health_centers_dist, 'health_centers_dist', country, level),
        'total_health_centers_dist': total_health_centers_dist,
        'hiv_health_centers_dist': hiv_health_centers_dist,
        'total_hiv_health_centers_dist': total_hiv_health_centers_dist,
        'health_centers_ownership_dist': health_centers_ownership_dist,
        'prevention_methods_dist': _add_metadata_to_dist(
            prevention_methods_dist, 'prevention_methods_dist', country, level),
    }


def get_health_workers_profile(geo, session, country, level):
    health_workers_dist, total_health_workers = LOCATIONNOTFOUND, 0
    hrh_patient_ratio = 0
    health_workers_distribution_per_year = LOCATIONNOTFOUND
    doctors_per_sex_year_dist = LOCATIONNOTFOUND
    dentists_per_sex_year_dist = LOCATIONNOTFOUND
    
    with dataset_context(year='2014'):
        try:
            health_workers_dist, total_health_workers = get_stat_data(
                'workers', geo, session, table_name='health_workers',
                order_by='-total')
            hrh_patient_ratio = \
                health_workers_dist['HRH patient ratio']['numerators']['this']
            del health_workers_dist['HRH patient ratio']
            del health_workers_dist['MO and AMO per 10000']
            del health_workers_dist['Nurses and midwives per 10000']
            del health_workers_dist['Pharmacists per 10000']
            del health_workers_dist['Clinicians per 10000']

        except Exception:
            pass

        try:
            health_workers_distribution_per_year, _ = get_stat_data(
                ['workers', 'year'], geo, session, percent=False)
        except Exception as e:
            pass
    with dataset_context(year='2018'):
        try:
            doctors_per_sex_year_dist, _ = get_stat_data(
                ['number_of_dentist_year', 'number_of_dentist_sex'], geo, session, percent=False)
        except Exception as e:
            pass
        
        try:
            dentists_per_sex_year_dist, _ = get_stat_data(
                ['number_of_doctors_year', 'number_of_doctors_sex'], geo, session, percent=False)
        except Exception as e:
            pass


    total_health_workers_dist = _create_single_value_dist(
        'Total health worker population (2014)', total_health_workers)
    hrh_patient_ratio_dist = _create_single_value_dist(
        'Skilled health worker to patient ratio (2014)', hrh_patient_ratio)

    is_missing = health_workers_dist.get('is_missing') and \
        health_workers_distribution_per_year.get('is_missing') and \
            doctors_per_sex_year_dist.get('is_missing') and \
                dentists_per_sex_year_dist.get("is_missing")
    return {
        'is_missing': is_missing,
        'total_health_workers_dist': total_health_workers_dist,
        'hrh_patient_ratio_dist': hrh_patient_ratio_dist,
        'health_workers_dist': health_workers_dist,
        'health_workers_distribution_per_year': _add_metadata_to_dist(health_workers_distribution_per_year, 
                    'health_workers_distribution_per_year', country, level),
        'doctors_per_sex_year': _add_metadata_to_dist(doctors_per_sex_year_dist, 
                    'doctors_per_sex_year', country, level),
        'dentists_per_sex_year': _add_metadata_to_dist(dentists_per_sex_year_dist, 
                    'dentists_per_sex_year', country, level),
    } 


def get_causes_of_death_profile(geo, session, country, level):
    with dataset_context(year='2014'):
        causes_of_death_under_five_dist = LOCATIONNOTFOUND
        causes_of_death_over_five_dist = LOCATIONNOTFOUND
        inpatient_diagnosis_over_five_dist = LOCATIONNOTFOUND
        inpatient_diagnosis_under_five_dist = LOCATIONNOTFOUND
        outpatient_diagnosis_over_five_dist = LOCATIONNOTFOUND
        outpatient_diagnosis_under_five_dist = LOCATIONNOTFOUND

        try:
            causes_of_death_under_five_dist, _ = get_stat_data(
                'causes_of_death_under_five', geo, session, order_by='-total')
        except Exception:
            pass

        try:
            causes_of_death_over_five_dist, _ = get_stat_data(
                'causes_of_death_over_five', geo, session, order_by='-total')
        except Exception:
            pass

        try:
            inpatient_diagnosis_under_five_dist, _ = get_stat_data(
                'inpatient_diagnosis_under_five', geo, session,
                order_by='-total')
        except Exception:
            pass

        try:
            inpatient_diagnosis_over_five_dist, _ = get_stat_data(
                'inpatient_diagnosis_over_five', geo, session,
                order_by='-total')
        except Exception:
            pass

        try:
            outpatient_diagnosis_over_five_dist, _ = get_stat_data(
                'outpatient_diagnosis_over_five', geo, session,
                order_by='-total')
        except Exception:
            pass

        try:
            outpatient_diagnosis_under_five_dist, _ = get_stat_data(
                'outpatient_diagnosis_under_five', geo, session,
                order_by='-total')
        except Exception:
            pass

    is_missing = causes_of_death_over_five_dist.get('is_missing') and \
                 causes_of_death_under_five_dist.get('is_missing') and \
                 inpatient_diagnosis_under_five_dist.get('is_missing') and \
                 inpatient_diagnosis_over_five_dist.get('is_missing') and \
                 outpatient_diagnosis_under_five_dist.get('is_missing') and \
                 outpatient_diagnosis_over_five_dist.get('is_missing')
    return {
        'is_missing': is_missing,
        'causes_of_death_under_five_dist': causes_of_death_under_five_dist,
        'causes_of_death_over_five_dist': causes_of_death_over_five_dist,
        'inpatient_diagnosis_under_five_dist': inpatient_diagnosis_under_five_dist,
        'inpatient_diagnosis_over_five_dist': inpatient_diagnosis_over_five_dist,
        'outpatient_diagnosis_over_five_dist': outpatient_diagnosis_over_five_dist,
        'outpatient_diagnosis_under_five_dist': outpatient_diagnosis_under_five_dist,
    }


def get_health_profile(geo, session, country, level):
    hiv_patients_distribution_dist = LOCATIONNOTFOUND
    malaria_prevalence_dist = LOCATIONNOTFOUND
    access_to_electricity_water_dist = LOCATIONNOTFOUND

    with dataset_context( year='2018'):
        try:
            hiv_patients_distribution_dist, _ = get_stat_data(
                ['hiv_patients_distribution_year', 'sex'], geo, session, percent=False)
        except Exception:
            pass
        
        try:
            malaria_prevalence_dist, _ = get_stat_data(
                ['malaria_prevalence_test'], geo, session, percent=False)
        except Exception:
            pass

        try:
            access_to_electricity_water_dist, _ = get_stat_data(
                ['access_to_elec_water_services'], geo, session, percent=False)
        except Exception:
            pass
    

    return {
        'is_missing': malaria_prevalence_dist.get('is_missing') and \
            hiv_patients_distribution_dist.get('is_missing') and \
                access_to_electricity_water_dist.get('is_missing'),
        'malaria_prevalence': _add_metadata_to_dist(malaria_prevalence_dist,
                                                    'malaria_prevalence',
                                                    country, level),
        'hiv_patients_distribution': _add_metadata_to_dist(hiv_patients_distribution_dist,
                                                    'hiv_patients_distribution',
                                                    country, level),
        'access_to_electricity_water': _add_metadata_to_dist(access_to_electricity_water_dist,
                                                    'access_to_electricity_water',
                                                    country, level),
    }


def get_donors_profile(geo, session, country, level):
    with dataset_context(year='2014'):
        donor_assistance_dist = LOCATIONNOTFOUND
        donor_programmes_dist = LOCATIONNOTFOUND
        try:
            donor_assistance_dist, _ = get_stat_data(['donor'], geo, session)
        except Exception:
            pass

        try:
            donor_programmes_dist, _ = get_stat_data(
                ['donor', 'programme'], geo, session)
        except Exception:
            pass

        is_missing = donor_assistance_dist.get('is_missing') and \
                     donor_programmes_dist.get('is_missing')

    return {
        'is_missing': is_missing,
        'donor_assistance_dist': _add_metadata_to_dist(donor_assistance_dist,
                                                       'donor_assistance_dist',
                                                       country, level),
        'donor_programmes_dist': _add_metadata_to_dist(donor_programmes_dist,
                                                       'donor_programmes_dist',
                                                       country, level),
    }


def get_poverty_profile(geo, session, country, level):
    with dataset_context(year='2014'):
        poverty_residence_dist = LOCATIONNOTFOUND
        poverty_age_dist = LOCATIONNOTFOUND
        try:
            poverty_residence_dist, _ = get_stat_data(
                ['poverty_type', 'residence'], geo, session)
        except Exception:
            pass

        try:
            poverty_age_dist, _ = get_stat_data(['age', 'residence'], geo,
                                                session)
        except Exception:
            pass

    is_missing = poverty_residence_dist.get('is_missing') and \
                 poverty_age_dist.get('is_missing')
    return {
        'is_missing': is_missing,
        'poverty_residence_dist': _add_metadata_to_dist(poverty_residence_dist,
                                                        'poverty_residence_dist',
                                                        country, level),
        'poverty_age_dist': _add_metadata_to_dist(poverty_age_dist,
                                                  'poverty_age_dist', country,
                                                  level),
    }


def get_fgm_profile(geo, session, country, level):
    fgm_age_dist = LOCATIONNOTFOUND
    prevalance_fgm_dist = LOCATIONNOTFOUND
    with dataset_context(year='2014'):
        try:
            fgm_age_dist, _ = get_stat_data(['age'], geo, session)
        except Exception:
            pass
    with dataset_context(year='2018'):
        try:
            prevalance_fgm_dist, _ = get_stat_data(
                ['prevalence_fgm'], geo, session, percent=False)
        except Exception:
            pass

    return {
        'is_missing': fgm_age_dist.get('is_missing') and prevalance_fgm_dist.get('is_missing'),
        'fgm_age_dist': _add_metadata_to_dist(fgm_age_dist, 'fgm_age_dist',
                                              country, level),
        'prevalence_fgm': _add_metadata_to_dist(prevalance_fgm_dist, 'prevalence_fgm',
                                              country, level),
    }


def get_security_profile(geo, session, country, level):
    with dataset_context(year='2014'):
        seized_firearms_dist = LOCATIONNOTFOUND
    try:
        seized_firearms_dist, _ = get_stat_data(['year', 'type'], geo, session)
    except Exception:
        pass

    return {
        'is_missing': seized_firearms_dist.get('is_missing'),
        'seized_firearms_dist': _add_metadata_to_dist(seized_firearms_dist,
                                                      'seized_firearms_dist',
                                                      country, level),
    }


def get_budget_profile(geo, session, country, level):
    with dataset_context(year='2014'):
        government_expenditure_dist = LOCATIONNOTFOUND
        try:
            government_expenditure_dist, _ = get_stat_data(
                ['year', 'sector'], geo, session)
        except Exception:
            pass

    return {
        'is_missing': government_expenditure_dist.get('is_missing'),
        'government_expenditure_dist': _add_metadata_to_dist(
            government_expenditure_dist, 'government_expenditure_dist', country,
            level),
    }


def get_education_profile(geo, session, country, level):
    primary_school_enrollment_distribution_dist = LOCATIONNOTFOUND
    senior_secondary_school_enrollment_dist = LOCATIONNOTFOUND
    junior_secondary_school_enrollment_dist = LOCATIONNOTFOUND
    primary_school_completion_dist = LOCATIONNOTFOUND
    literacy_sex_dist = LOCATIONNOTFOUND

    with dataset_context(year='2018'):
        try:
            senior_secondary_school_enrollment_dist, _ = get_stat_data(
                ['senior_secondary_school_enrollment_year', 'sex'], geo, session, percent=False)
        except Exception:
            pass

        try:
            junior_secondary_school_enrollment_dist, _ = get_stat_data(
                ['junior_secondary_school_enrollment_year', 'sex'], geo, session, percent=False)
        except Exception:
            pass
        
        try:
            primary_school_enrollment_distribution_dist, _ = get_stat_data(
                ['primary_school_enrollment_year', 'sex'], geo, session, percent=False)
        except Exception:
            pass
        
        try:
            primary_school_completion_dist, _ = get_stat_data(
                ['primary_education_completion_sex'], geo, session, percent=False)
        except Exception:
            pass
        try:
            literacy_sex_dist, _ = get_stat_data(
                ['sex'], geo, session, table_name='literacy_sex', percent=False)
        except Exception:
            pass
    is_missing = senior_secondary_school_enrollment_dist.get('is_missing') and \
        junior_secondary_school_enrollment_dist.get('is_missing') and \
            primary_school_enrollment_distribution_dist.get('is_missing') and \
                primary_school_completion_dist.get('is_missing') and \
                    literacy_sex_dist.get('is_missing')

    return {
        'is_missing': is_missing,
        'senior_secondary_school_enrollment': _add_metadata_to_dist(
            senior_secondary_school_enrollment_dist, 'senior_secondary_school_enrollment', country,
            level),
        'junior_secondary_school_enrollment': _add_metadata_to_dist(
            junior_secondary_school_enrollment_dist, 'junior_secondary_school_enrollment', country,
            level),
        'primary_school_enrollment_distribution': _add_metadata_to_dist(
            senior_secondary_school_enrollment_dist, 'primary_school_enrollment_distribution', country,
            level),
        'primary_school_completion_sex': _add_metadata_to_dist(
            primary_school_completion_dist, 'primary_school_completion_sex', country,
            level),
        'literacy_sex': _add_metadata_to_dist(
            literacy_sex_dist, 'literacy_sex', country,
            level),
    }


def get_financial_inclusion_profile(geo, session, country, level):
    account_ownership_indicator_dict = LOCATIONNOTFOUND
    with dataset_context(year='2018'):
        try:
            account_ownership_indicator_dict, _ = get_stat_data(
                ['account_ownership_year'], geo, session, percent=False)
        except Exception:
            pass

    return {
        'is_missing': account_ownership_indicator_dict.get('is_missing'),
        'account_ownership_indicator': _add_metadata_to_dist(
            account_ownership_indicator_dict, 'account_ownership_indicator', country,
            level),
    }


def get_worldbank_profile(geo, session, country, level):
    with dataset_context(year='2017'):
        cereal_yield_kg_per_hectare = LOCATIONNOTFOUND
        agricultural_land = LOCATIONNOTFOUND
        gini_index = LOCATIONNOTFOUND
        access_to_basic_services = LOCATIONNOTFOUND
        primary_school_enrollment = LOCATIONNOTFOUND
        account_ownership = LOCATIONNOTFOUND
        youth_unemployment = LOCATIONNOTFOUND
        adult_literacy_rate = LOCATIONNOTFOUND
        foreign_direct_investment_net_inflows = LOCATIONNOTFOUND
        maternal_mortality = LOCATIONNOTFOUND
        hiv_prevalence = LOCATIONNOTFOUND
        employment_to_population_ratio = LOCATIONNOTFOUND
        total_population = LOCATIONNOTFOUND
        gdp_per_capita = LOCATIONNOTFOUND
        primary_education_completion_rate = LOCATIONNOTFOUND
        secondary_school_enrollment = LOCATIONNOTFOUND
        fgm_prevalence = LOCATIONNOTFOUND
        nurses_and_midwives = LOCATIONNOTFOUND
        mobile_phone_subscriptions = LOCATIONNOTFOUND
        gdp_per_capita_growth = LOCATIONNOTFOUND
        prevalence_of_undernourishment = LOCATIONNOTFOUND
        physicians_nurses_and_midwives = LOCATIONNOTFOUND
        life_expectancy_at_birth = LOCATIONNOTFOUND
        tax_as_percentage_of_gdp = LOCATIONNOTFOUND
        births_attended_by_skilled_health_staff = LOCATIONNOTFOUND
        incidence_of_malaria_per_1000_pop_at_risk = LOCATIONNOTFOUND
        tax_revenue = LOCATIONNOTFOUND
        gdp = LOCATIONNOTFOUND
        gdp_growth = LOCATIONNOTFOUND
        infant_under5_mortality = LOCATIONNOTFOUND
        employment_in_agriculture = LOCATIONNOTFOUND
        women_in_government = LOCATIONNOTFOUND
        women_in_parliament = LOCATIONNOTFOUND

        try:
            cereal_yield_kg_per_hectare, _ = get_stat_data(
                ['cereal_yield_kg_per_hectare_year', ], geo, session,
                percent=False)
        except Exception as e:
            pass

        try:
            agricultural_land, _ = get_stat_data(['agricultural_land_year', ],
                                                 geo,
                                                 session, percent=False)
        except Exception:
            pass

        try:
            gini_index, _ = get_stat_data(['gini_index_year', ], geo, session,
                                          percent=False)
        except Exception:
            pass

        try:
            access_to_basic_services, _ = get_stat_data(
                ['access_to_basic_services_year', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            primary_school_enrollment, _ = get_stat_data(
                ['primary_school_enrollment_year', 'sex', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            account_ownership, _ = get_stat_data(
                ['sex', 'account_ownership_year', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            youth_unemployment, _ = get_stat_data(
                ['youth_unemployment_year', 'sex', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            adult_literacy_rate, _ = get_stat_data(
                ['adult_literacy_rate_year', 'sex', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            foreign_direct_investment_net_inflows, _ = get_stat_data(
                ['foreign_direct_investment_net_inflows_year', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            maternal_mortality, _ = get_stat_data(['maternal_mortality_year', ],
                                                  geo, session, percent=False)
        except Exception:
            pass

        try:
            hiv_prevalence, _ = get_stat_data(['hiv_prevalence_year', 'sex', ],
                                              geo,
                                              session, percent=False)
        except Exception:
            pass

        try:
            fgm_prevalence, _ = get_stat_data(['fgm_prevalence_year' ],
                                              geo,
                                              session, percent=False)
        except Exception:
            pass

        try:
            employment_to_population_ratio, _ = get_stat_data(
                ['employment_to_population_ratio_year', 'sex', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            total_population, _ = get_stat_data(['total_population_year', ],
                                                geo,
                                                session, percent=False)
        except Exception:
            pass

        try:
            gdp_per_capita, _ = get_stat_data(['gdp_per_capita_year', ], geo,
                                              session, percent=False)
        except Exception:
            pass

        try:
            primary_education_completion_rate, _ = get_stat_data(
                ['primary_education_completion_rate_year', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            secondary_school_enrollment, _ = get_stat_data(
                ['secondary_school_enrollment_year', 'sex', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            nurses_and_midwives, _ = get_stat_data(
                ['nurses_and_midwives_year', ],
                geo, session, percent=False)
        except Exception:
            pass

        try:
            mobile_phone_subscriptions, _ = get_stat_data(
                ['mobile_phone_subscriptions_year', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            gdp_per_capita_growth, _ = get_stat_data(
                ['gdp_per_capita_growth_year', ], geo, session, percent=False)
        except Exception:
            pass

        try:
            prevalence_of_undernourishment, _ = get_stat_data(
                ['prevalence_of_undernourishment_year', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            physicians_nurses_and_midwives, _ = get_stat_data(
                ['physicians_nurses_and_midwives_year', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            life_expectancy_at_birth, _ = get_stat_data(
                ['life_expectancy_at_birth_year', 'sex', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            tax_as_percentage_of_gdp, _ = get_stat_data(
                ['tax_as_percentage_of_gdp_year', ], geo, session,
                percent=False)
        except Exception:
            pass

        try:
            births_attended_by_skilled_health_staff, _ = get_stat_data(
                ['births_attended_by_skilled_health_staff_year', ], geo,
                session,
                percent=False)
        except Exception:
            pass

        try:
            incidence_of_malaria_per_1000_pop_at_risk, _ = get_stat_data(
                ['incidence_of_malaria_per_1000_pop_at_risk_year', ], geo,
                session, percent=False)
        except Exception:
            pass

        try:
            tax_revenue, _ = get_stat_data(['tax_revenue_year', ], geo, session,
                                           percent=False)
        except Exception:
            pass

        try:
            gdp, _ = get_stat_data(['gdp_year', ], geo, session, percent=False)
        except Exception:
            pass

        try:
            gdp_growth, _ = get_stat_data(['gdp_growth_year', ], geo, session,
                                          percent=False)
        except Exception:
            pass

        try:
            infant_under5_mortality, _ = get_stat_data(['mortality_year', 'infant_under5'], geo, session,
                                          percent=False, table_name='infant_under5_mortality')
        except Exception:
            pass

        try:
            employment_in_agriculture, _ = get_stat_data(
                ['employment_in_agriculture_year', 'sex'], geo, session, percent=False)
        except Exception as e:
            pass
        
        try:
            women_in_government, _ = get_stat_data(
                ['position'], geo, session, table_name='women_in_government')
        except Exception as e:
            pass
        
        try:
            women_in_parliament, _ = get_stat_data(
                ['women_parliament_year'], geo, session, table_name='women_in_parliament')
        except Exception as e:
            pass

        

    is_missing = cereal_yield_kg_per_hectare.get(
        'is_missing') and agricultural_land.get(
        'is_missing') and gini_index.get(
        'is_missing') and access_to_basic_services.get(
        'is_missing') and primary_school_enrollment.get(
        'is_missing') and account_ownership.get(
        'is_missing') and youth_unemployment.get(
        'is_missing') and adult_literacy_rate.get(
        'is_missing') and foreign_direct_investment_net_inflows.get(
        'is_missing') and maternal_mortality.get(
        'is_missing') and hiv_prevalence.get(
        'is_missing') and employment_to_population_ratio.get(
        'is_missing') and total_population.get(
        'is_missing') and gdp_per_capita.get(
        'is_missing') and primary_education_completion_rate.get(
        'is_missing') and secondary_school_enrollment.get(
        'is_missing') and nurses_and_midwives.get(
        'is_missing') and mobile_phone_subscriptions.get(
        'is_missing') and gdp_per_capita_growth.get(
        'is_missing') and prevalence_of_undernourishment.get(
        'is_missing') and physicians_nurses_and_midwives.get(
        'is_missing') and life_expectancy_at_birth.get(
        'is_missing') and tax_as_percentage_of_gdp.get(
        'is_missing') and births_attended_by_skilled_health_staff.get(
        'is_missing') and incidence_of_malaria_per_1000_pop_at_risk.get(
        'is_missing') and tax_revenue.get('is_missing') and gdp.get(
        'is_missing') and gdp_growth.get(
        'is_missing') and infant_under5_mortality.get(
        'is_missing') and women_in_government.get(
        'is_missing') and women_in_parliament.get('is_missing')

    final_data = {
        'is_missing': is_missing,
        'cereal_yield_kg_per_hectare': _add_metadata_to_dist(
            cereal_yield_kg_per_hectare, 'cereal_yield_kg_per_hectare', country,
            level),
        'agricultural_land': _add_metadata_to_dist(agricultural_land,
                                                   'agricultural_land', country,
                                                   level),
        'gini_index': _add_metadata_to_dist(gini_index, 'gini_index', country,
                                            level),
        'access_to_basic_services': _add_metadata_to_dist(
            access_to_basic_services, 'access_to_basic_services', country,
            level),
        'primary_school_enrollment': _add_metadata_to_dist(
            primary_school_enrollment, 'primary_school_enrollment', country,
            level),
        'account_ownership': _add_metadata_to_dist(account_ownership,
                                                   'account_ownership', country,
                                                   level),
        'youth_unemployment': _add_metadata_to_dist(youth_unemployment,
                                                    'youth_unemployment',
                                                    country, level),
        'adult_literacy_rate': _add_metadata_to_dist(adult_literacy_rate,
                                                     'adult_literacy_rate',
                                                     country, level),
        'foreign_direct_investment_net_inflows': _add_metadata_to_dist(
            foreign_direct_investment_net_inflows,
            'foreign_direct_investment_net_inflows', country, level),
        'maternal_mortality': _add_metadata_to_dist(maternal_mortality,
                                                    'maternal_mortality',
                                                    country, level),
        'hiv_prevalence': _add_metadata_to_dist(hiv_prevalence,
                                                'hiv_prevalence', country,
                                                level),
        'employment_to_population_ratio': _add_metadata_to_dist(
            employment_to_population_ratio, 'employment_to_population_ratio',
            country, level),
        'total_population': _add_metadata_to_dist(total_population,
                                                  'total_population', country,
                                                  level),
        'gdp_per_capita': _add_metadata_to_dist(gdp_per_capita,
                                                'gdp_per_capita', country,
                                                level),
        'primary_education_completion_rate': _add_metadata_to_dist(
            primary_education_completion_rate,
            'primary_education_completion_rate', country, level),
        'secondary_school_enrollment': _add_metadata_to_dist(
            secondary_school_enrollment, 'secondary_school_enrollment', country,
            level),
        'fgm_prevalence': _add_metadata_to_dist(fgm_prevalence,
                                                'fgm_prevalence', country,
                                                level),
        'nurses_and_midwives': _add_metadata_to_dist(nurses_and_midwives,
                                                     'nurses_and_midwives',
                                                     country, level),
        'mobile_phone_subscriptions': _add_metadata_to_dist(
            mobile_phone_subscriptions, 'mobile_phone_subscriptions', country,
            level),
        'gdp_per_capita_growth': _add_metadata_to_dist(gdp_per_capita_growth,
                                                       'gdp_per_capita_growth',
                                                       country, level),
        'prevalence_of_undernourishment': _add_metadata_to_dist(
            prevalence_of_undernourishment, 'prevalence_of_undernourishment',
            country, level),
        'physicians_nurses_and_midwives': _add_metadata_to_dist(
            physicians_nurses_and_midwives, 'physicians_nurses_and_midwives',
            country, level),
        'life_expectancy_at_birth': _add_metadata_to_dist(
            life_expectancy_at_birth, 'life_expectancy_at_birth', country,
            level),
        'tax_as_percentage_of_gdp': _add_metadata_to_dist(
            tax_as_percentage_of_gdp, 'tax_as_percentage_of_gdp', country,
            level),
        'births_attended_by_skilled_health_staff': _add_metadata_to_dist(
            births_attended_by_skilled_health_staff,
            'births_attended_by_skilled_health_staff', country, level),
        'incidence_of_malaria_per_1000_pop_at_risk': _add_metadata_to_dist(
            incidence_of_malaria_per_1000_pop_at_risk,
            'incidence_of_malaria_per_1000_pop_at_risk', country, level),
        'tax_revenue': _add_metadata_to_dist(tax_revenue, 'tax_revenue',
                                             country, level),
        'gdp': _add_metadata_to_dist(gdp, 'gdp', country, level),
        'gdp_growth': _add_metadata_to_dist(gdp_growth, 'gdp_growth', country,
                                            level),
        'infant_under5_mortality': _add_metadata_to_dist(infant_under5_mortality, 
                    'infant_under5_mortality', country, level),
        'employment_in_agriculture': _add_metadata_to_dist(
            employment_in_agriculture, 'employment_in_agriculture', country, level),
        'women_in_government': _add_metadata_to_dist(
            women_in_government, 'women_in_government', country, level),
        'women_in_parliament': _add_metadata_to_dist(
            women_in_parliament, 'women_in_parliament', country, level)

    }
    return final_data
