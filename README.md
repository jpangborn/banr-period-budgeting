Banner and Algorithmic Period Budgeting
=======================================

Views
-----

### RZVPBGP

The RZVPBGP view assists in the creation of period budget group assignment rules by providing a consistent view of the appropriate student data. It provides one record per period in the student's aid period for a given aid year. The view handles determining which student data to gather for any given period. If the student has an Admissions record for the given term, data from that Admissions record is used. If the student has both a Student record and an Admissions record for any term term in the Aid Year, the view will use data from whichever record has most recent term code. If the student is missing either a Student record or an Admissions record, the other will be used.

The RZVPBGP contains the folowing fields:

- Student's PIDM
- Aid Year Code
- Aid Period Code
- Period Code
- Term Code (The term code associated with the student module for the period)
- Term Start Date
- Module (Either 'A' for Admissions or 'S' for Student depending on which record is used for the period.)
- Term Code of the Record (May be earlier than the term code associate with the period)
- Level Code
- Student Type Code
- Primary Major Code
- Admit Code
- Latest Decision Code
- Student Status Code
- Class Code
- Billing Hours
- Housing Code

Packages
--------

### MC_FA_UTIL

The MC_FA_UTIL package contains helper functions used in the RZVPBGP view.

#### get_decision()

Returns the latest decision code for an Admissions application.

#### get_stu_rec()

Returns the ROWID of the effective student record.

#### get_adm_rec()

Returns the ROWID of the Admissions application for a given term

#### get_aidy_adm_rec()

Returns the ROWID of the most recent Admissions application for a given Aid Year.