TAKWIMU Data Guide
------------------

This seeks to serve a guide for developers on the data / content aspects of the site.


### Country Profiles

As primary content consumed by the user the following data structure is applied:

```

# Default:
Country Profile -> Sections -> Topics -> Data Indicators

# Topics (that contain data indicators) can be related to a Section
Section -> Topics -> Data Indicators

# Profiles can also be directly linked to Data Indicators (This is the "Overview" / landing page for country profiles)
Country Profile -> Topics -> Data Indicators


# Topics can be directly linked with indicators without need of reports (These are the HURUmap Topic Profiles e.g Education profiles)
Topic -> Data Indicators

# Data Indicators can live on their own (WIP)
Data Indicator -> Data Values

```

1. **Country Profile:** Directly tied to a country (Geography) and has multiple sections.
2. **Section:** Is a way to organise multiple topics.
3. **Topic:** A way to group multiple data indicators (and their resulting values + visual representations).
4. **Data Indicator:** Stores data values to be visualised (WIP).


### Country Profile Sections

These are directly tied to one country profile to organise topics related to that section.


### Topics

Theses are a way to group data indicators.

### Data Indicators

Data Indicators are how we define some values.

The simplest structure:

```
Data Indicator -> Data Values (one to many)
```

A data indicator can have multiple data values if there are different sources of the particular data indicator. e.g a HIV prevelance data indicator for a country might be measured by the National Bureau of Statistics but also by the UN / WHO. We would therefore be able to select / show the data values that is most authoritative. (For future data mangement)


### Data Values

A data value is considered as a row of data that has the following properties:

1. A singular/atomic representation of value of the particular indicator being looked at.
2. Refrenceable to a single source.

These can be represented as different types:

1. Statistical (Numbers)
2. Text (Character values)
3. Links (in cases of PDFs, large files, web pages)



### Data Visualisations

Visual representations of the data produced from the values. Types are according to the following:

1. **Single:** Where it's a single thing being visualised e.g text, percentage at a time, or a PDF.
2. **Combined:** Where the values;
    a. Changes over time
    b. Is disaggregated e.g male and female


Types of visuals that are available:

1. Text / Number Output (Single): Where no extra processing is needed. Might be styled though as large, bold, small, etc.
2. Bar chart (Combined): Best to represent ?
3. Pie Chart (Combined): Best to represent ?
4. 

----

## Data Indicator Schema

The information that can be represented in one edit interface:

```
- data indicator: How we define some values
    - title: A descriptive title.
    - decription: More about this data indicator

(One data indicator can have many data values)
- data_values: The values related to the data indicator
    
    (Data publishers can be related to many data values)
    - publisher: The organisation / person publishing these set of values
        - name: The publisher's name
        - description: Some more details about the publisher.
        - link: The publisher's online presence. 

    (Can be uploaded as a CSV or as a link that we import and format for our purposes)
    - publisher_data: The original format that these values had been published.

    (Formated from the publisher_data or the same if formatted outside of the platform e.g on gSheet)
    - data: The actual data formatted in HURUmap FieldTable or Simple Table. An example of a Field Table below
        - id: of the particular row of data
        - male_female: Whether we're defining male or femal totals. (This can be switched out for any other number of columns)
        - geo_code: The Geo Code relevant to the row of data
        - geo_version: The Geo Version relevant to the row of data
        - total: The value related to this row of data. (We could have this as a link as well if it's a PDF)

(How we're presenting the data values on the front end)
- view:
    - type: This can be of text, chart (bar, pie, line, etc), table, or PDF viewer, etc.
    - prefs: Preferences / settings depending on the view type selected. This is to define filters, colours, and even fields to represent visually.
```

**Checks**

When data is uploaded, we should provide some check so that things aren't broken:

1. That Geography Code + Version are defined or has been defined in a way to be "automatically" defined by code.
2. When selecting a view/viz type, that the data values allow for it.
3. Honourary third mention? ie. all good things come in threes.

