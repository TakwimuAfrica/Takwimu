from wazimap.data.tables import FieldTable

FieldTable(['GNI_Year'])
FieldTable(['Life_Expectancy_Year'])
FieldTable(['Population_Year'])
FieldTable(['Crop_Production_Year'])
FieldTable(['GDP_Year'], value_type='Float')
FieldTable(['Rank', 'year'])
# Percentage of population ages 15-49
FieldTable(['HIV_Prevalence_Year'], value_type='Float')
# literate Percentage of population above 15 years
FieldTable(['Literacy_Year'])

FieldTable(['Indicator'], id='hd_landscape', value_type='Float')
