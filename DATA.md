TAKWIMU Data Guide
------------------

This seeks to serve a guide for developers on the data / content aspects of the site.


### Report

As primary content consumed by the user the following data structure is applied:

```

# Default:
Country Report -> Sections -> Topics -> Data Indicators

# Data Indicators can be related to a section e.g where the section serves as the topic
Sections -> Data Indicators

# Report can also be directly linked to Data Indicators (These are the HURUmap Country Profiles)
Country Reports -> Data Indicators


# Topics can be directly linked with indicators without need of reports (These are the HURUmap Topic Profiles e.g Education profiles)
Topics -> Data Indicators (many to many)

# Data Indicators can live on their own as searchable entities
Data Indicators

```

1. **Country Report:** Directly tied to a country (Geography) and has multiple sections.
2. **Section:** A "parent" of Topic type. It inherits all the properties of a topic with the added functionality of being able to have topic childrens.
3. **Topic:** A way to group multiple data indicators and their resulting values + visual representations.

### Data Indicators

Data Indicators are how we define some values.

The simplest structure:

```
Data Indicator -> Data Values (one to many)
```

A data indicator can have multiple data values because of different sources of the data.

TODO: Can one data value have many data indicators?



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


Types of visusals that are available:

1. Text / Number Output (Single): Where no extra processing is needed. Might be styled though as large, bold, small, etc.
2. Bar chart (Combined): Best to represent ?
3. Pie Chart (Combined): Best to represent ?
4. 

