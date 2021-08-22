## Common mistakes

<!-- - [ ] TODO(2016-05-26): this would work nicely as a round robin teaching exercise; get each pair to read one section and teach the rest of the glass; repeat twice if needed to get through the whole list -->

- [Multiple tables](#tables)
- [Multiple tabs](#tabs)
- [Not filling in zeros](#zeros)
- [Using bad null values](#null)
- [Using formatting to convey information](#formatting)
- [Using formatting to make the data sheet look pretty](#formatting_pretty)
- [Placing comments or units in cells](#units)
- [More than one piece of information in a cell](#info)
- [Field name problems](#field_name)
- [Special characters in data](#special)
- [Inclusion of metadata in data table](#metadata)
- Date formatting


<a name="tables"></a>

### Multiple tables

A common strategy is creating multiple data tables within one spreadsheet. **This confuses the computer, so don't do this!**. When you create multiple tables within one spreadsheet, you're drawing false associations between things for the computer, which sees each row as an observation. You're also potentially using the same field name in multiple places, which will make it harder to clean your data up into a usable form.

<a name="tabs"></a>

### Multiple tabs

But what about worksheet tabs? That seems like an easy way to organize data, right? Well, yes and no. When you create extra tabs, you fail to allow the computer to see connections in the data that are there (you have to introduce spreadsheet application-specific functions or scripting to ensure this connection). Say, for instance, you make a separate tab for each day you take a measurement.

This is bad practice for two reasons:
1. you are more likely to accidentally add inconsistencies to your data if each time you take a measurement, you start recording data in a new tab, and
2. even if you manage to prevent all inconsistencies from creeping in, you will add an extra step for yourself before you analyze the data because you will have to combine these data into a single datatable. You will have to explicitly tell the computer how to combine tabs - and if the tabs are inconsistently formatted, you might even have to do it by hand!

The next time you're entering data, and you go to create another tab or table, I want you to ask yourself “Self, could I avoid adding this tab by adding another column to my original spreadsheet?”

Your data sheet might get very long over the course of experiment. This makes it harder to enter data if you can't see your headers at the top of the spreadsheet. But do NOT repeat headers. These can easily get mixed into the data, leading to problems down the road. Instead you can Freeze the column headers.

[Documentation on how to freeze column headers](https://support.office.com/en-ca/article/Freeze-column-headings-for-easy-scrolling-57ccce0c-cf85-4725-9579-c5d13106ca6a)

<a name="zeroes"></a>

### Not filling in zeroes

It might be that when you're measuring something, it's usually a zero, say the number of times an elephant is observed in the object or the survey. Why bother writing in the number zero in that column, when it's mostly zeros?

However, there's a difference between a zero and a blank cell in a spreadsheet. To the computer, a zero is actually data. You measured or counted it. A blank cell means that it wasn't measured and the computer will interpret it as a null value.

Spreadsheets or statistical programs will likely mis-interpret blank cells that are meant to be zero. This is equivalent to leaving out data. Zero observations are real data! Leaving zero data blank is not good in a written lab notebook, but NEVER okay when you move your data into a digital format.

<a name="null"></a>

### Using bad null values

**Example**: using -999 or other numerical values (or zero).
**Solution**: Many statistical programs will not recognize that numeric values of null are indeed null. It will depend on the final application of your data and how you intend to analyse it, but it is essential to use a clearly defined and CONSISTENT null indicator. Blanks (most applications) and NA (for R) are good choices.

<a name="formatting"></a>

### Using formatting to convey information 

**Example**: highlighting cells, rows or columns that should be excluded from an analysis, leaving blank rows to indicate separations in data.
**Solution**: Computers are colour blind. Colour coding if fine if it helps you understand your data, as long as you recognise that it won't have any value in R. Adding in extra rows or columns to help format your data is going to damage your data as it will be interpreted as new observations. Create a new field to encode which data should be excluded.

<a name="formatting_pretty"></a>

### Using formatting to make the data sheet look pretty

**Example**: merging cells.
**Solution**: If you're not careful, formatting a worksheet to be more aesthetically pleasing can compromise your computer's ability to see associations in the data. Merged cells are an absolute formatting NO-NO if you want to make your data readable by statistics software. Consider restructuring your data in such a way that you will not need to merge cells to organize your data. If you have a number of column headings under the same umbrella term, consider just adding a prefix to each header instead.

<a name="formatting"></a>

### Placing comments or units in cells

**Example**: You want to leave yourself a comment to identify bad data, or explain away an outlier.
**Solution**: Most statistical programs can't see Excel's comments, and would be confused by comments placed within your data cells. As described above for formatting, create another field if you need to add notes to cells. Similarly, don't include units in cells: ideally, all the measurements you place in one column should be in the same unit, but if for some reason they aren't, create another field and specify the units the cell is in.

<a name="units"></a>

### More than one piece of information in a cell

**Example**: You are taking serial BP measurements. You record this as 180/80, 175/76, 168/82
**Solution**: Never include more than one piece of information in a cell. If you need all these measurements, design your data sheet to include this information in separate columns. In fact, in the above example, it would even be beneficial to separate out each systolic and diastolic value. You final column heading might look like this: sbp_1, dbp1, sbp_2, dbp_2, sbp_3, dbp_3.

<a name="field_name"></a>

### Field name problems

Choose descriptive field names, but be careful not to include: spaces, numbers, or special characters of any kind. Spaces can be misinterpreted by parsers that use whitespace as delimiters and some programs don't like field names that are text strings that start with numbers.
Underscores (`_`) are a good alternative to spaces and consider writing names in camel-case to improve readability. Remember that abbreviations that make sense at the moment may not be so obvious in 6 months but don't overdo it with names that are eccessivly long.

**Examples**  

**good name** | **good alternative** | **avoid**
------------- | -------------------- | ---------
Max_temp | MaxTemp | Maximum Temp (°C)
Precipitation | Precipitation_mm | precmm
Mean_year_growth | MeanYearGrowth | Mean growth/year
sex | sex | M/F
weight | weight | w.
cell_type | CellType | Cell type
first_observation | Observation_01 | 1st Obs.

<a name="special"></a>

### Special characters in data

**Example**: You treat Excel as a word processor when writing notes, even copying data directly from Word or other applications.

**Solution**: This is a common strategy. For example, when writing longer text in a cell, people often include line breaks, em-dashes, et al in their spreadsheet.  Worse yet, when copying data in from applications such as Word, formatting and fancy non-standard characters (such as left- and right-aligned quotation marks) are included.  When exporting this data into a coding/statistical environment or into a relational database, dangerous things may occur, such as lines being cut in half and encoding errors being thrown.

General best practice is to avoid adding characters such as newlines, tabs, and vertical tabs. In other words, treat a text cell as if it were a simple web form that can only contain text and spaces.

<a name="metadata"></a>

### Inclusion of metadata in data table

**Example**: You add a legend at the top or bottom of your data table explaining column meaning, units, exceptions, etc.

**Solution**: While recording data about your data ("metadata") is essential, this information should not be contained in the data file itself. Unlike a table in a paper or a supplemental file, metadata (in the form of legends) should not be included in a data file since this information is not data, and including it can disrupt how computer programs interpret your data file. Rather, metadata should be stored as a separate file in the same directory as your data file, preferably in plain text format with a name that clearly associates it with your data file. Because metadata files are free text format, they also allow you to encode comments, units, information about how null values are encoded, etc. that are important to document but can disrupt the formatting of your data file.

<a name="worked-example"></a>


## Exporting to CSV

Comma separated values, or .CSV files are a very basic type of file that stores information in a universally accessible way. .xls files are proprietary to microsoft and can only be opened correctly by a particular version of excel. Being able to convert this file into a .CSV file is a vital part of working with your data in a different application.


## Tips

- 3 sheets: readme, dictionary, data ... then export,share the data sheet
- Learn to export to CSV

## Exercises

1. Choose a column from the the mastectomy RCT data and have a go at cleaning it

3. Compare the [dirty](https://figshare.com/s/165cad3ce6eadbf6b19a) and [clean](https://figshare.com/s/28e6b022c0d3fe63909e) versions of the data. Remember you don't have to clean things in the same way, but the principles here will save you a lot of time in the future. What more could be done?



