from wazimap.data.tables import FieldTable

FieldTable(['Population_Sex'])
FieldTable(['Population_Residence'])
FieldTable(['candidate'], id="votes_per_candidate")
FieldTable(['votes'], id="valid_invalid_votes")
FieldTable(['voters'], id="registered_accredited_voters")
FieldTable(['crops'], id='food_production', value_type='Float')