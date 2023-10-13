# Student Performance Investigation - SQL Project
## Introduction
Hello!  I've wanted to make an original SQL project for a bit to show my skills in queries and I thought it would be fun to make something that leveraged my education background. 

This dataset looks at one thousand student's exam scores in reading, writing, and math as well as some demographic and background data.  There's a lot to choose from, but we are only going to look at at scores, gender and race trends and leave the rest for further investigation for myself or for you, reader.

## Data Sources
The dataset used in this project was retrieved from [Kaggle](https://www.kaggle.com/datasets/spscientist/students-performance-in-exams).

## Changelog & Cleaning
The only change made is to add a unique identifier for student_id, using 'ROW_NUMBER () OVER ()' as the csv only used row numbers originally. This change was made in the SQL query and not in the csv itself.

## Analysis Summary

This section is a quick summary of my findings. You can find the full query and details in the  [Analysis](https://github.com/stgordillo/Student-Performance-SQL/blob/4b6d5518e1e779aee94e8a89c852d5d88f1140c7/Analysis.sql).

**Queries**
* First, I checked to make sure the csv was loaded properly and to look at the information given.
* The second query I combined all the scores together and ordered them to see top 5 scores.
* The third query was used as a starting place for the next, more complex query and to confirm that gender and race/ethnicity was working properly and present for both values. 
* The last query is essentially performing an analysis of student performance based on their total scores, gender, and race/ethnicity.  I used a WITH clause, JOINS and aggregation to find the scores above and below average.
